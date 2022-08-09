import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileTutor extends StatefulWidget {
  const EditProfileTutor({Key? key}) : super(key: key);

  @override
  State<EditProfileTutor> createState() => _EditProfileTutorState();
}

class _EditProfileTutorState extends State<EditProfileTutor> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff6360FF),
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
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sarah William',
                            style: GoogleFonts.kanit(fontSize: 13, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Developer & Instructor',
                            style: GoogleFonts.kanit(fontSize: 13, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 160,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/routetutor');
                        },
                        child: Icon(
                          Icons.keyboard_return,
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
                height: size.height,
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
                                          Row(
                                            children: [
                                              Text(
                                                'รายละเอียดคอร์ส',
                                                style: GoogleFonts.kanit(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text('แก้ไข'),
                                              Icon(Icons.edit)
                                            ],
                                          ),
                                          Text(
                                            'เราติดตามและดูแลนักเรียนของ\nเราเหมือนลูกจนประสบความสำเร็จ',
                                            style: GoogleFonts.kanit(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Stack(children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            color: Color(0xff6360FF),
                                          ),
                                        ),
                                        Positioned(
                                            right: 3,
                                            bottom: 3,
                                            child: Icon(
                                                Icons.add_a_photo_outlined))
                                      ]),
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
                        height: 15,
                      ),
                      Text('Courses offered',
                          style: GoogleFonts.kanit(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      coursebox(size),
                      SizedBox(
                        height: 10,
                      ),
                      coursebox(size),
                      SizedBox(
                        height: 10,
                      ),
                      coursebox(size),
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
          Icon(Icons.edit_calendar),
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
                style: GoogleFonts.kanit(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "850.00 BTH",
                style: GoogleFonts.kanit(fontWeight: FontWeight.bold),
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
                    style: GoogleFonts.kanit(fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.amber,
                    size: 10,
                  ),
                  Text(
                    "By SomChai Wong",
                    style: GoogleFonts.kanit(color: Colors.grey),
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.amber,
                    size: 10,
                  ),
                  Text(
                    "All Level",
                    style: GoogleFonts.kanit(color: Colors.grey),
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
