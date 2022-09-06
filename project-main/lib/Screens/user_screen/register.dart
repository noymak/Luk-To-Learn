import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/controllers/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final formKey = GlobalKey<FormState>();
  var authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color(0xff6360FF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xff6360FF),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/welcome_screen');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        Text(
                          "Register",
                          style: GoogleFonts.kanit(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.9,
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(
                      18,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SafeArea(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Username",
                            style: GoogleFonts.kanit(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          registerForm(
                              "Firstname", authController.firstname, false),
                          SizedBox(
                            height: 20,
                          ),
                          registerForm(
                              "Lastname", authController.lastname, false),
                          SizedBox(
                            height: 20,
                          ),
                          Text("E-mail",
                              style: GoogleFonts.kanit(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          registerFormEmail(
                            "Email",
                            authController.emailController,
                            false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          registerFormPass("Password",
                              authController.passwordController, true),
                          SizedBox(
                            height: 20,
                          ),
                          registerFormConPass("Confirm Password",
                              authController.confirmpassword, true),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Phone Number",
                              style: GoogleFonts.kanit(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          registerForm("+66", authController.phone, false),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, '/welcome_screen');
                              // print(authController.firstname.text);
                              // print(authController.lastname.text);
                              // print(authController.emailController.text);
                              // print(authController.passwordController.text);
                              // print(authController.confirmpassword.text);
                              // print(authController.phone.text);
                              authController.signUp();
                              Navigator.pushNamed(context, '/route');
                            },
                            child: Container(
                              width: size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.redAccent,
                                      Colors.purpleAccent,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(18)),
                              child: Center(
                                child: Text(
                                  'Register',
                                  style: GoogleFonts.kanit(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Container registerForm(String text, controller, bool obscureText) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(),
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          validator: validateEmpty,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
          ),
        ),
      ),
    );
  }

  Container registerFormEmail(String text, controller, bool obscureText) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(),
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          validator: validateEmail,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
          ),
        ),
      ),
    );
  }

  Container registerFormPass(String text, controller, bool obscureText) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(),
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          validator: validatePassword,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
          ),
        ),
      ),
    );
  }

  Container registerFormConPass(String text, controller, bool obscureText) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(),
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          validator: validateConPassword,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
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

  if (formPass.length < 6) return ' Password ของคุณง่ายเกินไป ';
  return null;
}

String? validateConPassword(String? formConPass) {
  if (formConPass == null || formConPass.isEmpty) return 'กรุุณากรอก Password ';

  return null;
}

String? validateEmpty(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) return 'กรุุณากรอกข้อมูล ';

  return null;
}
