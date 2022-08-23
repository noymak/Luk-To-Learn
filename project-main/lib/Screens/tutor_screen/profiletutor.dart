import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/widgets/cartlistbuy.dart';
import 'package:luk_to_learn/widgets/coursebox.dart';

import '../../model/courses.dart';

class ProfileTutor extends StatefulWidget {
  const ProfileTutor({Key? key}) : super(key: key);

  @override
  State<ProfileTutor> createState() => _ProfileTutorState();
}

class _ProfileTutorState extends State<ProfileTutor> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColors,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: 20,
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              AssetImage('assets/images/profile.jpg'),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            'Welcomeback',
                            style: GoogleFonts.kanit(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: kPrimaryLightColor,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 3,
                          // ),
                          Text(
                            'Sarah William',
                            style: GoogleFonts.kanit(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: kPrimaryLightColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 150,),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/editprofiletutor');
                        },
                        child: Icon(
                          Icons.settings,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: size.width,
                height: size.height*2,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: size.width,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.white),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'รายละเอียดคอร์ส',
                                            style: GoogleFonts.kanit(
                                              textStyle: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'เราติดตามและดูแลนักเรียนของ\nเราเหมือนลูกจนประสบความสำเร็จ',
                                            style: GoogleFonts.kanit(
                                              textStyle: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            color: Color(0xff6360FF)),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: size.width,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        color: Colors.grey[200]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Color(0xffFF8181)),
                        child: Center(
                          child: Text(
                            'Balance',
                            style: GoogleFonts.kanit(
                              textStyle: TextStyle(
                                fontSize: 20,
                                color: kPrimaryLightColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'My Courses',
                        style: GoogleFonts.kanit(
                          textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ...List.generate(
                        coursesInfo.length,
                        (index) => cartlistbuy(
                          
                          linkImage: coursesInfo[index].image!,
                          nameCourse: coursesInfo[index].nameCourse!,
                          level: coursesInfo[index].level!,
                          name: coursesInfo[index].name!,
                          price: coursesInfo[index].price!,
                          rate: coursesInfo[index].rate!,
                          detail: coursesInfo[index].detail!,
                          profileTutors: coursesInfo[index].profileTutors!,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
