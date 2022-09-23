import 'dart:io';


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
  

  @override
  Widget build(BuildContext context) {
    var coursesController = Get.put(CoursesController());
    var size = MediaQuery.of(context).size;
    File? file;
    File? fileBackgound;

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
                                image: Image.file(coursesController.fileBackgound!)
                                    .image),
                          ),
                        );
                      } else {
                        return Container(
                          width: size.width,
                          height: size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    Image.asset('assets/images/placeholder.png',fit: BoxFit.cover,)
                                        .image),
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
                                              ImageSource.camera, context);
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
                                            coursesController.fileBackgound = null;
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
                              backgroundImage: Image.file(coursesController.file!)
                                  .image
                        );
                      } else {
                        return CircleAvatar(
                          radius: 80,
                            backgroundImage: 
                                    Image.asset('assets/images/Portrait_Placeholder.png',fit: BoxFit.cover,)
                                        .image);
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
                ],
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                coursesController.addDetail(
                    coursesController.tutornameController.text,
                    coursesController.coursenameController.text,
                    coursesController.priceController.text,
                    coursesController.detailcourseController.text,
                    context,
                    coursesController.emailController.text,
                    coursesController.imageUrl.toString(),
                    coursesController.imageUrlBackground.toString(),);
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

  // Future<Null> chooseImage(ImageSource source) async {
  //   try {
  //     var result = await ImagePicker().getImage(
  //       source: source,
  //       maxWidth: 800,
  //       maxHeight: 800,
  //     );
  //     setState(() {
  //       file = File(result!.path);
  //     });
  //     uploadPictureToStorage(file!.path.toString());
  //   } catch (e) {}
  // }

  // Future<Null> chooseBackgound(ImageSource source) async {
  //   try {
  //     var result = await ImagePicker().getImage(
  //       source: source,
  //       maxWidth: 800,
  //       maxHeight: 800,
  //     );
  //     setState(() {
  //       fileBackgound = File(result!.path);
  //     });
  //     uploadBackgoundToStorage(fileBackgound!.path.toString());
  //   } catch (e) {}
  // }

  // Future<void> updateImageProfile(String image) async {
  //   try {
  //     await FirebaseFirestore.instance
  //     .collection('courses')
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .update({'image': image,});
  //   }catch (e) {

  //   }
  // }

  // Future<void> uploadPictureToStorage(String imagePath) async{
  //   var firebaseRef = await FirebaseStorage.instance
  //   .ref()
  //   .child('image/${imagePath.split('/').last}');
  //   var uploadTask = firebaseRef.putFile(file!);
  //   var taskSnapshot = await uploadTask.whenComplete(() async {
  //     MotionToast.info(
  //         description: Text("การเพิ่มรูป"),
  //         title: Text("ทำรายการสำเร็จ",
  //             style: TextStyle(fontWeight: FontWeight.bold)),
  //       ).show(context);
  //   }).then((value) async{
  //     var imageUrl = await value.ref.getDownloadURL();
  //     updateImageProfile(imageUrl.toString());
  //   });
  // }

  // Future<void> uploadBackgoundToStorage(String imagePath) async{
  //   var firebaseRef = await FirebaseStorage.instance
  //   .ref()
  //   .child('backgound/${imagePath.split('/').last}');
  //   var uploadTask = firebaseRef.putFile(fileBackgound!);
  //   var taskSnapshot = await uploadTask.whenComplete(() async {
  //     MotionToast.info(
  //         description: Text("การเพิ่มรูป"),
  //         title: Text("ทำรายการสำเร็จ",
  //             style: TextStyle(fontWeight: FontWeight.bold)),
  //       ).show(context);
  //   }).then((value) async{
  //     var imageUrl = await value.ref.getDownloadURL();
  //     print(imageUrl);
  //   });
  // }

}
