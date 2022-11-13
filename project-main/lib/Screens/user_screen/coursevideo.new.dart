import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/model/video.demo.dart';
import 'package:video_player/video_player.dart';

class CourseVideoNew extends StatefulWidget {
  const CourseVideoNew({super.key});

  @override
  State<CourseVideoNew> createState() => _CourseVideoNewState();
}

class _CourseVideoNewState extends State<CourseVideoNew> {
  late VideoPlayerController _controller;
  int _currentIndex = 0;

  void _playVideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= test.length) return;
    _controller =
        VideoPlayerController.network('${test[_currentIndex].fileUrl}')
          ..addListener(() => setState(() {}))
          ..initialize().then((value) => _controller.play());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playVideo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: kPrimaryColors,
            height: 300,
            child: _controller.value.isInitialized
                ? Column(
                    children: [
                      SizedBox(height: 20,),
                      SizedBox(
                        width: 200,
                        child: VideoPlayer(_controller),
                      ),
                      SizedBox(height: 12,),
                    ],
                  )
                : Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: test.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                          
                          });
                        },
                        child: Text('${test[index].titleName}'),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
