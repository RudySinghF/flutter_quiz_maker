import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_maker/clientmodels/quizbuilder.dart';
import 'package:quiz_maker/controllers/quizcontroller.dart';

class contentwidget extends StatefulWidget {
  const contentwidget({super.key});

  @override
  State<contentwidget> createState() => _contentwidgetState();
}

class _contentwidgetState extends State<contentwidget> {
  final showscores = Get.put(quizcontroller());
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: showscores.getScores(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                // modelquiz quizdetails = snapshot.data as modelquiz;
                return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          // height: 200,
                          width: MediaQuery.of(context).size.width * 0.6,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16)),
                                    image: DecorationImage(
                                        image: const NetworkImage(
                                            "https://medicaldialogues.in/h-upload/2022/06/21/179012-results-2.webp"),
                                        fit: BoxFit.cover)),
                                padding: EdgeInsets.all(1),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 38,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 5),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                snapshot
                                                    .data![index].studentname,
                                                style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.rubik()
                                                            .fontFamily,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 12)),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(snapshot.data![index].exam,
                                                style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.rubik()
                                                            .fontFamily,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                    fontSize: 14))
                                          ]),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade600,
                                                spreadRadius: 0.1,
                                                blurRadius: 1)
                                          ]),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              "${snapshot.data![index].marks}/${snapshot.data![index].totalquestions}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: GoogleFonts.rubik()
                                                    .fontFamily,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 21, 104, 229),
                                                fontSize: 12,
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }));
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return Center(
                  child: Text("Something went wrong"),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
