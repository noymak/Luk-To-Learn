import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luk_to_learn/controllers/courses_controller.dart';

class MycourseTutor extends StatefulWidget {
  const MycourseTutor({Key? key}) : super(key: key);

  @override
  State<MycourseTutor> createState() => _MycourseTutorState();
}

class _MycourseTutorState extends State<MycourseTutor> {
  var courseController = Get.find<CoursesController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // courseController.listCoursesId[0]['tutorname'];
    // print(courseController.listCoursesId[0]['tutorname']);
    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                // child: GetBuilder<CoursesController>(
                //   builder: (_) {
                //     // return Text( (courseController.listCoursesId.length > 0 ? courseController.listCoursesId[0]['tutorname'] : 'no') );
                //     // return Text('${courseController.listCoursesId[0]['tutorname']}');
                //     // return Text('data');
                //   }
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
