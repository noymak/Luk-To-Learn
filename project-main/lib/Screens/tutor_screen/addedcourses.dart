import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luk_to_learn/constants.dart';

class AddedCourses extends StatefulWidget {
  const AddedCourses({Key? key}) : super(key: key);

  @override
  State<AddedCourses> createState() => _AddedCoursesState();
}

class _AddedCoursesState extends State<AddedCourses> {
  File? file;
  File? fileBackgound;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: size.width,
              child: Stack(
                children: [
                  
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: kPrimaryColor1,
                      image: DecorationImage(
                        image:fileBackgound != null
                        ? Image.file(
                            File(fileBackgound!.path.toString()),
                            fit: BoxFit.cover,
                          ).image
                        : Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/eng1.jpg?alt=media&token=9a20f909-a922-40ac-8ec8-ed8ce6adb0c5',
                            fit: BoxFit.cover,
                          ).image,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          chooseBackgound(ImageSource.gallery);
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
                Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: file != null
                        ? Image.file(
                            File(file!.path.toString()),
                            fit: BoxFit.cover,
                          ).image
                        : Image.asset('assets/images/profile.jpg').image,
                  ),
                ),
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
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ชื่อผู้สอน',
                  style: GoogleFonts.kanit(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 300,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'ชื่อคอร์ส',
                  style: GoogleFonts.kanit(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 300,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'ราคา',
                  style: GoogleFonts.kanit(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 300,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'รายละเอียดคอร์ส',
                  style: GoogleFonts.kanit(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 300,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/checkinfocourse');
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

  Future<Null> chooseBackgound(ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        fileBackgound = File(result!.path);
      });
    } catch (e) {}
  }
}
