import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/widgets/lessoncard.dart';
import 'package:luk_to_learn/model/video.demo.dart';
import 'package:collection/collection.dart';
import 'package:video_player/video_player.dart';

import '../../model/lesson.dart';

class CoursesVideo extends StatefulWidget {
  final String title;

  const CoursesVideo({Key? key, required this.title}) : super(key: key);

  @override
  State<CoursesVideo> createState() => _CoursesVideoState();
}

class _CoursesVideoState extends State<CoursesVideo> {
  var courseName = Get.arguments[0];
  late VideoPlayerController _controller;
  int _selectedTag = 0;

  var video =
      'https://res.cloudinary.com/dtdhnrtir/video/upload/v1668323007/video/STAYC_%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%94%A8_ASAP_MV_olqai5.mp4';
  var showList = [];
  void _playVideo() {
    var newList = videoDemo.firstWhere(
      (element) => element.c_id == courseName,
    );

    showList.add(newList);
    print('asdasdasasdasddas ' + showList.toString());
    //print(newList.titleName)
    _controller = VideoPlayerController.network(video)
      ..addListener(() => setState(() {}))
      ..initialize();
  }

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    ;
    _playVideo();
    // _controller = VideoPlayerController.network(
    //     'https://res.cloudinary.com/dtdhnrtir/video/upload/v1668323007/video/STAYC_%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%94%A8_ASAP_MV_olqai5.mp4')
    //   ..initialize().then((_) {
    //     setState(() {});
    //   });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
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
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (() {
                  Navigator.pushNamed(context, '/courses');
                }),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: kPrimaryColors,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Introduction',
                        style: GoogleFonts.kanit(
                          fontSize: 26,
                          color: kPrimaryColors,
                        ),
                      ),
                    ),
                  ],
                ),
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
              SizedBox(
                height: 8,
              ),
              CustomTabView(
                index: _selectedTag,
                changeTab: changeTab,
              ),
              _selectedTag == 0 ? PlayList() : const Description(),
            ],
          ),
        ),
      ),
      //  bottomSheet: BottomSheet(
      //     onClosing: () {},
      //     backgroundColor: Colors.white,
      //     enableDrag: false,
      //     builder: (context) {
      //       return const SizedBox(
      //         height: 80,
      //         child: EnrollBottomSheet(),
      //       );
      //     },
      //   ),
    );
  }

  PlayList() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) {
          return const SizedBox(
            height: 20,
          );
        },
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        shrinkWrap: true,
        itemCount: lessonList.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              print(index);
              // if (index == 1) {
              //   setState(() {
              //     _controller = VideoPlayerController.network('https://res.cloudinary.com/dtdhnrtir/video/upload/v1668323007/video/STAYC_%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%94%A8_ASAP_MV_olqai5.mp4')
              //       ..initialize().then((_) {
              //         setState(() {});
              //       });
              //   });
              //   // print('test');
              // }
            },
            // child: LessonCard(lesson: lessonList[index]),
            child: Container(
              width: double.infinity,
              height: 20,
              child: ListView.builder(
                  itemCount: showList.length,
                  itemBuilder: (context, index) {
                    print(showList.length);
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            video = showList[index].fileUrl;
                            print(video);
                          });
                        },
                        child: Text(showList[index].c_id));
                  }),
            ),
          );
        },
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(
        "Build Flutter iOS and Android Apps with a Single \nCodebase: Learn Google's Flutter Mobile Development Framework & Dart",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;
  const CustomTabView({Key? key, required this.changeTab, required this.index})
      : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = ["Course Content", "Discussion"];

  Widget _buildTags(int index) {
    var kPrimaryColors;
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .08, vertical: 15),
        decoration: BoxDecoration(
          color: widget.index == index ? kPrimaryColors : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _tags[index],
          style: TextStyle(
              color: widget.index != index ? Colors.black : Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kPrimaryColors,
      ),
      child: Row(
        children: _tags
            .asMap()
            .entries
            .map((MapEntry map) => _buildTags(map.key))
            .toList(),
      ),
    );
  }
}

// class EnrollBottomSheet extends StatefulWidget {
//   const EnrollBottomSheet({Key? key}) : super(key: key);

//   @override
//   _EnrollBottomSheetState createState() => _EnrollBottomSheetState();
// }

// class _EnrollBottomSheetState extends State<EnrollBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 30.0,
//       ),
//       child: Row(
//         children: [
//           CustomIconButton(
//             onTap: () {},
//             height: 45,
//             width: 45,
//             child: const Icon(
//               Icons.favorite,
//               color: Colors.pink,
//               size: 30,
//             ),
//           ),
//           const SizedBox(
//             width: 20,
//           ),
//           Expanded(
//             child: CustomIconButton(
//               onTap: () {},
//               color: kPrimaryColors,
//               height: 45,
//               width: 45,
//               child: const Text(
//                 "Enroll Now",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class CustomIconButton extends StatelessWidget {
//   final Widget child;
//   final double height;
//   final double width;
//   final Color? color;
//   final VoidCallback onTap;

//   const CustomIconButton({
//     Key? key,
//     required this.child,
//     required this.height,
//     required this.width,
//     this.color = Colors.white,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Ink(
//       child: InkWell(
//         borderRadius: BorderRadius.circular(12),
//         child: Center(child: child),
//         onTap: onTap,
//       ),
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(.1),
//             blurRadius: 2.0,
//             spreadRadius: .05,
//           ), //BoxShadow
//         ],
//       ),
//     );
//   }
// }