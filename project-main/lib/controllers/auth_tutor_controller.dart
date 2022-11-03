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

  String? imageUrl;

  checkEmpty() {
    if (firstnameController.text.isEmpty &&
        lastnameController.text.isEmpty &&
        emailTutorController.text.isEmpty &&
        phonetutorController.text.isEmpty &&
        passwordTutorController.text.isEmpty &&
        confirmPassword.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  checkPassword() {

    if (passwordTutorController.text.trim() == confirmPassword.text.trim()) {
      return true;
    } else {
      return false;
    }
    
  }

  Future addDetail(
      String emailtutor, String firstname, String lastname, String phone, String image) async {
    await FirebaseFirestore.instance
        .collection('tutor')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'email': emailtutor,
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
      'image': image,
    });
  }

  Future signIn() async {
    print(passwordTutorController.text);
    print(emailTutorController.text);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailTutorController.text.trim(),
      password: passwordTutorController.text.trim(),
    );
    
    Get.toNamed('/routetutor');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case "user-not-found":
          return Get.snackbar('เกิดข้อผิดพลาด', 'ไม่พบข้อมูลในระบบ');
        case "wrong-password":
          return Get.snackbar('เกิดข้อผิดพลาด', 'บัญชีหรือรหัสผ่านผิดพลาด');
        case "invalid-email":
          return Get.snackbar('เกิดข้อผิดพลาด', 'บัญชีหรือรหัสผ่านผิดพลาด');
        default:
      }
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut().then((value) => Get.toNamed('/login_tutor'));
  }

  Future signUp(BuildContext context, String email, String password, String firstname, String lastname, String phone, String image) async {
    // print(email);
    // print(firstname);
    // print(password);
    // print(lastname);
    // print(phone);
    // print(image);
    try {
      if (!checkPassword()) {
      return MotionToast.error(
        description: Text("Error"),
        title: Text("กรุณากรอก Password ให้เหมือนกัน",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ).show(context);
    } if(checkEmpty()){
      return MotionToast.error(
        description: Text("Error"),
        title: Text("กรุณากรอกข้อมูลให้ครบถ้วน",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ).show(context);
    }
    else {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password);
      addDetail(
          email,
          firstname,
          lastname, 
          phone,
          image,).then((value) {
            Get.toNamed('/routetutor');
          });

    }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return Get.snackbar(
              'เกิดข้อผิดพลาด', 'มีอีเมลนี้เชื่อมโยงกับบัญชีอื่นแล้ว');
      }
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
      imageUrl = await value.ref.getDownloadURL();
      // updateImageProfile(imageUrl.toString());
    });
  }

}

  
