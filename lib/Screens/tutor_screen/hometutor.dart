import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/controllers/courses_controller.dart';
import 'package:luk_to_learn/controllers/show_course_controller.dart';
import 'package:luk_to_learn/controllers/tutor_controller.dart';
import 'package:luk_to_learn/widgets/cartlist.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
  var _showCourseController = Get.put(showCourse());
  // FirebaseFirestore firebaseStorage = FirebaseFirestore.instance;
  // Future <void> downloanImage() async {
  //   // firebaseStorage.ref().child('').getDownloadURL();
  // }

  var _tutorController = Get.put(tutorContorller());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _controllerCourse = Get.put(CoursesController());
    // print(coursesInfo[0].name);
    return Scaffold(
      backgroundColor: kPrimaryColors,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor1,
        title: Text('Home'),
      ),
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
                        Column(
                          children: [
                            Row(
                              children: [
                                Hero(
                                    tag: 'image',
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundImage: Image.asset(
                                              'assets/images/Portrait_Placeholder.png')
                                          .image,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${FirebaseAuth.instance.currentUser!.email}',
                                        style: GoogleFonts.kanit(
                                          textStyle: TextStyle(
                                            fontSize: 18,
                                            color: kPrimaryLightColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      // Text(
                                      //   'Develop & Instructor',
                                      //   style: GoogleFonts.kanit(
                                      //     textStyle: TextStyle(
                                      //       fontSize: 18,
                                      //       color: kPrimaryLightColor,
                                      //     ),
                                      //   ),
                                      // ),
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
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Total  ${_controllerCourse.listCourse.length}",
                              style: GoogleFonts.kanit(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        StreamBuilder(
                            stream:
                                _controllerCourse.fetchCourseNew().asStream(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text('process');
                              } else {
                                return Container(
                                  width: size.width,
                                  height: size.height * 0.6,
                                  // child: Text('${_controllerCourse.listCourseTutor}'),
                                  child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount: _controllerCourse
                                          .listCourseTutor.length,
                                      itemBuilder: (context, index) {
                                        return Slidable(
                                          startActionPane: ActionPane(
                                            motion: BehindMotion(),
                                            children: [
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 0),
                                                  child: Container(
                                                    width: size.width * 0.3,
                                                    height: size.height * 0.14,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(20),
                                                      ),
                                                    ),
                                                    child: IconButton(
                                                      icon: Icon(
                                                        Icons.edit,
                                                        color: Colors.white,
                                                        size: 36,
                                                      ),
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                  'แก้ไขข้อมูล',
                                                                  style:
                                                                      GoogleFonts
                                                                          .kanit(
                                                                    textStyle: TextStyle(
                                                                        fontSize:
                                                                            26,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                content:
                                                                    SingleChildScrollView(
                                                                  child: ListBody(
                                                                      children: [
                                                                        // Row(
                                                                        //   children: [
                                                                        //     Expanded(
                                                                        //       child: TextFormField(
                                                                        //         autofocus: false,
                                                                        //         controller: _tutorController.coursenameController,
                                                                        //         // controller: authTutorController.firstnameController,
                                                                        //         keyboardType: TextInputType.name,
                                                                        //         onSaved: (value) {},
                                                                        //         textInputAction: TextInputAction.next,
                                                                        //         decoration: InputDecoration(
                                                                        //           prefixIcon: Icon(Icons.people_alt),
                                                                        //           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                                                        //           hintText: 'ชื่อคอร์ส',
                                                                        //           border: OutlineInputBorder(
                                                                        //             borderRadius: BorderRadius.circular(10),
                                                                        //           ),
                                                                        //         ),
                                                                        //       ),
                                                                        //     ),
                                                                        //   ],
                                                                        // ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: TextFormField(
                                                                                maxLines: 5,
                                                                                autofocus: false,
                                                                                controller: _tutorController.detailcourseController,
                                                                                keyboardType: TextInputType.name,
                                                                                onSaved: (value) {},
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: InputDecoration(
                                                                                  prefixIcon: Icon(Icons.people_alt),
                                                                                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                                                                  hintText: 'รายละเอียด',
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: TextFormField(
                                                                                autofocus: false,
                                                                                controller: _tutorController.priceController,
                                                                                keyboardType: TextInputType.number,
                                                                                onSaved: (value) {},
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: InputDecoration(
                                                                                  prefixIcon: Icon(Icons.people_alt),
                                                                                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                                                                  hintText: 'ราคา',
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        // InkWell(
                                                                        //   onTap: () {

                                                                        //   },
                                                                        //   splashColor: kPrimaryColor1,
                                                                        //   child: Row(
                                                                        //     children: [
                                                                        //       Padding(
                                                                        //         padding:
                                                                        //             const EdgeInsets.all(8.0),
                                                                        //         child: Icon(
                                                                        //           Icons.image,
                                                                        //           color: kPrimaryColor1,
                                                                        //         ),
                                                                        //       ),
                                                                        //       Text(
                                                                        //         'Gallery',
                                                                        //         style: GoogleFonts.kanit(
                                                                        //           textStyle: TextStyle(
                                                                        //               fontSize: 18,
                                                                        //               fontWeight:
                                                                        //                   FontWeight.bold),
                                                                        //         ),
                                                                        //       ),
                                                                        //     ],
                                                                        //   ),
                                                                        // ),
                                                                        // InkWell(
                                                                        //   onTap:
                                                                        //       () {
                                                                        //     setState(() {});
                                                                        //   },
                                                                        //   splashColor:
                                                                        //       kPrimaryColor1,
                                                                        //   child:
                                                                        //       Row(
                                                                        //     children: [
                                                                        //       Padding(
                                                                        //         padding: const EdgeInsets.all(8.0),
                                                                        //         child: Icon(
                                                                        //           Icons.video_collection,
                                                                        //           color: kPrimaryColor1,
                                                                        //         ),
                                                                        //       ),
                                                                        //       Text(
                                                                        //         'แก้ไขวิดีโอ',
                                                                        //         style: GoogleFonts.kanit(
                                                                        //           textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                        //         ),
                                                                        //       ),
                                                                        //     ],
                                                                        //   ),
                                                                        // ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            _tutorController.updateCourse(
                                                                                // coursename: _tutorController.coursenameController.text.trim(),
                                                                                price: _tutorController.priceController.text.trim(),
                                                                                detailcourse: _tutorController.detailcourseController.text.trim(),
                                                                                doc_id: _controllerCourse.listCourseTutor[index]['coursename']);
                                                                            setState(() {});
                                                                          },
                                                                          splashColor:
                                                                              kPrimaryColor1,
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Icon(
                                                                                  Icons.check,
                                                                                  color: kPrimaryColor1,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'ยืนยันการแก้ไข',
                                                                                style: GoogleFonts.kanit(
                                                                                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                                                    ),
                                                  ))
                                            ],
                                          ),
                                          child: cartlist(
                                                  linkImage: _controllerCourse
                                                          .listCourseTutor[index]
                                                      ['backgroudTutor'],
                                                  nameCourse: _controllerCourse
                                                          .listCourseTutor[index]
                                                      ['coursename'],
                                                  price: int.parse(
                                                      _controllerCourse.listCourseTutor[index]
                                                          ['price']),
                                                  type: _controllerCourse.listCourseTutor[index]
                                                      ['type'],
                                                  name: _controllerCourse.listCourseTutor[index]
                                                      ['tutorname'],
                                                  // level: _controllerCourse.listCourseTutor[index]['coursename'],
                                                  detail: _controllerCourse.listCourseTutor[index]
                                                      ['detailcourse'],
                                                  profileTutors: _controllerCourse
                                                      .listCourseTutor[index]['image']),
                                        );
                                      }),
                                );
                              }
                            })
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
