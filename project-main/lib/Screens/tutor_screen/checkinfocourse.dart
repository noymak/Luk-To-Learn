import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/courses_controller.dart';
import 'package:luk_to_learn/widgets/appbar.dart';

import '../../constants.dart';


class CheckInfoCourse extends StatefulWidget {
  const CheckInfoCourse({Key? key}) : super(key: key);

  @override
  State<CheckInfoCourse> createState() => _CheckInfoCourseState();
}

class _CheckInfoCourseState extends State<CheckInfoCourse> {
  var courseController = Get.find<CoursesController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColors,
      // appBar: Themeappbar(),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          margin: EdgeInsets.only(top: 80),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 230, 230, 236),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ตรวจสอบข้อมูล",
                  style: GoogleFonts.kanit(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GetBuilder<CoursesController>(builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 250,
                                    height: 120,
                                    color: kPrimaryLightColor,
                                    child: Image.network(
                                        courseController.listCoursesId.length >
                                                0
                                            ? courseController.listCoursesId[0]
                                                ['backgroudTutor']
                                            : 'no'),
                                  ),
                                  Text(
                                    'ครูประจำวิชา' +
                                        ' ' +
                                        (courseController.listCoursesId.length >
                                                0
                                            ? courseController.listCoursesId[0]
                                                ['coursename']
                                            : 'no'),
                                    style: GoogleFonts.kanit(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'ชื่อผู้สอน' +
                                        ' ' +
                                        (courseController.listCoursesId.length >
                                                0
                                            ? courseController.listCoursesId[0]
                                                ['tutorname']
                                            : 'no'),
                                    style: GoogleFonts.kanit(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Hero(
                                  tag: 'image',
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        courseController.listCoursesId.length >
                                                0
                                            ? courseController.listCoursesId[0]
                                                ['image']
                                            : 'no'),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'E-mail',
                                style: GoogleFonts.kanit(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                (courseController.listCoursesId.length > 0
                                    ? courseController.listCoursesId[0]['email']
                                    : 'no'),
                                style: GoogleFonts.kanit(
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                          Text(
                            'ราคาคอร์ส',
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            (courseController.listCoursesId.length > 0
                                ? courseController.listCoursesId[0]['price']
                                : 'no'),
                            style: GoogleFonts.kanit(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'ข้อมูลคอร์ส',
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            (courseController.listCoursesId.length > 0
                                ? courseController.listCoursesId[0]
                                    ['detailcourse']
                                : 'no'),
                            style: GoogleFonts.kanit(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // DropdownButton<String>(
                          //   value: catagoryValue,
                          //   icon: Icon(Icons.arrow_drop_down),
                          //   iconSize: 24,
                          //   elevation: 18,
                          //   underline: Container(height: 2,color: Colors.pink,),
                          //   style: ("ภาษาไทย",
                          //     "ภาษาอังกฤษ",
                          //     "คณิตศาสตร์",
                          //     "วิทยาศาสตร์",
                          //     "ศิลปะ",
                          //     "พละศึกษา",
                          //     "เทคโนโลยี").map<DropdownMenuItem<String>>((String value){
                          //       return DropdownMenuItem<String>(child: Text(value),value: value,);
                          //     }).toList(),
                          //     onChanged: (newvalue) {
                          //       catagoryValue = newvalue;
                          //     },

                          
                          // ),
                         
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/infocourse');
                              },
                              child: GestureDetector(
                                                   onTap: () {
                                  courseController.updateCategoryToStorage(context);
                                },
                                child: Container(
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor1,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      'Done',
                                      style: GoogleFonts.kanit(
                                          fontSize: 25,
                                          color: kPrimaryLightColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
