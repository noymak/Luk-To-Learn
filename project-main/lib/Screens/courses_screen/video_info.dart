import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/courses_controller.dart';
import 'package:luk_to_learn/controllers/video_controller.dart';
import 'package:luk_to_learn/widgets/appbar.dart';
import 'package:luk_to_learn/widgets/videoui.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  @override
  var videoController = Get.put(CoursesController());

  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future uploadFile() async {
    final path = 'videos/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownloand = await snapshot.ref.getDownloadURL();
    print('Download Link: $urlDownloand');

    setState(() {
      uploadTask = null;
    });
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  List<Widget> extractedChildren = <Widget>[VideoUi()];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          backgroundColor: kPrimaryColors,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    extractedChildren.add(VideoUi());
                  });
                },
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.greenAccent,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    extractedChildren.removeLast();
                  });
                },
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
              Column(children: extractedChildren),
              ElevatedButton(
                onPressed: selectFile,
                child: const Text('Selected File'),
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: uploadFile,
                child: const Text('Upload File'),
              ),
              SizedBox(height: 32,),
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
          return const SizedBox(height: 50,);
        }
      },
    );



}
