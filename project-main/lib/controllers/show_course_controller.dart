import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class showCourse extends GetxController {
  bool isLoading = false;
  List courseData = [];
  List dataShow = [];
  List dataFromFirebase = [];

  void onInit() {
    super.onInit();
    // fetchDataFromFirebase();
  }


  // Future<void> fetchDataFromFirebase() async {
  //   isLoading = true;
  //   final data = await FirebaseFirestore.instance.collection('category').get();
  //   update();
  //   data.docs.forEach((element) {
  //     //print(element.data());
  //     dataShow.add(element.data());
  //     dataFromFirebase.add(element.data());
  //   });
  //   isLoading = false;
  //   update();
  // }

  void onSearch(keyword) {
    dataShow = dataFromFirebase.where((element) {
      return (element['coursename'] as String).contains(keyword);
    }).toList();
    update();
  }
}
