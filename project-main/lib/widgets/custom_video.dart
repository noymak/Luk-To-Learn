import 'package:flutter/material.dart';
import 'package:luk_to_learn/widgets/videowidget.dart';
import 'package:video_player/video_player.dart';


class CustomVideo extends StatefulWidget {
  const CustomVideo({Key? key}) : super(key: key);

  @override
  State<CustomVideo> createState() => _CustomVideoState();
}

class _CustomVideoState extends State<CustomVideo> {
  final asset = 'assets/videos/y2mate.com - STAYC스테이씨 BEAUTIFUL MONSTER Dance Practice_1080p.mp4';
  late VideoPlayerController _controller;
  
  var key;
  // Widget? controls;

   @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _controller.play());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = _controller.value.volume == 0;

    return Column(
      children: [
        VideoPlayerWidget(key: key, controller: _controller, ),
        const SizedBox(height: 32),
        if (_controller != null && _controller.value.isInitialized)
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            child: IconButton(
              icon: Icon(
                isMuted ? Icons.volume_mute : Icons.volume_up,
                color: Colors.white,
              ),
              onPressed: () => _controller.setVolume(isMuted ? 1 : 0),
            ),
          )
      ],
    );
  }
}
