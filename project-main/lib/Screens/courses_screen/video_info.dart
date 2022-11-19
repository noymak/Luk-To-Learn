import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
  var nameVideoController = Get.put(CoursesController());

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
            children: extractedChildren,
          ),
        ),
      ),
    );
  }
}
