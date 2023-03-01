import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/mycourse.dart';
import 'package:luk_to_learn/widgets/cartlistbuy.dart';
import 'package:luk_to_learn/widgets/mylist.dart';

import '../../../model/courses.dart';

class Mycourses extends StatefulWidget {
  const Mycourses({Key? key}) : super(key: key);

  @override
  State<Mycourses> createState() => _MycoursesState();
}

class _MycoursesState extends State<Mycourses> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = Get.put(myCourse());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColors,
        title: Text('Mycourses'),
      ),
      body: GetBuilder<myCourse>(
        init: myCourse(),
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Courses",
                            style: GoogleFonts.kanit(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          SizedBox(
                            height: size.height,
                             child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount:
                                      controller.dataShow.length,
                                  itemBuilder: (context, index) {
                                    print(controller.dataShow[index] ['urlVideo'].toString());
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                      // child: Text('${_controller.dataShow[index]['coursename']}'),
                                      child: mylist(
                                          backgroundTutor: controller.dataShow[index]['backgroudTutor'],
                                          courseName: controller.dataShow[index]['coursename'],
                                          price: (controller.dataShow[index]['price']),
                                          type: controller.dataShow[index]['type'],
                                          tutorName: controller.dataShow[index]['tutorname'],
                                          detailCourse: controller.dataShow[index]['detailcourse'],
                                          image:controller.dataShow[index]['image'], 
                                          video:controller.dataShow[index] ['urlVideo'],),
                                    );
                                  }),
                          )
                    
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
  