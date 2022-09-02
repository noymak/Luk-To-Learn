import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

class CoursesController extends GetxController {
  final TextEditingController tutornameController = TextEditingController();
  final TextEditingController coursenameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController detailcourseController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  List listCourses = [];

  void onInit(){
    super.onInit();
    
  }

  checkEmpty(){
    if (tutornameController.text.isEmpty && coursenameController.text.isEmpty && priceController.text.isEmpty && detailcourseController.text.isEmpty && emailController.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

Future addDetail(
      String tutorname, String coursename, String price, String detailcourse, BuildContext context, String email) async {
    if (checkEmpty()) {
      return MotionToast.error(description: Text("Error"),
        title: Text("กรอกข้อมูลให้ครบถ้วน",style: TextStyle(fontWeight: FontWeight.bold)),
        ).show(context);
    } else {
      await FirebaseFirestore.instance
        .collection('courses')
        .add({
      'tutorname': tutorname,
      'coursename': coursename,
      'price': price,
      'detailcourse': detailcourse,
      'email' : email,
    }).then((value) { Get.toNamed('/checkinfocourse');
    showDetail(email);
    MotionToast.info(description: Text("การเพิ่มรายการ"),
        title: Text("ทำรายการสำเร็จ",style: TextStyle(fontWeight: FontWeight.bold)),
        ).show(context);
    });
    }
  }

Future showDetail(String email,) async {
    await FirebaseFirestore.instance
        .collection('courses').where('email',isEqualTo: email)
        .get().then((value) {
          value.docs.forEach((element) {
            listCourses.add(element.data());
            
            // print(listCourses.toString());
          });
           print(listCourses[0]['tutorname']);
           update(['Getdetail']);
          // print(value.docs[0]['tutorname']);
        });
    // print(email);
      }

  }
