import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/controllers/courses_controller.dart';

import '../../constants.dart';

class MycourseTutor extends StatefulWidget {
  const MycourseTutor({Key? key}) : super(key: key);

  @override
  State<MycourseTutor> createState() => _MycourseTutorState();
}

class _MycourseTutorState extends State<MycourseTutor> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // courseController.listCoursesId[0]['tutorname'];
    // print(courseController.listCoursesId[0]['tutorname']);
    return Scaffold(
        backgroundColor: kPrimaryColors,
        appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor1,
        title: Text('My Courses'),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Hero(
                                      tag: 'image',
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: Image.asset('assets/images/Portrait_Placeholder.png').image,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${FirebaseAuth.instance.currentUser!.email}',
                                          style: GoogleFonts.kanit(
                                            textStyle: TextStyle(
                                              fontSize: 18,
                                              color: kPrimaryLightColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Develop & Instructor',
                                          style: GoogleFonts.kanit(
                                            textStyle: TextStyle(
                                              fontSize: 18,
                                              color: kPrimaryLightColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              Container(
                width: size.width,
                height: size.height,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 230, 236),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    // 
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
