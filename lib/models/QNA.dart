import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz_maker/models/quizmodel.dart';

class QandA extends modelquiz {
  final String? Qid;
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String correctoption;
  const QandA({
    this.Qid,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.correctoption,
  }) : super(quizDesc: "", quizUrl: "", quizname: "");

  tojson() {
    return {
      "QuesID": Qid,
      "Question": question,
      "Option 1": option1,
      "Option 2": option2,
      "Option 3": option3,
      "Option 4": option4,
      "Correct answer": correctoption
    };
  }

  factory QandA.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return QandA(
      // Qid: documentSnapshot.id,
      question: data["Question"],
      option1: data["Option 1"],
      option2: data["Option 2"],
      option3: data["Option 3"],
      option4: data["Option 4"],
      correctoption: data["Correct answer"],
    );
  }
}
