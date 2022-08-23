import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:luk_to_learn/widgets/cartlistbuy.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../constants.dart';
import '../../model/courses.dart';

class HomeTutor extends StatefulWidget {
  const HomeTutor({Key? key}) : super(key: key);

  @override
  State<HomeTutor> createState() => _HomeTutorState();
}

class _HomeTutorState extends State<HomeTutor> {
  // FirebaseFirestore firebaseStorage = FirebaseFirestore.instance;
  // Future <void> downloanImage() async {
  //   // firebaseStorage.ref().child('').getDownloadURL();
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // print(coursesInfo[0].name);
    return Scaffold(
      backgroundColor: kPrimaryColors,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                              ),
                              Text(
                                'Author',
                                style: GoogleFonts.kanit(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    color: kPrimaryLightColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.shop_2_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  child: CircleAvatar(
                                      radius: 55,
                                      backgroundImage: AssetImage(
                                          'assets/images/profile.jpg')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sarah William',
                                        style: GoogleFonts.kanit(
                                          textStyle: TextStyle(
                                            fontSize: 18,
                                            color: kPrimaryLightColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Develop & Instructor',
                                        style: GoogleFonts.kanit(
                                          textStyle: TextStyle(
                                            fontSize: 18,
                                            color: kPrimaryLightColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.class_sharp,
                              size: 36,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Taotal students',
                              style: GoogleFonts.kanit(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  color: kPrimaryLightColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '2405',
                              style: GoogleFonts.kanit(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  color: kPrimaryLightColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 230, 230, 236),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Courses",
                              style: GoogleFonts.kanit(
                                textStyle: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "Total ${coursesInfo.length}",
                              style: GoogleFonts.kanit(
                                textStyle: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ...List.generate(
                          coursesInfo.length,
                          (index) => cartlistbuy(
                            
                            linkImage: coursesInfo[index].image!,
                            nameCourse: coursesInfo[index].nameCourse!,
                            level: coursesInfo[index].level!,
                            name: coursesInfo[index].name!,
                            price: coursesInfo[index].price!,
                            rate: coursesInfo[index].rate!,
                            detail: coursesInfo[index].detail!,
                            profileTutors: coursesInfo[index].profileTutors!,
                          ),
                        ),
                      ],
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
