import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/model/video.demo.dart';
import 'package:luk_to_learn/widgets/loading.dart';
import 'package:video_player/video_player.dart';

class CourseVideoNew extends StatefulWidget {
  const CourseVideoNew({super.key});

  @override
  State<CourseVideoNew> createState() => _CourseVideoNewState();
}

class _CourseVideoNewState extends State<CourseVideoNew> {
  bool onFullScreen = false;
  late VideoPlayerController _videoPlayController;
  late ChewieController _chewieController;
  double _aspectRatio = 16 / 9;

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final h = twoDigits(duration.inHours);
    final m = twoDigits(duration.inMinutes.remainder(60));
    final s = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) h, m, s].join(':');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayController =
        VideoPlayerController.network('${videoDemo[0].fileUrl}')
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });

    _chewieController = ChewieController(
      showOptions: false,
      materialProgressColors: ChewieProgressColors(
        backgroundColor: Colors.white,
        bufferedColor: Colors.red,
      ),
      allowedScreenSleep: false,
      allowFullScreen: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
      videoPlayerController: _videoPlayController,
      aspectRatio: _aspectRatio,
      autoInitialize: true,
      autoPlay: true,
      showControls: true,
      fullScreenByDefault: true,
    );

    _chewieController.addListener(() {
      if (_chewieController.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayController.dispose();
    _chewieController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Scaffold(
        body: Column(
      children: [
        _videoPlayController.value.isInitialized
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _videoPlayController.value.isPlaying
                        ? _videoPlayController.pause()
                        : _videoPlayController.play();
                  });
                },
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: 300,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.red)),
                      child: SafeArea(
                        child: Chewie(controller: _chewieController),
                      ),
                    ),
                  ],
                ),
              )
            : AspectRatio(
                aspectRatio: _aspectRatio, child: onMyLoad(size, Colors.amber)),
        Expanded(
          child: ListView.builder(
            itemCount: videoDemo.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: FlutterLogo(),
                iconColor: Colors.amber,
                title: Text('${videoDemo[index].titleName}'),
                onTap: () {
                  setState(() {
                    _videoPlayController.pause();
                    _videoPlayController = VideoPlayerController.network(
                        '${videoDemo[index].fileUrl}')
                      ..initialize().then((_) {
                        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
                        setState(() {});
                      });
                    _chewieController = ChewieController(
                      allowedScreenSleep: false,
                      allowFullScreen: true,
                      deviceOrientationsAfterFullScreen: [
                        DeviceOrientation.landscapeRight,
                        DeviceOrientation.landscapeLeft,
                        DeviceOrientation.portraitUp,
                        DeviceOrientation.portraitDown,
                      ],
                      videoPlayerController: _videoPlayController,
                      aspectRatio: _aspectRatio,
                      autoInitialize: true,
                      autoPlay: true,
                      showControls: true,
                    );
                    _chewieController.addListener(() {
                      if (_chewieController.isFullScreen) {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.landscapeRight,
                          DeviceOrientation.landscapeLeft,
                        ]);
                      } else {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.portraitUp,
                          DeviceOrientation.portraitDown,
                        ]);
                      }
                    });
                    //print(videoDemo[index].titleName);
                  });
                },
              );
            },
          ),
        )
      ],
    ));
  }
}
