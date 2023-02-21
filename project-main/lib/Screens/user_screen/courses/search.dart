import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/model/courses.dart';
import 'package:luk_to_learn/widgets/appbar.dart';
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
      // appBar: Themeappbar(),
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height,
              color: kPrimaryLightColor,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  
                  GetBuilder<showCourse>(
                    init: showCourse(),
                    builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              width: size.width,
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
                                      color: kPrimaryColors,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   "Recommended Course",
                                   style: GoogleFonts.kanit(
                                       fontSize: 26, fontWeight: FontWeight.w400),
                                 ),
                                 
                                 
                               ],
                             ),
                           ),
                          Container(
                            width: size.width,
                            height: size.height*0.4,
                            
                            
                            child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount:
                                        _controller.dataShow.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        // child: Text('${_controller.dataShow[index]['coursename']}'),
                                        child: cartlistbuy(
                                            linkImage: _controller.dataShow[index]['backgroudTutor'],
                                            nameCourse: _controller.dataShow[index]['coursename'],
                                            price: int.parse(_controller.dataShow[index]['price']),
                                            // rate: _controller.dataShow[index]['coursename'],
                                            name: _controller.dataShow[index]['tutorname'],
                                            // level: _controller.dataShow[index]['coursename'],
                                            detail: _controller.dataShow[index]['detailcourse'],
                                            profileTutors:_controller.dataShow[index]['image']),
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
                                  fontWeight: FontWeight.w400,
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
                         
                        ],
                      );
                    }
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
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
