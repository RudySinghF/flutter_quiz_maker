import 'package:get/get.dart';

import 'package:quiz_maker/firebase/faculty_auth.dart';
import 'package:quiz_maker/pages/faculty_home_page.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();

  Future<void> verifyOTP(String otp) async {
    var isVerified = await facultyauthentication.instance.verifyOTP(otp);
    isVerified ? Get.offAll(() => const FacultyHomePage()) : Get.back();
  }
}
