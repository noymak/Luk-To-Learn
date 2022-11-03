import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController forgotEmailController = TextEditingController();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
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
    await FirebaseAuth.instance.signOut();
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      addDetail(emailController.text.trim(),
          firstname.text.trim(),
          lastname.text.trim(), 
          phone.text.trim());

          
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return Get.snackbar(
              'เกิดข้อผิดพลาด', 'อีเมลนี้เชื่อมโยงกับบัญชีอื่นแล้ว');
      }
    }
  }

  Future addDetail(
      String email, String firstname, String lastname, String phone) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
    });
  }

  Future ChangePass(String email, context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      MotionToast.success(
        description: Text("reset password success."),
        title: Text("Success",style: TextStyle(fontWeight: FontWeight.bold)),
        ).show(context);
        // Get.toNamed('/welcome_screen');
    } catch(e) {
      print(e);
    }

  }

}
