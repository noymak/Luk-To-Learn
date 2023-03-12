import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/auth_tutor_controller.dart';

class LoginTutor extends StatefulWidget {
  const LoginTutor({Key? key}) : super(key: key);

  @override
  State<LoginTutor> createState() => _LoginTutorState();
}

class _LoginTutorState extends State<LoginTutor> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _controllerTutor = Get.put(AuthTutorController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          color: kPrimaryLightColor,
          child: Column(children: [
            
            SizedBox(height: 200),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/welcome_screen');
              },
              child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.cover,
                    width: 300,
                    height: 150,
                  )),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Tutor-login.',style: GoogleFonts.kanit(
                                    fontSize: 28, color: Colors.black),),
              )),
            Form(
              // key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        // validator: validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        controller: _controllerTutor.emailTutorController,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            size: 30,
                          ),
                          hintText: "Email",
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          TextFormField(
                            // validator: validatePassword,
                            keyboardType: TextInputType.visiblePassword,
                            controller: _controllerTutor.passwordTutorController,
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
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (() {
                          _controllerTutor.signIn();
                      }),
                      child: Container(
                              height: 50,
                              width: size.width/2,
                              decoration: BoxDecoration(
                                  color: kPrimaryColors,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "Sign In",
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
          ]),
        ),
      ),
    );
  }
}
