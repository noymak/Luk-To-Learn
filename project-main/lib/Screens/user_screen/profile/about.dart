import 'package:flutter/material.dart';

import '../../../constants.dart';

class AboutLTL extends StatefulWidget {
  const AboutLTL({Key? key}) : super(key: key);

  @override
  State<AboutLTL> createState() => _AboutLTLState();
}

class _AboutLTLState extends State<AboutLTL> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColors,
        title: Text('About Luk to Learn'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          
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
                      "ทำไมต้องเลือก Luk to Learn",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Luk to Learn เป็นสถานที่ที่มีแนวคิดเพื่อพัฒนาบุตรหลานของท่าน ภายในสโลแกน"เพื่อบุตรหลานสร้างรากฐานสู่อนาคต" ตามทฤษฎีการเรียนรู้ของ เบนจามิน บลูมและคณะ (Bloom et al, 1956) โดยนักเรียนของเราจะได้มุ่งเน้นการเรียนรู้ ทั้งด้านพุทธิพิสัย (Cognitive Domain) มุ่งเน้นทางด้านวิชาการเพื่อผลสัมฤทธิ์ทางการเรียนให้ดีขึ้น เป็นการพัฒนาทั้งระบบความคิด คิดอย่างมีขั้นตอน มีเหตุมีผล และสามารถตรวจสอบคำตอบได้อย่างถูกต้อง ด้านทักษะพิสัย (Psychomotor Domain) บุตรหลานได้ลงมือทำ ปฏิบัติจริง ในวิชาที่ปฏิบัติ ฝึกฝนจนเกิดความเป็นชำนาญ คงทนที่คิดตัวไปกับบุตรหลานให้ได้ใช้ได้จริง และด้านเจตพิสัย (Affective Domain) บุตรหลานของท่านได้มาพัฒนาสร้างมิตรไมตรีสัมพันธ์ ภายใต้บรรยากาศที่เอื้อต่อการเรียนรู้ ดังนั้น Luk to Learn จึงได้เป็นจุดเริ่มต้น การวางรากฐานที่ดีทางศึกษา เพื่อมุ่งสู่อนาคตที่สดใส โดยวางแผนร่วมมือกันระหว่าง Luk to Learn ครูผู้สอนที่มีศักยภาพ นักเรียนและผู้ปกครองเพื่อเป้าหมายไปด้วยกัน',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )
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
