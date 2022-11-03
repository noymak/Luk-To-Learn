import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

class CoursesController extends GetxController {
  final TextEditingController tutornameController = TextEditingController();
  final TextEditingController coursenameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController detailcourseController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  late List listCoursesId = [];

  File? file;
  File? fileBackgound;
  String? imageUrlBackground;
  String? imageUrl;

  List listCourse = [];

  void onInit() {
    super.onInit();
    fetchCourse();
  }

  checkEmpty() {
    if (tutornameController.text.isEmpty &&
        coursenameController.text.isEmpty &&
        priceController.text.isEmpty &&
        detailcourseController.text.isEmpty &&
        emailController.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future addDetail(String tutorname, String coursename, String price,
      String detailcourse, BuildContext context, String email ,String image, String imageBackground) async {
        print(email);
        print(tutorname);
        print(price);
        print(detailcourse);
        print(coursename);
        print(image);
        print(imageUrlBackground);
      
   try {
      if (checkEmpty()) {
      return MotionToast.error(
        description: Text("Error"),
        title: Text("กรอกข้อมูลให้ครบถ้วน",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ).show(context);
    } else {
      await FirebaseFirestore.instance
      .collection('courses')
      .doc(email)
      .set({
        'tutorname': tutorname,
        'coursename': coursename,
        'price': price,
        'detailcourse': detailcourse,
        'email': email,
        'image' : image,
        'backgroudTutor': imageBackground,
      }).then((value) {
       
        Get.toNamed('/checkinfocourse');
        showDetail(email);
        MotionToast.info(
          description: Text("การเพิ่มรายการ"),
          title: Text("ทำรายการสำเร็จ",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ).show(context);
      });
    }
   } catch (e) {
      print(e);
   }
  }

  Future showDetail(
    String email,
  ) async {
    await FirebaseFirestore.instance
        .collection('courses').where('email',isEqualTo: email)
        .get().then((value) {
          value.docs.forEach((element) {
            listCoursesId.add(element.data());
            listCoursesId.forEach((element) {
              print(element['tutorname']);
            });

            // print(listCourses.toString());
          });

           update();
          // print(value.docs[0]['tutorname']);
        });
    print(email);
    var data = await FirebaseFirestore.instance
        .collection('courses')
        .where('email', isEqualTo: email)
        .get();
    data.docs.forEach((element) {
      print(element['tutorname']);
      listCoursesId.add(element.data());
      update();
    });
  }

  Future<void> fetchCourse () async {
    listCourse.clear();
    await FirebaseFirestore.instance
        .collection('courses')
        .get().then((value) {
          value.docs.forEach((element) {
            listCourse.add(element.data());
            listCourse.forEach((element) {
              print('++ ' + element['tutorname']);
            });

            // print(listCourses.toString());
          });

           update();
          // print(value.docs[0]['tutorname']);
        });
  }

  

 Future<Null> chooseImage(ImageSource source, BuildContext context) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      if (result != null) {
        final Rx<File> _imagePath = File(result.path).obs;
        file = _imagePath.value;
      }
      uploadPictureToStorage(file!.path.toString(),context);
    } catch (e) {}
  }

  Future<Null> chooseBackground(ImageSource source, BuildContext context) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
     if (result != null) {
        final Rx<File> _imagePath = File(result.path).obs;
        fileBackgound = _imagePath.value;
      }
      update();
      uploadBackgoundToStorage(fileBackgound!.path.toString(),context);
    } catch (e) {}
  }

  Future<void> updateImageProfile(String image) async {
    try {
      await FirebaseFirestore.instance
      .collection('courses')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({'image': image,});
    }catch (e) {

    }
  }

  Future<void> uploadPictureToStorage(String imagePath,BuildContext context) async{
    var firebaseRef = await FirebaseStorage.instance
    .ref()
    .child('image/${imagePath.split('/').last}');
    var uploadTask = firebaseRef.putFile(file!);
    var taskSnapshot = await uploadTask.whenComplete(() async {
      MotionToast.info(
          description: Text("การเพิ่มรูป"),
          title: Text("ทำรายการสำเร็จ",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ).show(context);
    }).then((value) async{
      imageUrl = await value.ref.getDownloadURL();
      updateImageProfile(imageUrl.toString());
      // insertValueToFireStore();
    });
  }

  Future<void> uploadBackgoundToStorage(String imagePath, BuildContext context) async{
    var firebaseRef = await FirebaseStorage.instance
    .ref()
    .child('backgound/${imagePath.split('/').last}');
    var uploadTask = firebaseRef.putFile(fileBackgound!);
    var taskSnapshot = await uploadTask.whenComplete(() async {
      MotionToast.info(
          description: Text("การเพิ่มรูป"),
          title: Text("ทำรายการสำเร็จ",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ).show(context);
    }).then((value) async{
      imageUrlBackground = await value.ref.getDownloadURL();
      print(imageUrl);
      // insertValueToFireStore();
    });
  }

  

  // Future<void> getImage (ImageSource imageSource, BuildContext context) async {
  //   final pickedFile = await ImagePicker().getImage(source: imageSource);
  //   if (pickedFile != null) {
  //     selectedImagePath.value = pickedFile.path;
  //   } else {
  //       MotionToast.error(
  //         description: Text("การเพิ่มรูป"),
  //         title: Text("ไม่ได้ทำรายการสำเร็จ",
  //             style: TextStyle(fontWeight: FontWeight.bold)),
  //       ).show(context);
  //   }
  // }




}
