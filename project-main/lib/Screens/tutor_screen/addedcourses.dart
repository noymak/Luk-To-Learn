import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/courses_controller.dart';

class AddedCourses extends StatefulWidget {
  const AddedCourses({Key? key}) : super(key: key);

  @override
  State<AddedCourses> createState() => _AddedCoursesState();
}

class _AddedCoursesState extends State<AddedCourses> {
  get selectedcategory => null;

  @override
  Widget build(BuildContext context) {
    var coursesController = Get.put(CoursesController());
    var size = MediaQuery.of(context).size;
    File? file;
    File? fileBackgound;
    final List<String> categoryItems = ['math', 'eng', 'thai', 'art'];

    String? _currentCategory;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: size.width,
              child: Stack(
                children: [
                  GetBuilder<CoursesController>(builder: (_) {
                    if (coursesController.fileBackgound != null) {
                      return Container(
                        width: size.width,
                        height: size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  Image.file(coursesController.fileBackgound!)
                                      .image),
                        ),
                      );
                    } else {
                      return Container(
                        width: size.width,
                        height: size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset(
                            'assets/images/placeholder.png',
                            fit: BoxFit.cover,
                          ).image),
                        ),
                      );
                    }
                  }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
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
                                    child: ListBody(children: [
                                      InkWell(
                                        onTap: () {
                                          coursesController.chooseBackground(
                                              ImageSource.gallery, context);
                                        },
                                        splashColor: kPrimaryColor1,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                            coursesController.fileBackgound =
                                                null;
                                          });
                                        },
                                        splashColor: kPrimaryColor1,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                    ]),
                                  ),
                                );
                              });
                        },
                        child: Icon(
                          Icons.add_a_photo,
                          size: 60,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                GetBuilder<CoursesController>(builder: (_) {
                  if (coursesController.file != null) {
                    return CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            Image.file(coursesController.file!).image);
                  } else {
                    return CircleAvatar(
                        radius: 80,
                        backgroundImage: Image.asset(
                          'assets/images/Portrait_Placeholder.png',
                          fit: BoxFit.cover,
                        ).image);
                  }
                }),
                Positioned(
                  left: 75,
                  top: 95,
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
                                        coursesController.chooseImage(
                                            ImageSource.camera, context);
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
                                        coursesController.chooseImage(
                                            ImageSource.gallery, context);
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
                                          coursesController.file = null;
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ชื่อผู้สอน',
                    style: GoogleFonts.kanit(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  addedForm(
                      'ชื่อผู้สอน', coursesController.tutornameController),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'ชื่อคอร์ส',
                    style: GoogleFonts.kanit(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  addedForm(
                      'ชื่อคอร์ส', coursesController.coursenameController),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'E-mail',
                    style: GoogleFonts.kanit(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  addedForm('E-mail', coursesController.emailController),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'ราคา',
                    style: GoogleFonts.kanit(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  addedForm('ราคา', coursesController.priceController),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'รายละเอียดคอร์ส',
                    style: GoogleFonts.kanit(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  addedForm('รายละเอียดคอร์ส',
                      coursesController.detailcourseController),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'เลือกประเภทของคอร์ส',
                    style: GoogleFonts.kanit(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: 'เลือกประเภทของคอร์ส',
                        // ตัวอย่างการกำหนดสีของ hint text
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      // value: 'Select Category',
                      items: categoryItems.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text('$category category'),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          coursesController.typeController.text = val as String;
                          print(coursesController.typeController.text.trim());
                        });
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: ElevatedButton(
                    onPressed: () async {
                      await coursesController.pickFile();
                    },
                    child: Text('เลือกไฟล์และอัพโหลด'),
                  )),
                  SizedBox(height: 20,),
                  if (coursesController.videoUrl != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Selected Video: ${coursesController.selectedFile}'),
                  SizedBox(height: 10),
                  // Image.network(
                  //   '${coursesController.videoUrl}',
                  //   height: 200,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                ],
              ),

                ],
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                print('urlprofile ${coursesController.imageUrl}');
                print('urlbg ${coursesController.imageUrlBackground}');
                coursesController.addDetail(
                  tutorname: coursesController.tutornameController.text,
                  coursename: coursesController.coursenameController.text,
                  price: coursesController.priceController.text,
                  detailcourse: coursesController.detailcourseController.text,
                  context: context,
                  email: coursesController.emailController.text,
                  image: coursesController.imageUrl.toString(),
                  imageBackground:
                      coursesController.imageUrlBackground.toString(),
                  type: coursesController.typeController.text,
                  video: coursesController.videoUrl.toString(),
                );
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: kPrimaryColor),
                child: Center(
                  child: Text(
                    'เพิ่มคอร์ส',
                    style: GoogleFonts.kanit(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryLightColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container addedForm(String text, TextEditingController controller) {
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
}
