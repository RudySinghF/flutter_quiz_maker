import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_maker/models/QNA.dart';
import 'package:quiz_maker/models/ScoreModel.dart';
import 'package:quiz_maker/models/quizmodel.dart';
import 'package:quiz_maker/pages/createquiz.dart';
import 'package:velocity_x/velocity_x.dart';

class QuizRepository extends GetxController {
  static QuizRepository get instance => Get.find();
  @override
  onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  final _db = FirebaseFirestore.instance;
  Future<void> setQuizdata(Map<String, dynamic> quizdata, String quizId) async {
    await _db
        .collection("Quiz")
        .doc(quizId)
        .set(quizdata)
        .whenComplete(() => Get.snackbar("Success", "Quiz has been created",
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

  Future<List<modelquiz>> getquizdata() async {
    final snapshot = await _db.collection("Quiz").get();
    final quizData =
        snapshot.docs.map((e) => modelquiz.fromSnapshot(e)).toList();
    return quizData;
  }

  Future<List<Results>> getresult() async {
    final snapshot = await _db.collection("Marks").get();
    final quizData = snapshot.docs.map((e) => Results.fromSnapshot(e)).toList();
    return quizData;
  }

  Future<String> getquizid(String id) async {
    final snapshot = await _db.collection("Quiz").doc().get().toString();
    return snapshot;
  }

  Future<void> addquestion(Map<String, dynamic> quesdata, String quesid) async {
    await _db
        .collection("Quiz")
        .doc(quizid)
        .collection("Question")
        .add(quesdata)
        .whenComplete(() => Get.snackbar("Success", "Question has been created",
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
}
