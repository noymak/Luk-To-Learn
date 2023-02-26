import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/auth_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _controller = Get.put(AuthController());
  
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    File? file;

    Future<Null> chooseImage(ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xff6360FF),
              height: size.height * 0.35,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SafeArea(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          Text("Account",
                              style: GoogleFonts.kanit(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: file != null
                        ? Image.file(
                            File(file!.path.toString()),
                            fit: BoxFit.cover,
                          ).image
                        : Image.asset('assets/images/Portrait_Placeholder.png').image,
                  ),
                ),
                Positioned(
                  left: 55,
                  top: 65,
                  child: RawMaterialButton(
                    elevation: 10,
                    child: CircleAvatar(
                      radius: 20,
                      child: Icon(
                        Icons.add_a_photo,
                        color: kPrimaryLightColor,
                      ),
                    ),
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'ChooseOption',
                                style: GoogleFonts.kanit(
                                  textStyle: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        chooseImage(ImageSource.camera);
                                      },
                                      splashColor: kPrimaryColor1,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.camera,
                                              color: kPrimaryColor1,
                                            ),
                                          ),
                                          Text(
                                            'Camera',
                                            style: GoogleFonts.kanit(
                                              textStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        chooseImage(ImageSource.gallery);
                                      },
                                      splashColor: kPrimaryColor1,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.image,
                                              color: kPrimaryColor1,
                                            ),
                                          ),
                                          Text(
                                            'Gallery',
                                            style: GoogleFonts.kanit(
                                              textStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          file = null;
                                        });
                                      },
                                      splashColor: kPrimaryColor1,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.remove_circle,
                                              color: kPrimaryColor1,
                                            ),
                                          ),
                                          Text(
                                            'Remove',
                                            style: GoogleFonts.kanit(
                                              textStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  ),
                ),
              ],
            ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${FirebaseAuth.instance.currentUser!.email}",
                      style: GoogleFonts.kanit(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.6,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Account Settings",
                                style: GoogleFonts.kanit(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[600])),
                            SizedBox(
                              height: 15,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //   //   GestureDetector(
                            //   //     onTap: () {
                            //   //       Navigator.pushNamed(context, '/forgotpass');
                            //   //     },
                            //   //     child: Text(
                            //   //       "Change Password",
                            //   //       style: GoogleFonts.kanit(
                            //   //         fontSize: 20,
                            //   //         fontWeight: FontWeight.w500,
                            //   //       ),
                            //   //     ),
                            //   //   ),
                            //   //   Icon(
                            //   //     Icons.arrow_forward_ios,
                            //   //     color: Colors.black,
                            //   //   ),
                            //   // ],
                            // ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/orderhis');
                                  },
                                  child: Text(
                                    "Order History",
                                    style: GoogleFonts.kanit(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     GestureDetector(
                            //       onTap: () {
                            //         Navigator.pushNamed(
                            //             context, '/editprofile');
                            //       },
                            //       child: Text(
                            //         "Edit Profile",
                            //         style: GoogleFonts.kanit(
                            //           fontSize: 20,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //     ),
                            //     Icon(
                            //       Icons.arrow_forward_ios,
                            //       color: Colors.black,
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 50,
                            ),
                            Text("Support",
                                style: GoogleFonts.kanit(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[600])),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/about');
                                  },
                                  child: Text(
                                    "About Luk to Learn",
                                    style: GoogleFonts.kanit(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/question');
                                  },
                                  child: Text(
                                    "Frequntly asked question",
                                    style: GoogleFonts.kanit(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _controller.signOut();
                                    ;
                                  },
                                  child: Text(
                                    "Logout",
                                    style: GoogleFonts.kanit(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
