import 'package:cloud_firestore/cloud_firestore.dart';

class Results {
  final String? id;
  final String studentname;
  final String exam;
  final String marks;
  final String totalquestions;
  const Results(
      {this.id,
      required this.studentname,
      required this.exam,
      required this.marks,
      required this.totalquestions});

  tojson() {
    return {
      // "Id": id,
      "Student Name": studentname,
      "Exam": exam,
      "Marks": marks,
      "Total Questions": totalquestions
    };
  }

  factory Results.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return Results(
      id: documentSnapshot.id,
      studentname: data["Student Name"],
      exam: data["Exam"],
      marks: data["Marks"],
      totalquestions: data["Total Questions"],
    );
  }
}
