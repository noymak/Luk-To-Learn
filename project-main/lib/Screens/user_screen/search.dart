import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/model/courses.dart';
import 'package:luk_to_learn/widgets/cartlistbuy.dart';

import '../../controllers/courses_controller.dart';
import '../../controllers/show_course_controller.dart';

class ScearchScreen extends StatefulWidget {
  const ScearchScreen({Key? key}) : super(key: key);

  @override
  State<ScearchScreen> createState() => _ScearchScreenState();
}

class _ScearchScreenState extends State<ScearchScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _controller = Get.put(showCourse());
    var _controllerCourse = Get.put(CoursesController());
    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              color: Color(0xff6360FF),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                            Text(
                              "Back",
                              style: GoogleFonts.kanit(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                          size: 32,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 230, 236),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: GetBuilder<showCourse>(
                      init: showCourse(),
                      builder: (_) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: size.width / 1.5,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                  bottomLeft: Radius.circular(18),
                                  bottomRight: Radius.circular(18),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  onChanged: ((value) {
                                  _controller.onSearch(value);
                                  print(value);
                                }),
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    border: InputBorder.none,
                                    suffixIcon: Icon(
                                      Icons.search,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: size.width,
                              height: 120,
                              
                              child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount:
                                          _controllerCourse.listCourse.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: cartlistbuy(
                                              linkImage: _controllerCourse.listCourse[index]['backgroudTutor'],
                                              nameCourse: _controllerCourse.listCourse[index]['coursename'],
                                              price: int.parse(_controllerCourse.listCourse[index]['price']),
                                              // rate: _controllerCourse.listCourse[index]['coursename'],
                                              name: _controllerCourse.listCourse[index]['tutorname'],
                                              // level: _controllerCourse.listCourse[index]['coursename'],
                                              detail: _controllerCourse.listCourse[index]['detailcourse'],
                                              profileTutors:_controllerCourse.listCourse[index]['image']),
                                        );
                                      }),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Browser Catagory",
                                  style: GoogleFonts.kanit(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Wrap(
                                  children: [
                                    Category(width: 100, height: 50, text: 'Tekno'),
                                    Category(
                                        width: 100, height: 50, text: 'Business'),
                                    Category(width: 100, height: 50, text: 'Math'),
                                    Category(width: 100, height: 50, text: 'Thai'),
                                    Category(
                                        width: 100, height: 50, text: 'English'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Recommended Course",
                                    style: GoogleFonts.kanit(
                                        fontSize: 26, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListView.builder(
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
                                ],
                              ),
                            ),
                          ],
                        );
                      }
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

  Widget Category(
      {required String text, required double width, required double height}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: Color(0xff6360FF),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.kanit(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
