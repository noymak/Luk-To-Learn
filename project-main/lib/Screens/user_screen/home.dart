import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/cart_controller.dart';
import 'package:luk_to_learn/controllers/show_course_controller.dart';
import 'package:luk_to_learn/model/banner.dart';
import 'package:luk_to_learn/model/courses.dart';

import '../../widgets/Indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final String? linkImage;
  late final String? nameCourse;
  late final int? price;
  // final String? rate;
  late final String? name;
  // final String? level;
  late final String? detail;
  late final String? profileTutors;

  var _selectedIndex = 0;

  int _currentPage = 0;

  var cartController = Get.put(CartContorller());
  var _controllerShowCourse = Get.put(showCourse());
  late Timer _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _controllerShowCourse.dataFromFirebase.length) {
        _currentPage++;
        setState(() {});
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // var shoppingCart = Get.arguments[0];
    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColors, actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.shopping_bag),
          onPressed: () {
            Get.toNamed('/cart');
          },
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    GetBuilder<showCourse>(
                        init: showCourse(),
                        builder: (_) {
                          return _controllerShowCourse.isLoading
                              ? Center(child: CircularProgressIndicator())
                              : Banner(
                                  size, _controllerShowCourse, _pageController);
                        }),
                    SizedBox(
                      height: 10,
                    ),

                    // Indicator
                    GetBuilder<showCourse>(
                        init: showCourse(),
                        builder: (context) {
                          return _controllerShowCourse.isLoading
                              ? Container()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ...List.generate(
                                      _controllerShowCourse
                                          .dataFromFirebase.length,
                                      (index) => Indicator(
                                        isActive: _selectedIndex == index
                                            ? true
                                            : false,
                                      ),
                                    ),
                                  ],
                                );
                        }),
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
                            GetBuilder<showCourse>(
                                init: showCourse(),
                                builder: (context) {
                                  return _controllerShowCourse.isLoading
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : Container(
                                          width: size.width,
                                          height: 200,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: _controllerShowCourse
                                                .dataShow.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Get.toNamed('/coursehome',
                                                      arguments: [
                                                        _controllerShowCourse
                                                                .dataShow[index]
                                                            ['tutorname'],
                                                        _controllerShowCourse
                                                                .dataShow[index]
                                                            ['coursename'],
                                                        _controllerShowCourse
                                                                .dataShow[index]
                                                            ['detailcourse'],
                                                        _controllerShowCourse
                                                                .dataShow[index]
                                                            ['backgroundTutor'],
                                                        _controllerShowCourse
                                                                .dataShow[index]
                                                            ['type'],
                                                        _controllerShowCourse
                                                                .dataShow[index]
                                                            ['price'],
                                                        _controllerShowCourse
                                                                .dataShow[index]
                                                            ['image'],
                                                        _controllerShowCourse
                                                                .dataShow[index]
                                                            ['video'],
                                                        
                                                            
                                                      ]);
                                                },
                                                child: Container(
                                                  width: 300,
                                                  margin:
                                                      EdgeInsetsDirectional.all(
                                                          10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
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
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                }),
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
  Widget Banner(
      Size size, showCourse controller, PageController _pageController) {
    return Container(
      width: size.width,
      height: size.height / 4,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
          //test
          // print(_selectedIndex);
        },
        // itemCount: controller.dataFromFirebase.length,
        itemCount: coursesInfo.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed('/courses', arguments: [
                coursesInfo[index].nameCourse,
                coursesInfo[index].detail,
                coursesInfo[index].profileTutors,
                coursesInfo[index]
                // controller.dataFromFirebase[index]['coursename'],
                // controller.dataFromFirebase[index]['detailcourse'],
                // controller.dataFromFirebase[index]['tutorname'],
              ]);
              //print('${controller.dataFromFirebase[index]['tutorname']}');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage('${coursesInfo[index].image}'),
                    // image: NetworkImage(
                    //     '${controller.dataFromFirebase[index]['image']}'),
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
