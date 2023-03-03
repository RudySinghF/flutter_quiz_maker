import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_maker/Repository/facultyrepository.dart';
import 'package:quiz_maker/firebase/faculty_auth.dart';
import 'package:quiz_maker/models/faculty.dart';

class facultysignupcontroller extends GetxController {
  static facultysignupcontroller get instance => Get.find();
  final emailfaculty = TextEditingController();
  final passwordfaculty = TextEditingController();
  final facultyname = TextEditingController();
  final phone = TextEditingController();
  final FacultyRepo = Get.put(FacultyRepository());

  void registerfaculty(String emailfaculty, String passwordfaculty) {
    facultyauthentication.instance
        .createUserWithEmailandPassword(emailfaculty, passwordfaculty);
  }

  void phoneAuthentication(String phone) {
    facultyauthentication.instance.phoneAuthentication(phone);
  }

  Future<void> createUserfaculty(Facultymodel user) async {
    await FacultyRepo.createFaculty(user);
    registerfaculty(user.email, user.password);
  }

  void facultylogin(String emailfaculty, String passwordfaculty) {
    facultyauthentication.instance
        .signUserWithEmailandPassword(emailfaculty, passwordfaculty);
  }
}
