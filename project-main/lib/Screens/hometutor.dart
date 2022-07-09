import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeTutor extends StatefulWidget {
  const HomeTutor({Key? key}) : super(key: key);

  @override
  State<HomeTutor> createState() => _HomeTutorState();
}

class _HomeTutorState extends State<HomeTutor> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_back_ios_new),
                        Text('data'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 2)),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'assets/images/home.png',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text('data'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              margin: EdgeInsets.only(top: size.height / 3),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 230, 236),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Row(
                children: [Icon(Icons.arrow_back_ios_new), Text('data')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
