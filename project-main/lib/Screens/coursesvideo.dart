import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:video_player/video_player.dart';

class CoursesVideo extends StatefulWidget {
  final String title;
  const CoursesVideo({Key? key, required this.title}) : super(key: key);

  @override
  State<CoursesVideo> createState() => _CoursesVideoState();
}

class _CoursesVideoState extends State<CoursesVideo> {
  late VideoPlayerController _controller;
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(
        'https://res.cloudinary.com/dtdhnrtir/video/upload/v1659454145/video/y2mate.com_-_STAYC%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%94%A8_BEAUTIFUL_MONSTER_Dance_Practice_1080p_rskuzt.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Introduction',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
