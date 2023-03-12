import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class tutorContorller extends GetxController {
  final TextEditingController coursenameController = TextEditingController();
  final TextEditingController detailcourseController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  Future updateCourse({
    // required String coursename,
    required String price,
    required String detailcourse,
    required String doc_id,
  }) async {
    print('====' * 100);
    print(doc_id);
    try {
      await FirebaseFirestore.instance
          .collection('courses-new')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('tutor-courses')
          .doc(doc_id)
          .update({
        // 'coursename': coursename,
        'detailcourse': detailcourse,
        'price': price,
      });

      update();
    } catch (e) {
      print(e);
    }
  }
}
