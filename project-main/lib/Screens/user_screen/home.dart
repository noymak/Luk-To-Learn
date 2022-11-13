import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/controllers/show_course_controller.dart';
import 'package:luk_to_learn/model/banner.dart';

import '../../widgets/Indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _controllerShowCourse = Get.put(showCourse());
    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.095,
              color: Color(0xff6360FF),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 300,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ยินดีต้อนรับสู่ Luk to Learn',
                        style: GoogleFonts.kanit(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),

                    //Banner
                    Banner(size, _controllerShowCourse),
                    SizedBox(
                      height: 10,
                    ),

                    // Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          _controllerShowCourse.dataFromFirebase.length,
                          (index) => Indicator(
                            isActive: _selectedIndex == index ? true : false,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: size.width,
                      // เพิ่มขนาด scroll
                      height: size.height * 0.35,
                      color: Color.fromARGB(255, 230, 230, 236),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            // Text
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'คอร์สทั้งหมด',
                                style: GoogleFonts.kanit(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                            ),
                            // ListView
                            Container(
                              width: size.width,
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    _controllerShowCourse.dataShow.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 300,
                                    margin: EdgeInsetsDirectional.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          '${_controllerShowCourse.dataShow[index]['image']}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 3,
                                          blurRadius: 7,
                                          color: Colors.black26,
                                          offset: Offset(-1, 5),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Banner
  Widget Banner(Size size, showCourse controller) {
    return Container(
      width: size.width,
      height: size.height / 4,
      child: PageView.builder(
        controller: PageController(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
          //test
          // print(_selectedIndex);
        },
        itemCount: controller.dataFromFirebase.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed('/courses',
              arguments: [
                controller.dataFromFirebase[index]['coursename'],
                controller.dataFromFirebase[index]['detailcourse'],
                controller.dataFromFirebase[index]['tutorname'],
              ]);
              //print('${controller.dataFromFirebase[index]['tutorname']}');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                        '${controller.dataFromFirebase[index]['image']}'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 7,
                      color: Colors.black26,
                      offset: Offset(-2, 6),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
