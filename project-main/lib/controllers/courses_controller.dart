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

Future addDetail(
      String tutorname, String coursename, String price, String detailcourse, BuildContext context, String email) async {
    await FirebaseFirestore.instance
        .collection('courses')
        .add({
      'tutorname': tutorname,
      'coursename': coursename,
      'price': price,
      'detailcourse': detailcourse,
      'email' : email,
    });
      MotionToast.info(
        description: Text("เพิ่มรายการสำเร็จแล้ว"),
        title: Text("เพิ่มคอร์ส",style: TextStyle(fontWeight: FontWeight.bold)),
        ).show(context);
    
  }

Future showDetail(
      String tutorname, String coursename, String price, String detailcourse, BuildContext context) async {
    await FirebaseFirestore.instance
        .collection('courses').where('email',isEqualTo: emailController.text)
        .get();
      }
  
  }
