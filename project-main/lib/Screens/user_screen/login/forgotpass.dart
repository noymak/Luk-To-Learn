import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/auth_controller.dart';

class ForgotPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height / 2 * 0.20),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/welcome_screen');
                                    },
                                    child: Icon(Icons.arrow_back_ios)),
                                Text(
                                  "Forgot Password",
                                  style: GoogleFonts.kanit(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ForgotPassForm(
                              "E-mail", _authController.forgotEmailController),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Please Enter Your E-mail",
                            style: GoogleFonts.kanit(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 320,
                          ),
                          GestureDetector(
                            onTap: () {
                              _authController.ChangePass(
                                  _authController.forgotEmailController.text
                                      .trim(),
                                  context);
                              Get.snackbar('แจ้งเตือน', 'โปรดเช็ก E-mail');
                              Get.toNamed('/welcome_screen');
                            },
                            child: Container(
                              height: 50,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: Color(0xffFF8181),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Text(
                                  "Confirm",
                                  style: GoogleFonts.kanit(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container ForgotPassForm(String text, TextEditingController controller) {
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
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
        ),
      ),
    ),
  );
}
