import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_maker/controllers/quizcontroller.dart';
import 'package:quiz_maker/models/quizmodel.dart';
import 'package:quiz_maker/pages/addquestion.dart';
import 'package:quiz_maker/pages/bottom_nav_faculty.dart';
import 'package:quiz_maker/pages/faculty_home_page.dart';
import 'package:random_string/random_string.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class quizcreator extends StatefulWidget {
  const quizcreator({super.key});

  @override
  State<quizcreator> createState() => _quizcreatorState();
}

final _formkey = GlobalKey<FormState>();
final controller = Get.put(quizcontroller());
String quizid = randomAlphaNumeric(20);
String userid = randomAlphaNumeric(20);

class _quizcreatorState extends State<quizcreator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Create Quiz",
                          style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: MediaQuery.of(context).size.height * 0.700,
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 0.1,
                              blurRadius: 1)
                        ]),
                    child: Column(
                      children: [
                        Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Image Url",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.rubik().fontFamily,
                                        fontSize: 13,
                                        // fontWeight: FontWeight.bold
                                      )),
                                  padding: EdgeInsets.symmetric(horizontal: 8),
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
                                  height: 50,
                                  width: 265,
                                  child: TextFormField(
                                    controller: controller.url,
                                    style: TextStyle(color: Colors.black87),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        border: InputBorder.none,
                                        hintText: 'Quiz Image Url (Optional)',
                                        hintStyle: TextStyle(
                                            color: Colors.black38,
                                            fontFamily:
                                                GoogleFonts.rubik().fontFamily,
                                            fontSize: 15)),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Title",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.rubik().fontFamily,
                                        fontSize: 13,
                                        // fontWeight: FontWeight.bold
                                      )),
                                  padding: EdgeInsets.symmetric(horizontal: 8),
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
                                  height: 50,
                                  width: 265,
                                  child: TextFormField(
                                    controller: controller.name,
                                    style: TextStyle(color: Colors.black87),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        hintText: 'Quiz Title',
                                        hintStyle: TextStyle(
                                            color: Colors.black38,
                                            fontFamily:
                                                GoogleFonts.rubik().fontFamily,
                                            fontSize: 15)),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Description",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.rubik().fontFamily,
                                        fontSize: 13,
                                        // fontWeight: FontWeight.bold
                                      )),
                                  padding: EdgeInsets.symmetric(horizontal: 8),
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
                                  height: 50,
                                  width: 265,
                                  child: TextFormField(
                                    controller: controller.description,
                                    style: TextStyle(color: Colors.black87),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        hintText: 'Quiz Description',
                                        hintStyle: TextStyle(
                                            color: Colors.black38,
                                            fontFamily:
                                                GoogleFonts.rubik().fontFamily,
                                            fontSize: 15)),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Timer(mins)",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.rubik().fontFamily,
                                        fontSize: 13,
                                        // fontWeight: FontWeight.bold
                                      )),
                                  padding: EdgeInsets.symmetric(horizontal: 8),
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
                                  height: 50,
                                  width: 265,
                                  child: TextFormField(
                                    controller: controller.url,
                                    style: TextStyle(color: Colors.black87),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        border: InputBorder.none,
                                        hintText: 'Enter only number',
                                        hintStyle: TextStyle(
                                            color: Colors.black38,
                                            fontFamily:
                                                GoogleFonts.rubik().fontFamily,
                                            fontSize: 15)),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                                  // final quiz = modelquiz(
                                                  //     id: randomAlphaNumeric(
                                                  //         20),
                                                  //     quizname:
                                                  //         controller.name.text,
                                                  //     quizUrl: controller
                                                  //         .url.text
                                                  //         .trim(),
                                                  //     quizDesc: controller
                                                  //         .description.text
                                                  //         .trim());
                                                  // quizcontroller.instance
                                                  //     .inputquizdata(quiz);
                                                  Map<String, String> quizmap =
                                                      {
                                                    "QuizID": quizid,
                                                    "QuizImageURL": controller
                                                        .url.text
                                                        .trim(),
                                                    "Title": controller
                                                        .name.text
                                                        .trim(),
                                                    "Description": controller
                                                        .description.text
                                                        .trim(),
                                                   
                                                  };

                                                  quizcontroller.instance
                                                      .setquizdata(
                                                          quizmap, quizid);

                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              addquestion())));
                                                }
                                              },
                                              // => movetohome(context),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 15, 82, 182),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30))),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Next",
                                                      style: TextStyle(
                                                          fontFamily: GoogleFonts
                                                                  .montserrat()
                                                              .fontFamily,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
