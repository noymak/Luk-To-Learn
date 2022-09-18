import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/controllers/auth_controller.dart';

class WelcomeScreen extends StatelessWidget {
  var _controller = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();

  void summit() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    _controller.signIn();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          color: Color(0xff6360FF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size.height / 3,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Learn from anything and anywhere",
                      style: GoogleFonts.kanit(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.6,
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          validator: validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          controller: _controller.emailController,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              size: 30,
                            ),
                            hintText: "Email",
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: validatePassword,
                              keyboardType: TextInputType.visiblePassword,
                              controller: _controller.passwordController,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  size: 30,
                                ),
                                hintText: "Password",
                              ),
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 8,),
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          summit();
                        },
                        child: Container(
                          height: 50,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Color(0xff6360FF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.kanit(
                                  fontSize: 17, color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Container(
                          height: 50,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Color(0xffFF8181),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Register",
                              style: GoogleFonts.kanit(
                                  fontSize: 17, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/registertutor');
                        },
                        child: Container(
                          height: 50,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Color(0xffFF8181),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Register Tutor",
                              style: GoogleFonts.kanit(
                                  fontSize: 17, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) return 'กรุุณากรอก E-mail ';
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'กรุณากรอก E-mail ให้ถูกต้อง';
  return null;
}

String? validatePassword(String? formPass) {
  if (formPass == null || formPass.isEmpty) return 'กรุุณากรอก Password ';
  return null;
}
