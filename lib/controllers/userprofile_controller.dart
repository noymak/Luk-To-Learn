import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

class UserProfileController extends GetxController {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  File? file;

  checkEmpty() {
    if (firstnameController.text.isEmpty &&
        lastnameController.text.isEmpty &&
        emailController.text.isEmpty &&
        phoneController.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future addDetail(String firstname, String lastname, String phone,
      BuildContext context, String email) async {
        print(firstnameController.text);
        print(lastnameController.text);
        print(phoneController.text);
        print(emailController.text);
    if (checkEmpty()) {
      return MotionToast.error(
        description: Text("Error"),
        title: Text("กรอกข้อมูลให้ครบถ้วน",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ).show(context);
    } else {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'firstname': firstname,
        'lastname': lastname,
        'phone': phone,
        'email': email,
        'image': ''
      }).then((value) {
        Get.toNamed('/route');
        MotionToast.info(
          description: Text("การเพิ่มรายการ"),
          title: Text("ทำรายการสำเร็จ",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ).show(context);
      });
    }
  }

  Future<Null> chooseImages(ImageSource source, BuildContext context) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      (() {
        file = File(result!.path);
        update();
      });
      uploadPictureToStorage(file!.path.toString(), context);
    } catch (e) {}
  }

  Future<void> updateImageProfile(String image) async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'image': image,
      });
    } catch (e) {}
  }

  Future<void> uploadPictureToStorage(
      String imagePath, BuildContext context) async {
    var firebaseRef = await FirebaseStorage.instance
        .ref()
        .child('image/${imagePath.split('/').last}');
    var uploadTask = firebaseRef.putFile(file!);
    var taskSnapshot = await uploadTask.whenComplete(() async {
      MotionToast.info(
        description: Text("การเพิ่มรูป"),
        title: Text("ทำรายการสำเร็จ",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ).show(context);
    }).then((value) async {
      var imageUrl = await value.ref.getDownloadURL();
      updateImageProfile(imageUrl.toString());
    });
  }
}
