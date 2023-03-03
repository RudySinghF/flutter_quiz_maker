import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_maker/models/faculty.dart';

class FacultyRepository extends GetxController {
  static FacultyRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createFaculty(Facultymodel faculty) async {
    await _db
        .collection("Faculty")
        .add(faculty.tojson())
        .whenComplete(() => Get.snackbar(
            "Success", "Your account has been created.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor:
                Color.fromARGB(255, 130, 216, 133).withOpacity(0.1),
            colorText: Color.fromARGB(255, 22, 141, 26)))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Please try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color.fromARGB(255, 244, 121, 113).withOpacity(0.1),
          colorText: Color.fromARGB(255, 164, 23, 23));
      print(error.toString());
    });
  }

  Future<Facultymodel> getUserEmailfaculty(String email) async {
    final facultysnapshot =
        await _db.collection("Faculty").where("Email", isEqualTo: email).get();
    final facultyData =
        facultysnapshot.docs.map((e) => Facultymodel.fromSnapshot(e)).single;
    return facultyData;
  }

  Future<Facultymodel> getUserNamefaculty(String name) async {
    final facultysnapshot =
        await _db.collection("Faculty").where("Name", isEqualTo: name).get();
    final facultyData =
        facultysnapshot.docs.map((e) => Facultymodel.fromSnapshot(e)).single;
    return facultyData;
  }

  Future<List<Facultymodel>> getallFaculty() async {
    final facultysnapshot = await _db.collection("Faculty").get();
    final facultyData =
        facultysnapshot.docs.map((e) => Facultymodel.fromSnapshot(e)).toList();
    return facultyData;
  }
}
