import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  Future addMyCourse({
      required String tutorname,
      required String coursename,
      required String detailcourse,
      required String image,
      required String imageBackground,
      required String type,
      required String urlVideo,}
  ) async {
    FirebaseFirestore.instance
        .collection('MyCourse')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('collectionCourse')
        .doc(coursename)
        .set({
          'isLock': false,
          'tutorname': tutorname,
          'coursename': coursename,
          'detailcourse': detailcourse,
          'image': image,
          'type' : type,
          'backgroudTutor': imageBackground,
          'urlVideo': urlVideo,
        });
  }
}
