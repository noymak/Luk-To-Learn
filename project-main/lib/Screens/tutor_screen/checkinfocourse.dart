import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/courses_controller.dart';

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
                                  Text(
                                    'ครูสอน ภาษาอังกฤษ',
                                    style: GoogleFonts.kanit(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    (courseController.listCourses.length > 0
                                        ? courseController.listCourses[0]
                                            ['tutorname']
                                        : 'no'),
                                    style: GoogleFonts.kanit(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: kPrimaryColor1,
                                  ),
                                  child:
                                      Image.asset('assets/images/profile.jpg')),
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
                                (courseController.listCourses.length > 0
                                    ? courseController.listCourses[0]['email']
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
                            (courseController.listCourses.length > 0
                                ? courseController.listCourses[0]['price']
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
                            (courseController.listCourses.length > 0
                                ? courseController.listCourses[0]
                                    ['detailcourse']
                                : 'no'),
                            style: GoogleFonts.kanit(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: size.width,
                            height: 120,
                            decoration: BoxDecoration(
                                color: kPrimaryColor1,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          DropdownSearch(
                            items: ["ภาษาไทย", "ภาษาอังกฤษ", "คณิตศาสตร์", "วิทยาศาสตร์"],
                            // InputDecoration(labelText: "Name"),
                            onChanged: print,
                            selectedItem: "เลือกประเภท",
                            validator: (String? item) {
                              if (item == null)
                                return "Required field";
                              else if (item == "ภาษาไทย")
                                return "Invalid item";
                              else
                                return null;
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/infocourse');
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
