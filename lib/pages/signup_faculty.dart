import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_maker/controllers/facultysignupcontroller.dart';
import 'package:quiz_maker/models/faculty.dart';
import 'package:quiz_maker/pages/facultylogin.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class facultysignup extends StatefulWidget {
  const facultysignup({super.key});

  @override
  State<facultysignup> createState() => _facultysignupState();
}

class _facultysignupState extends State<facultysignup> {
  final controller = Get.put(facultysignupcontroller());
  final _formkeysignup = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.270,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomRight,
                            colors: [
                          Color.fromARGB(255, 13, 112, 212),
                          Color.fromARGB(255, 17, 54, 108)
                        ])),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   height: 50,
                          // ),
                          VxBox(
                            child: Text(
                              "Quizz",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontFamily: GoogleFonts.nerkoOne().fontFamily,
                                  fontWeight: FontWeight.bold),
                            ).box.makeCentered().expand(),
                          ).white.roundedFull.square(100).make(),
                        ]),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text("Sign up",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: GoogleFonts.manrope().fontFamily,
                          fontWeight: FontWeight.normal)),
                  SizedBox(height: 20),
                  Form(
                    // autovalidateMode: AutovalidateMode.always,
                    key: _formkeysignup,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
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
                            height: 55,
                            width: 500,
                            child: TextFormField(
                              controller: controller.facultyname,
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return "  * Required";
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.name,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Color.fromARGB(255, 15, 82, 182),
                                  ),
                                  hintText: 'Enter name',
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
                            height: 55,
                            width: 500,
                            child: TextFormField(
                              controller: controller.emailfaculty,
                              // onChanged: (value) {
                              //   email = value;
                              // },
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color.fromARGB(255, 15, 82, 182),
                                  ),
                                  hintText: 'Enter email',
                                  hintStyle: TextStyle(
                                      color: Colors.black38,
                                      fontFamily:
                                          GoogleFonts.rubik().fontFamily,
                                      fontSize: 15)),
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return "  * Required";
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                          SizedBox(
                            height: 15,
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
                            height: 55,
                            width: 500,
                            child: TextFormField(
                              controller: controller.passwordfaculty,
                              // onChanged: (value) {
                              //   password = value;
                              // },
                              obscureText: true,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color.fromARGB(255, 15, 82, 182),
                                  ),
                                  hintText: 'Enter password',
                                  hintStyle: TextStyle(
                                      color: Colors.black38,
                                      fontFamily:
                                          GoogleFonts.rubik().fontFamily,
                                      fontSize: 15)),
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return "  * Required";
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 3),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formkeysignup.currentState!.validate()) {
                              final faculty = Facultymodel(
                                  name: controller.facultyname.text,
                                  email: controller.emailfaculty.text.trim(),
                                  password:
                                      controller.passwordfaculty.text.trim());
                              facultysignupcontroller.instance
                                  .createUserfaculty(faculty);
                            }
                          },
                          // => movetohome(context),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 15, 82, 182),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          // child: loginload
                          //     ? CircularProgressIndicator(
                          //         color: Colors.white,
                          //         strokeWidth: 2,
                          //       )
                          child: Text(
                            "Create account",
                            style: TextStyle(
                                fontFamily: GoogleFonts.manrope().fontFamily,
                                fontSize: 13,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        style: TextStyle(
                            fontFamily: GoogleFonts.rubik().fontFamily,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 13),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => facultylogin())));
                        },
                        child: Text("  Sign in",
                            style: TextStyle(
                                fontFamily: GoogleFonts.rubik().fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Color.fromARGB(255, 15, 82, 182))),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
