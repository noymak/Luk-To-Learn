import 'package:flutter/material.dart';
import 'package:luk_to_learn/constants.dart';

class AddedCourses extends StatefulWidget {
  const AddedCourses({Key? key}) : super(key: key);

  @override
  State<AddedCourses> createState() => _AddedCoursesState();
}

class _AddedCoursesState extends State<AddedCourses> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: size.width,
              color: kPrimaryColors,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 90,
              height: 90,
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('อิอิ'),
                Container(width: 300, child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                ),),
                Text('อิอิ'),
                Container(width: 300, child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                ),),
                Text('อิอิ'),
                Container(width: 300, child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                ),),
                Text('อิอิ'),
                Container(width: 300, child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
