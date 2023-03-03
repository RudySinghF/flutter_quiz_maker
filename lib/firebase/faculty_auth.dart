import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:quiz_maker/exceptions/firebaseExceptions.dart';
import 'package:quiz_maker/pages/bottom_nav_faculty.dart';
import 'package:quiz_maker/pages/faculty_home_page.dart';
import 'package:quiz_maker/pages/getStarted.dart';
import 'package:quiz_maker/pages/splash_screen.dart';

class facultyauthentication extends GetxController {
  static facultyauthentication get instance => Get.find();

  final _authfaculty = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_authfaculty.currentUser);
    firebaseUser.bindStream(_authfaculty.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      Get.offAll(() => const bottom_nav_faculty());
    } else {
      Get.to(() => const splashscreen());
    }
  }

  Future<void> phoneAuthentication(String phone) async {
    await _authfaculty.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (credentials) async {
        await _authfaculty.signInWithCredential(credentials);
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'Phone number provided is not valid');
        } else {
          Get.snackbar('Error', 'Something went wrong. Please try again');
        }
      },
      codeSent: (verificationId, forceResendingToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _authfaculty.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _authfaculty.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const bottom_nav_faculty())
          : Get.to(() => const getstarted());
    } on FirebaseAuthException catch (e) {
      final ex = signinWithEmailandPasswordexceptions.code(e.code);
      print('FIREBASE AUTH EXCEPTION-${ex.message}');
      throw ex;
    } catch (_) {
      const ex = signupWithEmailandPasswordexceptions();
      print('EXCEPTION-${ex.message}');
      throw ex;
    }
  }

  Future<void> signUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _authfaculty.signInWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const bottom_nav_faculty())
          : Get.to(() => const getstarted());
    } on FirebaseAuthException catch (e) {
      final ex = signinWithEmailandPasswordexceptions.code(e.code);
      throw ex;
    } catch (_) {
      const ex = signinWithEmailandPasswordexceptions();
      print('EXCEPTION-${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async => await _authfaculty.signOut();
}
