import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/widgets/cartlistbuy.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: kPrimaryLightColor,
                        ),
                        Text(
                          'Add Courses',
                          style: GoogleFonts.kanit(
                            
                              fontSize: 20,
                              color: kPrimaryLightColor,
                            
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: size.width,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
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
                        style: GoogleFonts.kanit(
                            
                              fontSize: 20,
                              color: kPrimaryLightColor,
                              fontWeight: FontWeight.bold,
                            
                          ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            '14 Courses',
                            style: GoogleFonts.kanit(
                            
                              fontSize: 16,
                              color: kPrimaryLightColor,
                            
                          ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.circle,
                            size: 6,
                            color: kPrimaryLightColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '1,400 Students',
                            style:GoogleFonts.kanit(
                            
                              fontSize: 16,
                              color: kPrimaryLightColor,
                            
                          ),
                          ),
                        ],
                      ),
                      // Divider(
                      //   color: Colors.grey,
                      //   thickness: 10,
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 230, 230, 236),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
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
                              style: GoogleFonts.kanit(
                                
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                               
                              ),
                            ),
                            Text(
                              "Total 4",
                              style: GoogleFonts.kanit(
                            
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            
                          ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        cartlistbuy(size: size),
                        SizedBox(
                          height: 15,
                        ),
                        cartlistbuy(size: size),
                        SizedBox(
                          height: 15,
                        ),
                        cartlistbuy(size: size),
                        SizedBox(
                          height: 15,
                        ),
                        cartlistbuy(size: size),
                        // SizedBox(
                        //   height: 15,
                        // ),
                        // coursebox(size),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 260,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kPrimaryColor1,
                        ),
                        child: Center(
                            child: Text(
                          'Add Courses',
                          style: GoogleFonts.kanit(
                            
                              fontSize: 20,
                              color: kPrimaryLightColor,
                              fontWeight: FontWeight.bold,
                            
                          ),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

