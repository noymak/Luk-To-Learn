import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future addDetail(
      String emailtutor, String firstname, String lastname, String phone) async {
    await FirebaseFirestore.instance
        .collection('users')
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

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTutorController.text.trim(),
          password: passwordTutorController.text.trim());
      addDetail(emailTutorController.text.trim(),
          firstnameController.text.trim(),
          lastnameController.text.trim(), 
          phonetutorController.text.trim());

          
    } catch (e) {
      print(e);
    }
  }

  
}