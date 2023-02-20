import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/userprofile_controller.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? file;
  @override
  Widget build(BuildContext context) {
    var userprofileController = Get.put(UserProfileController());
    var size = MediaQuery.of(context).size;
    return GetBuilder<UserProfileController>(builder: (_) {
      return Scaffold(
        backgroundColor: Color(0xff6360FF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: GestureDetector(
                        onDoubleTap: () {
                          Navigator.pushNamed(context, "/route");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 110,
                            ),
                            Text(
                              "Edit Profile",
                              style: GoogleFonts.kanit(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  color: Color(0xff6360FF),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        GetBuilder<UserProfileController>(builder: (_) {
                          return Container(
                            width: 100,
                            height: 100,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundImage: file != null
                                  ? Image.file(
                                      File(userprofileController.file!.path
                                          .toString()),
                                      fit: BoxFit.cover,
                                    ).image
                                  : Image.asset('assets/images/profile.jpg')
                                      .image,
                            ),
                          );
                        }),
                        Positioned(
                          left: 35,
                          top: 45,
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
                                                userprofileController
                                                    .chooseImages(
                                                        ImageSource.camera,
                                                        context);
                                              },
                                              splashColor: kPrimaryColor1,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                userprofileController
                                                    .chooseImages(
                                                        ImageSource.gallery,
                                                        context);
                                              },
                                              splashColor: kPrimaryColor1,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                          fontWeight:
                                                              FontWeight.bold),
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                          fontWeight:
                                                              FontWeight.bold),
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
                      height: 80,
                    ),
                    Container(
                      width: size.width,
                      height: 615,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: GoogleFonts.kanit(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueAccent),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              EditPro('FirstName',
                                  userprofileController.firstnameController),
                              SizedBox(
                                height: 15,
                              ),
                              Text('Last Name',
                                  style: GoogleFonts.kanit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueAccent)),
                              SizedBox(
                                height: 10,
                              ),
                              EditPro('LastName',
                                  userprofileController.lastnameController),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'E-mail',
                                style: GoogleFonts.kanit(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueAccent),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              EditPro('E-mail',
                                  userprofileController.emailController),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'PhoneNumber',
                                style: GoogleFonts.kanit(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueAccent),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              EditPro(
                                  '+66', userprofileController.phoneController),
                              SizedBox(
                                height: 130,
                              ),
                              GestureDetector(
                                onTap: () {
                                  
                                  userprofileController.addDetail(
                                      userprofileController
                                          .firstnameController.text,
                                      userprofileController
                                          .lastnameController.text,
                                      userprofileController
                                          .phoneController.text,
                                      context,
                                      userprofileController
                                          .emailController.text);
                                },
                                child: Container(
                                  height: 50,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      color: Color(0xffFF8181),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Text(
                                      "Update Profile",
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

Container EditPro(String text, TextEditingController controller) {
  return Container(
    decoration: BoxDecoration(
        // border: Border.all(),
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          //BoxShadow
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
