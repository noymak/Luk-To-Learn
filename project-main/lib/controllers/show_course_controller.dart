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
    fetchDataFromFirebase();
  }


  Future<void> fetchDataFromFirebase() async {
    isLoading = true;
    final data = await FirebaseFirestore.instance
        .collection('courses')
        .get();
        if (data.docs.isEmpty) return;
    update();
    data.docs.forEach((element) {
      //print(element.data());
      dataShow.add(element.data());
      print(dataShow);
      dataFromFirebase.add(element.data());
    });
    isLoading = false;
    update();
  }

  void onSearch(keyword) {
    if (dataFromFirebase.isEmpty) return;
    dataShow = dataFromFirebase.where((element) {
      final courseName = element['coursename'].toString().toLowerCase();
    return courseName.contains(keyword.toLowerCase());
    }).toList();
    update();
  }
}
