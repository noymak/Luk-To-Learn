import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              child: CircleAvatar(
                child: Icon(Icons.add_a_photo_outlined,size: 60,),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('assets/images/profile.jpg')),
                ),
                Positioned(
                  right: 3,
                  bottom: 3,
                  child: Container(
                    width: 35,
                    height: 35,
                    child: CircleAvatar(
                      child: Icon(Icons.add_a_photo_outlined),
                      backgroundColor: Colors.white,
                      radius: 55,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ชื่อผู้สอน',
                  style: GoogleFonts.kanit(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 300,
                  height: 40,
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'ชื่อคอร์ส',
                  style: GoogleFonts.kanit(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 300,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'ราคา',
                  style: GoogleFonts.kanit(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 300,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'รายละเอียดคอร์ส',
                  style: GoogleFonts.kanit(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 300,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                          Navigator.pushNamed(context, '/checkinfocourse');
                        },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: kPrimaryColor),
                    child: Center(
                      child: Text('เพิ่มคอร์ส',
                      style: GoogleFonts.kanit(
                          fontSize: 20, fontWeight: FontWeight.bold,color: kPrimaryLightColor),),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
