import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesDetails extends StatefulWidget {
  const CoursesDetails({Key? key}) : super(key: key);

  @override
  State<CoursesDetails> createState() => _CoursesdetailState();
}

class _CoursesdetailState extends State<CoursesDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(Get.arguments[0].toString());
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(child: Text(Get.arguments[0]),),
    );
  }
}