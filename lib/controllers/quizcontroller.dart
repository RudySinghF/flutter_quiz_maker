import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_maker/Repository/QuizRepository.dart';
import 'package:quiz_maker/firebase/faculty_auth.dart';
import 'package:quiz_maker/models/QNA.dart';
import 'package:quiz_maker/models/ScoreModel.dart';
import 'package:quiz_maker/models/quizmodel.dart';
import 'package:quiz_maker/pages/createquiz.dart';
import 'package:random_string/random_string.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class quizcontroller extends GetxController {
  static quizcontroller get instance => Get.find();
  final url = TextEditingController();
  final description = TextEditingController();
  final name = TextEditingController();
  final question = TextEditingController();
  final option1 = TextEditingController();
  final option2 = TextEditingController();
  final option3 = TextEditingController();
  final option4 = TextEditingController();
  final correctoption = TextEditingController();
  // final id = randomAlphaNumeric(16);
  final _quizRepo = Get.put(QuizRepository());
  final _authRepo = Get.put(facultyauthentication());
  Future<void> setquizdata(Map<String, dynamic> data, String id) async {
    await _quizRepo.setQuizdata(data, id);
  }

  Future<void> inputquesdata(
      Map<String, dynamic> quesdata, String quesid) async {
    await _quizRepo.addquestion(quesdata, quesid);
  }

  Future<void> closeinstance() async {
    _quizRepo.onClose();
  }

  Future<List<modelquiz>> getQuizdata() async {
    return await _quizRepo.getquizdata();
  }

  Future<List<Results>> getScores() async {
    return await _quizRepo.getresult();
  }
}
