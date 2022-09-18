import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';


class AuthTutorController extends GetxController {
  final TextEditingController emailTutorController = TextEditingController();
  final TextEditingController passwordTutorController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phonetutorController = TextEditingController();
  final TextEditingController forgotEmailTutorController = TextEditingController();

  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

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

  Future<void> UploadFile(
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);

    try{
      await storage.ref('imagetest/$fileName').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results = await storage.ref('imagetest').listAll();

    results.items.forEach((firebase_storage.Reference ref) {
      print('Found file: $ref');
     });
     return results;
  } 

  Future<String> downloadURL(String imageName) async {
    String downloadURL = await storage.ref('imagetest/$imageName').getDownloadURL();
    return downloadURL;
  }

}

  
