import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  Future addMyCourse(
      String tutorname,
      String coursename,
      String detailcourse,
      String email,
      String image,
      String imageBackground,
      String type
  ) async {
    FirebaseFirestore.instance
        .collection('MyCourse')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set({
          'tutorname': tutorname,
          'coursename': coursename,
          'detailcourse': detailcourse,
          'email': email,
          'image': image,
          'type' : type,
          'backgroudTutor': imageBackground,
        });
  }
}
