import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

class modelquiz {
  final String? id;
  final String quizname;
  final String quizUrl;
  final String quizDesc;
  const modelquiz({
    this.id,
    required this.quizname,
    required this.quizUrl,
    required this.quizDesc,
  });

  tojson() {
    return {
      // "Id": id,
      "Title": quizname,
      "Description": quizDesc,
      "QuizImageURL": quizUrl
    };
  }

  factory modelquiz.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return modelquiz(
      // id: document.id,
      quizname: data["Title"],
      quizDesc: data["Description"],
      quizUrl: data["QuizImageURL"],
    );
  }
}
