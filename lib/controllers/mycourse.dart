import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class myCourse extends GetxController {
  List courseData = [];
  List dataShow = [];
  List dataFromFirebase = [];

  void onInit() {
    super.onInit();
    fetchDataFromFirebase();
  }


  Future<void> fetchDataFromFirebase() async {
    final data = await FirebaseFirestore.instance
        .collection('MyCourse')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('collectionCourse')
        .get();
        if (data.docs.isEmpty) return;
    update();
    data.docs.forEach((element) {
      //print(element.data());
      dataShow.add(element.data());
      print(dataShow[0]);
      // dataFromFirebase.add(element.data());
    });
    update();
  }

  Future<void> fetchDataFromFirebase2() async {
    final data = await FirebaseFirestore.instance
        .collection('MyCourse')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('collectionCourse')
        .get();
        if (data.docs.isEmpty) return;
    update();

  }

 
}