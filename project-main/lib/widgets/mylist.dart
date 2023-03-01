import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/controllers/auth_tutor_controller.dart';
import 'package:luk_to_learn/controllers/cart_controller.dart';
import 'package:luk_to_learn/controllers/video_controller.dart';
import 'package:luk_to_learn/model/courses.dart';

import '../../constants.dart';

class mylist extends StatelessWidget {
  const mylist(
      {Key? key,
      
      required this.tutorName,
      required this.courseName,
      required this.detailCourse,
      required this.backgroundTutor,
      required this.type,
      required this.price,
      required this.image,
      required this.video,
      })
      : super(key: key);

  
  final String? tutorName;
  final String? courseName;
  final int? price;
  final String? type;
  final String? detailCourse;
  final String? backgroundTutor;
  final String? image;
  final String? video;

  @override
  Widget build(BuildContext context) {
    // print(nameCourse);
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: (() {
            Get.toNamed(('/mylist')
            , arguments: [
              tutorName,
              courseName,
              detailCourse,
              backgroundTutor,
              type,
              price,
              image,
              video,
            ]
            );
          }),
          child: Container(
            width: size.width,
            height: 135,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      // color: kPrimaryColor1,
                    ),
                    child: image == ''
                        ? Container(
                            color: Colors.amber,
                          )
                        : Image.network(
                            image!,
                            fit: BoxFit.cover,
                          ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseName!,
                        style: GoogleFonts.kanit(
                          textStyle: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      // Text(
                      //   '${price} THB',
                      //   style: GoogleFonts.kanit(
                      //     textStyle: TextStyle(fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 4,
                      // ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            type!,
                            style: GoogleFonts.kanit(
                              textStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Icon(
                            Icons.circle,
                            color: Colors.amber,
                            size: 10,
                          ),
                          Text(
                            tutorName!,
                            style: GoogleFonts.kanit(
                              textStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Icon(
                            Icons.circle,
                            color: Colors.amber,
                            size: 10,
                          ),
                          // Text(
                          //   level!,
                          //   style: GoogleFonts.kanit(
                          //     textStyle: TextStyle(color: Colors.grey),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        
      ],
    );
  }
}
