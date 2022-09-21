import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';


class AuthTutorController extends GetxController {
  final TextEditingController emailTutorController = TextEditingController();
  final TextEditingController passwordTutorController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phonetutorController = TextEditingController();
  final TextEditingController forgotEmailTutorController = TextEditingController();


  File? image;

  checkPassword() {

    if (passwordTutorController.text.trim() == confirmPassword.text.trim()) {
      return true;
    } else {
      return false;
    }
    
  }

  Future addDetail(
      String emailtutor, String firstname, String lastname, String phone) async {
    await FirebaseFirestore.instance
        .collection('tutor')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'email': emailtutor,
      'firstname': firstname,
      'lastname': lastname,
      'phone': phonetutorController,
    });
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailTutorController.text.trim(),
      password: passwordTutorController.text.trim(),
    );
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future signUp(BuildContext context) async {
    try {
      if (checkPassword()) {
      return MotionToast.error(
        description: Text("Error"),
        title: Text("กรอกข้อมูลให้ครบถ้วน",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ).show(context);
    } else {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTutorController.text.trim(),
          password: passwordTutorController.text.trim());
      addDetail(emailTutorController.text.trim(),
          firstnameController.text.trim(),
          lastnameController.text.trim(), 
          phonetutorController.text.trim());

    }
    } catch (e) {
      print(e);
    }
  }

  Future<Null> chooseImages(ImageSource source, BuildContext context) async {
    try {
      final XFile? result = await ImagePicker().pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
        if (result != null) {
        final Rx<File> _imagePath = File(result.path).obs;
        image = _imagePath.value;
      }

        print(image);
        update();
      
      uploadPictureToStorage(image!.path.toString(), context);
    } catch (e) {}
  }


   Future<void> uploadPictureToStorage(
      String imagePath, BuildContext context) async {
    var firebaseRef = await FirebaseStorage.instance
        .ref()
        .child('imagetest/${imagePath.split('/').last}');
    var uploadTask = firebaseRef.putFile(image!);
    var taskSnapshot = await uploadTask.whenComplete(() async {
      MotionToast.info(
        description: Text("การเพิ่มรูป"),
        title: Text("ทำรายการสำเร็จ",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ).show(context);
    }).then((value) async {
      var imageUrl = await value.ref.getDownloadURL();
      // updateImageProfile(imageUrl.toString());
    });
  }

}

  
