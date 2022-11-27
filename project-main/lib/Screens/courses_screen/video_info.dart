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
import 'package:luk_to_learn/model/media_source.dart';
import 'package:luk_to_learn/widgets/appbar.dart';
import 'package:luk_to_learn/widgets/videoui.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  @override
  var videoController = Get.put(CoursesController());

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

  final picker = ImagePicker();
  late VideoPlayerController _videoPlayerController;
  late File _video;

  // late final dynamic uint8list;

//   Future thumbnail () async {
//   uint8list = await VideoThumbnail.thumbnailData(
//   video: pickedFile!.path!,
//   imageFormat: ImageFormat.JPEG,
//   maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
//   quality: 25,
// );
//   }

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
    // ignore: deprecated_member_use
    final result = await picker.getVideo(source: ImageSource.gallery);
    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        if (result == null) return;
        setState(() {
          
        });
        _videoPlayerController.play();
      });
    
  }

  List<Widget> extractedChildren = <Widget>[VideoUi()];

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  if (pickedFile != null)
                    _videoPlayerController.value.isInitialized
                        ? AspectRatio(
                            aspectRatio:
                                _videoPlayerController.value.aspectRatio,
                            child: VideoPlayer(_videoPlayerController),
                          )
                        : Container(
                            // height: 120,
                            // width: 220,
                            // decoration: BoxDecoration(
                            //   color: kPrimaryColor1,
                            //   borderRadius: BorderRadius.circular(26),
                            // ),
                          )
                          else
                            Container(
                            height: 120,
                            width: 220,
                            decoration: BoxDecoration(
                              color: kPrimaryColor1,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: Center(child: Text('Pick video')),
                          ),
                  // SizedBox(
                  //   height: 200,
                  //   child: Container(
                  //     height: 120,
                  //     width: 220,
                  //     decoration: BoxDecoration(
                  //       color: kPrimaryColor1,
                  //       borderRadius: BorderRadius.circular(26),
                  //     ),
                  //     child: Image.file(
                  //       File(
                  //         pickedFile!.path!
                  //       ),
                  //       width: size.width,

                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),

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
                  SizedBox(
                    height: 20
                  ),
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
