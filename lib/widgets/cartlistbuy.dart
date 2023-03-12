import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/Screens/courses_screen/coursesdetail.dart';
import 'package:luk_to_learn/constants.dart';

class cartlistbuy extends StatelessWidget {
  const cartlistbuy(
      {Key? key,
      
      required this.linkImage,
      required this.nameCourse,
      required this.price,
      required this.type,
      required this.name,
      // required this.level,
      required this.detail,
      required this.profileTutors,
      })
      : super(key: key);

  
  final String? linkImage;
  final String? nameCourse;
  final int? price;
  final String? type;
  final String? name;
  // final String? level;
  final String? detail;
  final String? profileTutors;

  @override
  Widget build(BuildContext context) {
    print(profileTutors);
    // print(nameCourse);
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: (() {
            Get.toNamed(('/coursedata')
            , arguments: [
              name,
              nameCourse,
              detail,
              profileTutors,
              type,
              price,
              linkImage,
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
                    child: linkImage == ''
                        ? Container(
                            color: Colors.amber,
                          )
                        : Image.network(
                            linkImage!,
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
                        nameCourse!,
                        style: GoogleFonts.kanit(
                          textStyle: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${price} THB',
                        style: GoogleFonts.kanit(
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
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
                            name!,
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
