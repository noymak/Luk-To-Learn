import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';

class InfoCourse extends StatefulWidget {
  const InfoCourse({Key? key}) : super(key: key);

  @override
  State<InfoCourse> createState() => _InfoCourseState();
}

class _InfoCourseState extends State<InfoCourse> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColors,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          margin: EdgeInsets.only(top: 80),
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "รายละเอียดคอร์ส",
                  style: GoogleFonts.kanit(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'นาย กิต หวังทอง',
                                  style: GoogleFonts.kanit(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'ครูสอน ภาษาอังกฤษ',
                                  style: GoogleFonts.kanit(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 75,
                              height: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: kPrimaryColor1,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'ข้อมูลคอร์ส',
                          style: GoogleFonts.kanit(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Pack สอบติด สุดคุ้ม คอร์ส เคมี TCAS พร้อมตะลุย โจทย์ UpScore โฉมใหม่ที่ดีที่่สุดจาก Panya Society มั่นใจ สอบติดชัวร์ การันตี เคมี 70 คะแนน ขึ้นไป',
                          style: GoogleFonts.kanit(fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: size.width,
                          height: 120,
                          decoration: BoxDecoration(
                              color: kPrimaryColor1,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: size.width,
                          height: 120,
                          decoration: BoxDecoration(
                              color: kPrimaryColor1,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                                color: kPrimaryColor1,
                                borderRadius: BorderRadius.circular(20)),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Done',
                                style: GoogleFonts.kanit(
                                    fontSize: 25,
                                    color: kPrimaryLightColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
