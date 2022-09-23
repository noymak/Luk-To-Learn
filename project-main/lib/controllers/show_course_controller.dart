import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class showCourse extends GetxController{

  List  courseData = [];

  void onInit(){
    super.onInit();
    box();
  }

  Future<void> box () async{
    await FirebaseFirestore.instance
    .collection('courses')
    .get().then((value) {
      value.docs.forEach((element) {
        // print(element.data());
        courseData.add(element.data());
      });
    });

    





  }
}