import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:quiz_maker/controllers/quizcontroller.dart';
import 'package:quiz_maker/models/QNA.dart';
import 'package:quiz_maker/models/quizmodel.dart';
import 'package:quiz_maker/pages/addquestion.dart';
import 'package:quiz_maker/pages/bottom_nav_faculty.dart';
import 'package:quiz_maker/pages/createquiz.dart';
import 'package:quiz_maker/pages/faculty_home_page.dart';
import 'package:quiz_maker/pages/random.dart';
import 'package:random_string/random_string.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addquestion extends StatefulWidget {
  const addquestion({super.key});

  @override
  State<addquestion> createState() => _addquestionState();
}

class _addquestionState extends State<addquestion> {
  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(quizcontroller());
  bool _isloading = false;
  String quesid = randomAlphaNumeric(20);
  bool op1 = false;
  bool op2 = false;
  bool op3 = false;
  bool op4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isloading
          ? SingleChildScrollView(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          : Form(
              key: _formkey,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            height: MediaQuery.of(context).size.height * 0.100,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Add Questions",
                                      style: TextStyle(
                                          fontFamily: GoogleFonts.montserrat()
                                              .fontFamily,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: SizedBox(
                                        height: 30,
                                        width: 120,
                                        child: AnimatedContainer(
                                          duration: Duration(seconds: 3),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: ((context) =>
                                                            bottom_nav_faculty())));
                                              },
                                              // => movetohome(context),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30))),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.navigate_before,
                                                    color: Colors.black,
                                                  ),
                                                  Text(
                                                    "Go Back",
                                                    style: TextStyle(
                                                        fontFamily: GoogleFonts
                                                                .montserrat()
                                                            .fontFamily,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            height: MediaQuery.of(context).size.height * 0.715,
                            width: MediaQuery.of(context).size.width * 0.9,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade600,
                                      spreadRadius: 0.1,
                                      blurRadius: 1)
                                ]),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Question",
                                          style: TextStyle(
                                            fontFamily:
                                                GoogleFonts.rubik().fontFamily,
                                            fontSize: 13,
                                            // fontWeight: FontWeight.bold
                                          )),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 6,
                                              offset: Offset(0, 2))
                                        ],
                                      ),
                                      height: 40,
                                      width: 265,
                                      child: TextFormField(
                                        controller: controller.question,
                                        style: TextStyle(color: Colors.black87),
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            border: InputBorder.none,
                                            hintText: 'Enter question',
                                            hintStyle: TextStyle(
                                                color: Colors.black38,
                                                fontFamily: GoogleFonts.rubik()
                                                    .fontFamily,
                                                fontSize: 15)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Option 1",
                                          style: TextStyle(
                                            fontFamily:
                                                GoogleFonts.rubik().fontFamily,
                                            fontSize: 13,
                                            // fontWeight: FontWeight.bold
                                          )),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 6,
                                              offset: Offset(0, 2))
                                        ],
                                      ),
                                      height: 40,
                                      width: 265,
                                      child: TextFormField(
                                        controller: controller.option1,
                                        style: TextStyle(color: Colors.black87),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            hintText: 'Enter Option 1',
                                            hintStyle: TextStyle(
                                                color: Colors.black38,
                                                fontFamily: GoogleFonts.rubik()
                                                    .fontFamily,
                                                fontSize: 15)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Option 2",
                                          style: TextStyle(
                                            fontFamily:
                                                GoogleFonts.rubik().fontFamily,
                                            fontSize: 13,
                                            // fontWeight: FontWeight.bold
                                          )),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 6,
                                              offset: Offset(0, 2))
                                        ],
                                      ),
                                      height: 40,
                                      width: 265,
                                      child: TextFormField(
                                        controller: controller.option2,
                                        style: TextStyle(color: Colors.black87),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            hintText: 'Enter Option 2',
                                            hintStyle: TextStyle(
                                                color: Colors.black38,
                                                fontFamily: GoogleFonts.rubik()
                                                    .fontFamily,
                                                fontSize: 15)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Option 3",
                                          style: TextStyle(
                                            fontFamily:
                                                GoogleFonts.rubik().fontFamily,
                                            fontSize: 13,
                                            // fontWeight: FontWeight.bold
                                          )),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 6,
                                              offset: Offset(0, 2))
                                        ],
                                      ),
                                      height: 40,
                                      width: 265,
                                      child: TextFormField(
                                        controller: controller.option3,
                                        style: TextStyle(color: Colors.black87),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            hintText: 'Enter Option 3',
                                            hintStyle: TextStyle(
                                                color: Colors.black38,
                                                fontFamily: GoogleFonts.rubik()
                                                    .fontFamily,
                                                fontSize: 15)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Option 4",
                                          style: TextStyle(
                                            fontFamily:
                                                GoogleFonts.rubik().fontFamily,
                                            fontSize: 13,
                                            // fontWeight: FontWeight.bold
                                          )),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 6,
                                              offset: Offset(0, 2))
                                        ],
                                      ),
                                      height: 40,
                                      width: 265,
                                      child: TextFormField(
                                        controller: controller.option4,
                                        style: TextStyle(color: Colors.black87),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            hintText: 'Enter Option 4',
                                            hintStyle: TextStyle(
                                                color: Colors.black38,
                                                fontFamily: GoogleFonts.rubik()
                                                    .fontFamily,
                                                fontSize: 15)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Correct answer",
                                          style: TextStyle(
                                            fontFamily:
                                                GoogleFonts.rubik().fontFamily,
                                            fontSize: 13,
                                            // fontWeight: FontWeight.bold
                                          )),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 6,
                                              offset: Offset(0, 2))
                                        ],
                                      ),
                                      height: 40,
                                      width: 265,
                                      child: TextFormField(
                                        controller: controller.correctoption,
                                        style: TextStyle(color: Colors.black87),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            hintText: 'Enter correct answer',
                                            hintStyle: TextStyle(
                                                color: Colors.black38,
                                                fontFamily: GoogleFonts.rubik()
                                                    .fontFamily,
                                                fontSize: 15)),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: SizedBox(
                                          height: 40,
                                          width: 120,
                                          child: AnimatedContainer(
                                            duration: Duration(seconds: 3),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  if (_formkey.currentState!
                                                      .validate()) {
                                                    Map<String, String>
                                                        quesmap = {
                                                      "QuesID": quesid,
                                                      "Question": controller
                                                          .question.text,
                                                      "Option 1": controller
                                                          .option1.text,
                                                      "Option 2": controller
                                                          .option2.text,
                                                      "Option 3": controller
                                                          .option3.text,
                                                      "Option 4": controller
                                                          .option4.text,
                                                      "Correct answer":
                                                          controller
                                                              .correctoption
                                                              .text,
                                                    };

                                                    quizcontroller.instance
                                                        .inputquesdata(
                                                            quesmap, quesid);
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: ((context) =>
                                                                bottom_nav_faculty())));
                                                  }
                                                },
                                                // => movetohome(context),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30))),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Submit",
                                                      style: TextStyle(
                                                          fontFamily: GoogleFonts
                                                                  .montserrat()
                                                              .fontFamily,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: SizedBox(
                                          height: 40,
                                          width: 120,
                                          child: AnimatedContainer(
                                            duration: Duration(seconds: 3),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  if (_formkey.currentState!
                                                      .validate()) {
                                                    Map<String, String>
                                                        quesmap = {
                                                      "QuesID": quesid,
                                                      "Question": controller
                                                          .question.text,
                                                      "Option 1": controller
                                                          .option1.text,
                                                      "Option 2": controller
                                                          .option2.text,
                                                      "Option 3": controller
                                                          .option3.text,
                                                      "Option 4": controller
                                                          .option4.text,
                                                      "Correct answer":
                                                          controller
                                                              .correctoption
                                                              .text,
                                                    };
                                                    quizcontroller.instance
                                                        .inputquesdata(
                                                            quesmap, quizid);
                                                  }
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              addquestion())));
                                                },
                                                // => movetohome(context),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 15, 82, 182),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30))),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "Add",
                                                        style: TextStyle(
                                                            fontFamily: GoogleFonts
                                                                    .montserrat()
                                                                .fontFamily,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
