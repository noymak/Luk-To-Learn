import 'package:flutter/material.dart';

class MycourseTutor extends StatefulWidget {
  const MycourseTutor({Key? key}) : super(key: key);

  @override
  State<MycourseTutor> createState() => _MycourseTutorState();
}

class _MycourseTutorState extends State<MycourseTutor> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
            )
          ],
        ),
      ),
    );
  }
}
