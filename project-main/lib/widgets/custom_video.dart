import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideo extends StatefulWidget {
  const CustomVideo({Key? key}) : super(key: key);

  @override
  State<CustomVideo> createState() => _CustomVideoState();
}

class _CustomVideoState extends State<CustomVideo> {
  late VideoPlayerController _controller;
  Widget? controls;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/videos/y2mate.com - STAYC스테이씨 BEAUTIFUL MONSTER Dance Practice_1080p.mp4')
      ..initialize().then((_) {
        setState(() {});
      })
      ..addListener(() {
        if (_controller.value.isPlaying) {
          controls = GestureDetector(
            onTap: () {
              setState(() {
                _controller.pause();
              });
            },
            child: Image.asset(
              'assets/images/icon-pause.png',
              // color: Colors.amber,
              height: 50,
            ),
          );
        } else if (_controller.value.position.inMilliseconds -
                _controller.value.duration.inMilliseconds <
            1) {
          controls = GestureDetector(
            onTap: (() {
              setState(() {
                _controller.play();
              });
            }),
            child: Image.asset(
              'assets/images/icon-play.png',
              color: Colors.amber,
              height: 50,
            ),
          );
        }
      });
  }

  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(
            _controller,
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [controls ?? Container()],
            ),
          ),
        ],
      ),
    );
  }
}
