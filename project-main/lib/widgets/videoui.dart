import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';

class VideoUi extends StatelessWidget {
  const VideoUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext index) {
    final nameVideoField = TextFormField(
      autofocus: false,
      // controller: nameVideoController.namevideoController,
      keyboardType: TextInputType.name,
      // onSaved: (value) {
      //   nameVideoController.namevideoController.text = value!;
      // },
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

     PlatformFile? pickedFile;
  UploadTask? uploadTask;

  // Future uploadFile() async {
  //   final path = 'videos/${pickedFile!.name}';
  //   final file = File(pickedFile!.path!);

  //   final ref = FirebaseStorage.instance.ref().child(path);
  //   setState(() {
  //     uploadTask = ref.putFile(file);
  //   });

  //   final snapshot = await uploadTask!.whenComplete(() {});

  //   final urlDownloand = await snapshot.ref.getDownloadURL();
  //   print('Download Link: $urlDownloand');

  //   setState(() {
  //     uploadTask = null;
  //   });
  // }

  // Future selectFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result == null) return;
  //   setState(() {
  //     pickedFile = result.files.first;
  //   });
  // }

    var selectFile;
    var uploadFile;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
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
          Container(
            
            height: 120,
            width: 220,
            decoration: BoxDecoration(
              color: kPrimaryColor1,
              borderRadius: BorderRadius.circular(26),
              
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'ตั้งชื่อให้แก่ Video ของท่าน',
            style: GoogleFonts.kanit(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          ElevatedButton(
                onPressed: selectFile,
                child: const Text('Selected File'),
              ),
              SizedBox(
                height: 32,
              ),
          nameVideoField,
          ElevatedButton(
                onPressed: uploadFile,
                child: const Text('Upload File'),
              ),
              SizedBox(height: 32,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     IconButton(
          //         onPressed: () {},
          //         icon: Icon(
          //           Icons.add_circle,
          //           color: Colors.greenAccent,
          //         )),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     IconButton(
          //         onPressed: () {},
          //         icon: Icon(
          //           Icons.remove_circle,
          //           color: Colors.redAccent,
          //         ))
          //   ],
          // )
        ],
      ),
    );
  }
}
