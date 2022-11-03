import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/courses_controller.dart';
import 'package:luk_to_learn/widgets/cartlistbuy.dart';

import '../../model/courses.dart';

class AddCourses extends StatefulWidget {
  const AddCourses({Key? key}) : super(key: key);

  @override
  State<AddCourses> createState() => _AddCoursesState();
}

class _AddCoursesState extends State<AddCourses> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _controllerCourse = Get.put(CoursesController());
    return Scaffold(
      backgroundColor: kPrimaryColors,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: kPrimaryLightColor,
                        ),
                        Text(
                          'Add Courses',
                          style: GoogleFonts.kanit(
                            fontSize: 20,
                            color: kPrimaryLightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: size.width,
              child: Row(
                children: [
                  Hero(
                      tag: 'image',
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fprofile.jpg?alt=media&token=b09dbfef-a9cf-45c2-9d09-ac71c41ca4d8'),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sarah William',
                        style: GoogleFonts.kanit(
                          fontSize: 20,
                          color: kPrimaryLightColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            '14 Courses',
                            style: GoogleFonts.kanit(
                              fontSize: 16,
                              color: kPrimaryLightColor,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.circle,
                            size: 6,
                            color: kPrimaryLightColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '1,400 Students',
                            style: GoogleFonts.kanit(
                              fontSize: 16,
                              color: kPrimaryLightColor,
                            ),
                          ),
                        ],
                      ),
                      // Divider(
                      //   color: Colors.grey,
                      //   thickness: 10,
                      // ),
                    ],
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
                                            // rate: _controllerCourse.listCourse[index]['coursename'],
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/addedcourses');
                        },
                        child: Container(
                          width: 260,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kPrimaryColor1,
                          ),
                          child: Center(
                              child: Text(
                            'Add Courses',
                            style: GoogleFonts.kanit(
                              fontSize: 20,
                              color: kPrimaryLightColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ],
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
