import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/widgets/cartlist.dart';
import 'package:luk_to_learn/widgets/cartlistbuy.dart';

import '../../model/courses.dart';

class CoursesDetails extends StatefulWidget {

  @override
  State<CoursesDetails> createState() => _CoursesdetailState();

  static where(bool Function(dynamic listbuy) param0) {}
}

class _CoursesdetailState extends State<CoursesDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(Get.arguments[0].toString());
    var nameTutor = Get.arguments[0];
    var bannerImage = Get.arguments[1];
    var detailCourse = Get.arguments[2];
    var profileImages = Get.arguments[3];
    
    var size = MediaQuery.of(context).size;
    print(profileImages);
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: Container(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Container(
                height: 200,
                width: size.width,
                child: Image.network(
                  bannerImage,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                          profileImages,fit: BoxFit.cover,),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      nameTutor,
                      style: GoogleFonts.kanit(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                    detailCourse,style: GoogleFonts.kanit(
                          fontSize: 18,),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
