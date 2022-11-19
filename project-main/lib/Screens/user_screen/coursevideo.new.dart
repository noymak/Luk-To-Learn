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
                child: Stack(
                  children: [
                    // AspectRatio(
                    //   aspectRatio: _videoPlayController.value.aspectRatio,
                    //   child: VideoPlayer(_videoPlayController),
                    // ),
                    Container(
                        width: size.width,
                        height: 300,
                        child: Chewie(controller: _chewieController)),
                    // Positioned(
                    //   bottom: 0,
                    //   left: 0,
                    //   right: 0,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       ValueListenableBuilder(
                    //           valueListenable: _videoPlayController,
                    //           builder: (context, VideoPlayerValue value, child) {
                    //             return Text(_videoDuration(value.position));
                    //           }),
                    //       Expanded(
                    //         child: SizedBox(
                    //           height: 14,
                    //           child: VideoProgressIndicator(
                    //             _videoPlayController,
                    //             padding: const EdgeInsets.symmetric(vertical: 0),
                    //             allowScrubbing: true,
                    //           ),
                    //         ),
                    //       ),
                    //       Text(
                    //           _videoDuration(_videoPlayController.value.duration))
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              )
            : AspectRatio(
              aspectRatio: _aspectRatio,
              child: onMyLoad(size, Colors.amber)),
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
