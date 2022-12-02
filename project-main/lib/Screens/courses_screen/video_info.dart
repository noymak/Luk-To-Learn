import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:luk_to_learn/api/firebase_api.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/courses_controller.dart';


class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  File? _video;
  @override
  // var videoController = Get.put(CoursesController());

  final nameVideoField = TextFormField(
    autofocus: false,
    // controller: controller,
    keyboardType: TextInputType.name,
    onSaved: (value) {
      // controller.text = value!;
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
  );

  Future saveName() async {
    if (nameVideoField == null) return;
     
  }

  Future uploadFile() async {
    if (_video == null) return;

    final videoName = (_video!.path);
    final destination = 'videotest/$videoName';

    // final ref = FirebaseStorage.instance.ref().child('path');
    // setState(() {
    //   uploadTask = ref.putFile(_video!);
    // });

    uploadTask = FirebaseApi.uploadFile(destination, _video!);

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
                  nameVideoField,
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: uploadFile,
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


