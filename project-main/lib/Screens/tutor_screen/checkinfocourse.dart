import 'package:dropdown_button2/dropdown_button2.dart';
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

    final List<String> items = [
      'ภาษาไทย',
      'ภาษาอังกฤษ',
      'คณิตศาสตร์',
      'วิทยาศาสตร์',
      'เคมี',
      'ฟิสิกซ์',
      'ศิลปะ',
      'การออกกำลังกาย',
    ];
    String? selectedValue;

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
                              ),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: [
                                      Icon(
                                        Icons.list,
                                        size: 16,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'sadsa',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellow,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: items
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as String;
                                    });
                                    print(selectedValue);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_drop_down_circle,
                                  ),
                                  iconSize: 14,
                                  iconEnabledColor: Colors.yellow,
                                  iconDisabledColor: Colors.grey,
                                  buttonHeight: 50,
                                  buttonWidth: size.width,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: kPrimaryColors,
                                  ),
                                  buttonElevation: 2,
                                  itemHeight: 30,
                                  itemPadding: const EdgeInsets.only(
                                      left: 40, right: 14),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: size.width*0.9,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: kPrimaryColors,
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(40),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(-20, 0),
                                ),
                              ),
                            ),
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
