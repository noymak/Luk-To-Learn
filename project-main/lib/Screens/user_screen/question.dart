import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            color: Color(0xff6360FF),
            height: size.height * 0.15,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/route');
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text("Frequntly asked question",
                                style: GoogleFonts.kanit(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[300])),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "คำถามที่พบบ่อย",
                      style:
                          GoogleFonts.kanit(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: size.width,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'อยากสมัครเรียนหลายๆ คอร์สทีเดียวสามารถทำได้มั้ย? \n\n:สามารถสมัครเรียนทีละคอร์สหรือหลายๆ คอร์ส พร้อมกันทีเดียวก็ได้ โดย ถ้าสมัครหลายคอร์สทีเดียวกัน ในหน้ารายละเอียดคอร์ส เลือก “เพิ่มลงในตะกร้า”เมื่อต้องการจะชำระเงิน เลือกเมนู “ตะกร้า” จากนั้นก็ชำระเงินได้ทันที',
                          style: GoogleFonts.kanit(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: size.width,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'ต้องรอเรียนพร้อมกับเอกสารประกอบการเรียนมั้ย? \n\nน้องๆ สามารถเริ่มเรียนบทเรียนออนไลน์ในคอร์สล่วงหน้าได้ก่อนเลย แม้ยังไม่มีเอกสาร เพราะเอกสารประกอบการเรียนเป็นส่วนเพิ่มเติมจากคอร์ส ซึ่งเนื้อหาในเอกสารส่วนใหญ่เป็นแบบฝึกหัดและแนวข้อสอบเพื่อให้น้องๆ ได้ฝึกทำทบทวนในสิ่งที่เรียน',
                          style: GoogleFonts.kanit(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}