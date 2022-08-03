import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';

class AddCourses extends StatefulWidget {
  const AddCourses({Key? key}) : super(key: key);

  @override
  State<AddCourses> createState() => _AddCoursesState();
}

class _AddCoursesState extends State<AddCourses> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColors,
      // theme: ThemeData(
      //   textTheme: GoogleFonts.latoTextTheme(
      //     Theme.of(context).textTheme,
      //   ),
      // ),
      body: Column(
        children: [
          SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10)),
                Icon(
                  Icons.arrow_back_ios_new,
                  color: kPrimaryLightColor,
                ),
                Text(
                  'Add Courses',
                  style: TextStyle(
                    fontSize: 16,
                    color: kPrimaryLightColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sarah William',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryLightColor,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          '14 Courses',
                          style: TextStyle(
                            color: kPrimaryLightColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.circle,
                          size: 8,
                          color: kPrimaryLightColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '1,400 Students',
                          style: TextStyle(
                            color: kPrimaryLightColor,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height*0.694,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 230, 236),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),),),
                      child: Column(
                        children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Courses",
                                    style: TextStyle(
                                        fontSize: 26, fontWeight: FontWeight.bold),
                                  ),
                                  Text("Total 4",
                                    style: TextStyle(
                                        fontSize: 26, fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              coursebox(size),
                              SizedBox(
                                height: 15,
                              ),
                              coursebox(size),
                              SizedBox(
                                height: 15,
                              ),
                              coursebox(size),
                              // SizedBox(
                              //   height: 15,
                              // ),
                              // coursebox(size),
                              // SizedBox(
                              //   height: 15,
                              // ),
                              // coursebox(size),
                            ],
                          ),
                        ),
                      ],
                      ),
            ),
          ),
        ],
      ),
    );
  }
}


Container coursebox(Size size) {
    return Container(
      width: size.width,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color(0xffFF8181),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Declarative interfaces for any Apple \nDevices",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "850.00 BTH",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.amber,
                      size: 10,
                    ),
                    Text(
                      "By SomChai Wong",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.amber,
                      size: 10,
                    ),
                    Text(
                      "All Level",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }