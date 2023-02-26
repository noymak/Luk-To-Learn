import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/controllers/courses_controller.dart';
import 'package:luk_to_learn/controllers/show_course_controller.dart';

import 'package:luk_to_learn/widgets/cartlistbuy.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../constants.dart';
import '../../model/courses.dart';

class HomeTutor extends StatefulWidget {
  const HomeTutor({Key? key}) : super(key: key);

  @override
  State<HomeTutor> createState() => _HomeTutorState();
}

class _HomeTutorState extends State<HomeTutor> {
  var _showCourseController = Get.put(showCourse());
  // FirebaseFirestore firebaseStorage = FirebaseFirestore.instance;
  // Future <void> downloanImage() async {
  //   // firebaseStorage.ref().child('').getDownloadURL();
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _controllerCourse = Get.put(CoursesController());
    // print(coursesInfo[0].name);
    return Scaffold(
      backgroundColor: kPrimaryColors,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor1,
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,

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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  
                ],
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
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Courses",
                              style: GoogleFonts.kanit(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Total  ${_controllerCourse.listCourse.length}",
                              style: GoogleFonts.kanit(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        StreamBuilder(
                            stream: _controllerCourse.fetchCourse().asStream(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text('process');
                              } else {
                                return Container(
                                  width: size.width,
                                  height: size.height * 0.6,
                                  child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount:
                                          _controllerCourse.listCourse.length,
                                      itemBuilder: (context, index) {
                                        return cartlistbuy(
                                            linkImage: _controllerCourse.listCourse[index]['backgroudTutor'],
                                            nameCourse: _controllerCourse.listCourse[index]['coursename'],
                                            price: int.parse(_controllerCourse.listCourse[index]['price']),
                                            type: _controllerCourse.listCourse[index]['type'],
                                            name: _controllerCourse.listCourse[index]['tutorname'],
                                            // level: _controllerCourse.listCourse[index]['coursename'],
                                            detail: _controllerCourse.listCourse[index]['detailcourse'],
                                            profileTutors:_controllerCourse.listCourse[index]['image']);
                                      }),
                                );
                              }
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
