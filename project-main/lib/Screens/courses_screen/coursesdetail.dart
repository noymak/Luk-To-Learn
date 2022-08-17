import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/widgets/cartlist.dart';
import 'package:luk_to_learn/widgets/cartlistbuy.dart';

import '../../model/courses.dart';

class CoursesDetails extends StatefulWidget {
  // CoursesDetails(
  //     {Key? key,
  //     required this.size,
  //     required this.linkImage,
  //     required this.nameCourse,
  //     required this.price,
  //     required this.rate,
  //     required this.name,
  //     required this.level,
  //     required this.detail})
  //     : super(key: key);

  // final Size size;
  // final String? linkImage;
  // final String? nameCourse;
  // final int? price;
  // final String? rate;
  // final String? name;
  // final String? level;
  // final String? detail;

  @override
  State<CoursesDetails> createState() => _CoursesdetailState();

  static where(bool Function(dynamic listbuy) param0) {}
}

class _CoursesdetailState extends State<CoursesDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(Get.arguments[0].toString());
    void checkIndex() {}
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: Container(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Container(
                height: 200,
                width: size.width,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/home.png?alt=media&token=ac41b51d-1db1-4d7c-a710-ca96d7a715fe',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/profile.jpg?alt=media&token=a4d813b7-e66c-4fe0-82a7-4348ae78d454'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Azmaa",
                      style: GoogleFonts.kanit(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                    'ผู้สอน (Tutor) ระดับมืออาชีพ ของ THE BEST ENGLISH ที่มีประสบการณ์ในการสอนภาษาอังกฤษมายาวนานกว่า 20 ปี อีกทั้งยังมีความรู้เกี่ยวกับภาษาอังกฤษในทุกๆด้าน และพร้อมที่จะช่วยให้คุณได้พัฒนาทักษะด้านภาษาอังกฤษได้อย่างแท้จริง ทุกอาชีพสามารถเรียนรู้ภาษาอังกฤษได้อย่างง่ายดาย และ รวดเร็ว โดยการเรียนการสอน ที่ทำให้ท่านสามารถเรียนรู้ภาษาอังกฤษโดยธรรมชาติ เรียนตัวต่อตัวกับผู้สอน มีหลากหลายคอร์สที่ออกแบบเฉพาะ เพื่อให้ผู้เรียนเข้าใจง่าย เป็นเร็ว ภาษาอังกฤษ ผู้ใหญ่ ภาษาอังกฤษ เด็ก ภาษาอังกฤษพนักงานออฟฟิศ ภาษาอังกฤษ คนทำงาน ทุกคอร์สออกแบบเฉพาะโดยใช้ผู้เรียนเป็นศูนย์กลางออกแบบคอร์สเรียนเพื่อให้เรียนรู้ภาษาอังกฤษอย่างรวดเร็วแม้ไม่มีพื้นฐาน',style: GoogleFonts.kanit(
                          fontSize: 18,),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
