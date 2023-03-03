import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_maker/Repository/facultyrepository.dart';
import 'package:quiz_maker/firebase/faculty_auth.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class FacultyProfileController extends GetxController {
  static FacultyProfileController get instance => Get.find();
  final _faculty = Get.put(facultyauthentication());
  final _facultyRepo = Get.put(FacultyRepository());

  getFacultydata() {
    final email = _faculty.firebaseUser.value?.email;
    if (email != null) {
      return _facultyRepo.getUserEmailfaculty(email);
    } else {
      Get.snackbar("Error", "Login to Continue");
    }
    final name = _faculty.firebaseUser.value?.displayName;
    if (name != null) {
      return _facultyRepo.getUserNamefaculty(name);
    }
  }
}
