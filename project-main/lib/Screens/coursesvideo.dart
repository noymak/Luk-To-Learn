import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:luk_to_learn/widgets/custom_video.dart';

class CoursesVideo extends StatefulWidget {
  final String title;
  const CoursesVideo({Key? key, required this.title}) : super(key: key);

  @override
  State<CoursesVideo> createState() => _CoursesVideoState();
}

class _CoursesVideoState extends State<CoursesVideo> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Color(0xff6360FF),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          'Introduction',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                        
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomVideo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
