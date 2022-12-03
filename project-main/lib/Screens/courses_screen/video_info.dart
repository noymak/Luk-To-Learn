import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:luk_to_learn/api/firebase_api.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/courses_controller.dart';
import 'package:path/path.dart' as path;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  File? _video;
  final TextEditingController videoNameController = TextEditingController();
  
  File? test;

  final _formKey = GlobalKey<FormState>();

  @override
  // var videoController = Get.put(CoursesController());

  changeFileNameOnly(String newFileName) async {
    print('Original path: ${_video!.path}');
    String dir = path.dirname(_video!.path);
    String newPath = path.join(dir, newFileName);
    print('NewPath: ${newPath}');
    test = _video!.renameSync(newPath);
  }

  Future uploadFile() async {
    if (_video == null) return;

    final ref =
        FirebaseStorage.instance.ref('videoImage/').child(test!.path.split('/').last);
    setState(() {
      uploadTask = ref.putFile(test!);
    });

    if (uploadTask == null) return;

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');

    setState(() {
      uploadTask = null;
    });
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() {
      _video = File(path);
    });
  }

  Widget build(BuildContext context) {
    final fileName = _video != null ? (_video!.path) : 'no selected video';
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          backgroundColor: kPrimaryColors,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.greenAccent,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.remove_circle,
                  color: Colors.redAccent,
                ))
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                children: [
                  Center(
                    child: Text(
                      'เลือก Video ที่ต้องการ',
                      style: GoogleFonts.kanit(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    fileName,
                    style: GoogleFonts.kanit(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: selectFile,
                    child: const Text('Selected File'),
                  ),
                  Text(
                    'ตั้งชื่อให้แก่ Video ของท่าน',
                    style: GoogleFonts.kanit(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      autofocus: false,
                      controller: videoNameController,
                      keyboardType: TextInputType.name,
                      // onChanged: (value) => changeFileNameOnly(value),
                      onSaved: (value) {
                        print(value);
                        changeFileNameOnly(value!);
                        print('saved');
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.video_camera_front),
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: 'Video Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                       _formKey.currentState!.save();
                      //print(videoNameController.value.text);
                      print(_video!.path.toString());
                      print(test!.path.toString());
                      uploadFile();
                    },
                    child: const Text('Upload File'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              buildProgress(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
        stream: uploadTask?.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            double progress = data.bytesTransferred / data.totalBytes;

            return SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.greenAccent,
                  ),
                  Center(
                    child: Text(
                      '${(100 * progress).roundToDouble()}%',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox(
              height: 50,
            );
          }
        },
      );
}
