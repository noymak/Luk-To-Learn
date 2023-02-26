import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/widgets/cartlistbuy.dart';

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColors,
        title: Text('Mycourses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
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
                            Text(
                              "My Courses",
                              style: GoogleFonts.kanit(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                      //       ...List.generate(
                      //   coursesInfo.length,
                      //   (index) => cartlistbuy(
                          
                      //     linkImage: coursesInfo[index].image!,
                      //     nameCourse: coursesInfo[index].nameCourse!,
                      //     // level: coursesInfo[index].level!,
                      //     name: coursesInfo[index].name!,
                      //     price: coursesInfo[index].price!,
                      //     type: coursesInfo[index].type!,
                      //     detail: coursesInfo[index].detail!,
                      //     profileTutors: coursesInfo[index].profileTutors!,
                      //   ),
                      // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
  