class Courses {
  String? image;
  String? nameCourse;
  int? price;
  String? rate;
  String? name;
  String? level;
  String? detail;
  String? profileTutors;

  Courses({
    required this.image,
    required this.nameCourse,
    required this.price,
    required this.rate,
    required this.name,
    required this.level,
    required this.detail,
    required this.profileTutors,
  });



}

List<Courses> coursesInfo = [
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/eng1.jpg?alt=media&token=9a20f909-a922-40ac-8ec8-ed8ce6adb0c5',
   nameCourse: 'คอร์สเรียนภาษาอังกฤษออน์ไลน์ \nกับ Andrew',
   price: 850, 
   rate: '4.5', 
   name: 'Andrew', 
   level: 'beginner',
   detail: 'ผู้สอน (Tutor) ระดับมืออาชีพ ของ THE BEST ENGLISH ที่มีประสบการณ์ในการสอนภาษาอังกฤษมายาวนานกว่า 20 ปี อีกทั้งยังมีความรู้เกี่ยวกับภาษาอังกฤษในทุกๆด้าน และพร้อมที่จะช่วยให้คุณได้พัฒนาทักษะด้านภาษาอังกฤษได้อย่างแท้จริง ทุกอาชีพสามารถเรียนรู้ภาษาอังกฤษได้อย่างง่ายดาย และ รวดเร็ว โดยการเรียนการสอน ที่ทำให้ท่านสามารถเรียนรู้ภาษาอังกฤษโดยธรรมชาติ เรียนตัวต่อตัวกับผู้สอน มีหลากหลายคอร์สที่ออกแบบเฉพาะ เพื่อให้ผู้เรียนเข้าใจง่าย เป็นเร็ว ภาษาอังกฤษ ผู้ใหญ่ ภาษาอังกฤษ เด็ก ภาษาอังกฤษพนักงานออฟฟิศ ภาษาอังกฤษ คนทำงาน ทุกคอร์สออกแบบเฉพาะโดยใช้ผู้เรียนเป็นศูนย์กลางออกแบบคอร์สเรียนเพื่อให้เรียนรู้ภาษาอังกฤษอย่างรวดเร็วแม้ไม่มีพื้นฐาน',
   profileTutors: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/profile_andrew.jpeg?alt=media&token=91b3d095-2339-4a5b-af1a-1111b1e9c05d',
  ),
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/math_a.jpg?alt=media&token=a443bceb-5a6f-47c1-b0e7-641271bea1b8', 
   nameCourse: 'คณิตศาสตร์ A-Level', 
   price: 5000, 
   rate: '4.8', 
   name:'Panya', 
   level: 'ม.6',
   detail: 'คอร์ส คณิตศาสตร์เสริม ม.5 เทอม 2 คิดคล่อง ไม่ท่องจำ ทำโจทย์ได้ โดย อ.นอตคอร์ส คณิตศาสตร์ ม.5 เทอม 2 (หลักสูตรใหม่) เสกเลขให้ง่าย เข้าใจได้ทุกคนด้วยเทคนิค Math Magic จากอาจารย์นอตคณิตศาสตร์ ม.5 เทอม 2 หลักสูตรใหม่ประกอบไปด้วยเนื้อหา 3 บท คือ จำนวนเชิงซ้อน, หลักการนับเบื้องต้น และความน่าจะเป็น ในบทเรียนจะประกอบไปด้วยเนื้อหาที่ปูพื้นฐานตั้งแต่ง่ายจนถึงระดับสูง เน้นให้นักเรียนเข้าใจ ไม่ต้องท่องจำ และอธิบายอย่างละเอียดโดยเชื่อมโยงกับชีวิตจริง พร้อมแบบฝึกหัดทุกระดับทั้งง่าย-ยาก มั่นใจได้ว่าหลังจากที่น้องได้เรียนเทคนิค Math Magic แล้วจะเข้าใจเนื้อหาอย่างละเอียด และเสกโจทย์ยากให้กลายเป็นง่ายได้แน่นอนคอร์สนี้เหมาะกับน้องๆ ที่อยู่ชั้น ม.5 ที่โรงเรียนใช้หลักสูตรใหม่ (2560) ที่เบื่อกับการเรียนคณิตฯแบบท่องจำ ทำโจทย์ไม่ได้ อาจารย์นอตจะมาเสกให้น้องเข้าใจเนื้อหา และสนุกไปกับคณิตศาสตร์ หรือแม้แต่การเตรียมตัวเพื่อสอบเข้ามหาวิทยาลัยก็สามารถใช้ความรู้ ความเข้าใจจากการเรียนคอร์สนี้ได้เช่นกัน !!!',
   profileTutors: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/profile_panya.jpeg?alt=media&token=f0469480-d5b9-4c29-8f1b-5dc8fddb9966',
  ),
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/Eng.jpg?alt=media&token=98e7b0f4-1b46-407b-a8f6-d37694af2108',
   nameCourse: 'คอร์สเรียนภาษาอังกฤษสำหรับเด็ก',
   price: 850, 
   rate: '4.5', 
   name: 'EduFirst', 
   level: '5-14 ปี',
   detail: 'คอร์สเรียน TGAT English ฉบับเข้มข้น ช่วยให้น้องๆ ได้เตรียมสอบอย่างมั่นใจ และได้คะแนน TGAT English ดีขึ้นอย่างแน่นอน *TGAT English* ☑ วิธีการเรียนภาษาอังกฤษจากประสบการณ์ของพี่ตวง และเทคนิค GET GAT English นอกจากจะช่วย เพิ่มคะแนน GAT English แล้วยังช่วยให้น้องๆ มีทักษะการใช้ภาษาอังกฤษติดตัวไปตลอด',
   profileTutors: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/profile_eng.jpeg?alt=media&token=451966d3-2b3c-436b-8866-d1669bc6d94b',
  ),
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/math.jpg?alt=media&token=1b6975c7-3757-4bdb-99cc-571b8e8dfb78',
   nameCourse: 'คอร์สเรียนคณิตศาสตร์ ม.2 ออน์ไลน์',
   price: 900, 
   rate: '4.5', 
   name: 'พี่อ้อม', 
   level: 'ม.2',
   detail: 'คอร์ส คณิตศาสตร์ ม.2 เทอม 2 (หลักสูตรใหม่) เสกเลขให้ง่าย เข้าใจได้ทุกคนด้วยเทคนิค Math Magic จากอาจารย์คณิตศาสตร์ ม.2  หลักสูตรใหม่ประกอบไปด้วยเนื้อหา 3 บท คือ ความสัมพันธ์และฟังก์ชัน, ฟังก์ชันเอกซ์โพเนนเชียลและลอการิทึม, เรขาคณิตวิเคราะห์และภาคตัดกรวย ในบทเรียนจะประกอบไปด้วยเนื้อหาที่ปูพื้นฐานตั้งแต่ง่ายจนถึงระดับสูง เน้นให้นักเรียนเข้าใจ ไม่ต้องท่องจำ และอธิบายอย่างละเอียดโดยเชื่อมโยงกับชีวิตจริง พร้อมแบบฝึกหัดทุกระดับทั้งง่าย-ยาก มั่นใจได้ว่าหลังจากที่น้องได้เรียนเทคนิค Math Magic แล้วจะเข้าใจเนื้อหาอย่างละเอียด และเสกโจทย์ยากให้กลายเป็นง่ายได้แน่นอน',
   profileTutors: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/math.jpg?alt=media&token=1b6975c7-3757-4bdb-99cc-571b8e8dfb78',
  ),
];

List<Courses> coursesBox =[
  Courses
  (
    image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/math_a.jpg?alt=media&token=a443bceb-5a6f-47c1-b0e7-641271bea1b8', 
    nameCourse: 'คณิตศาสตร์ A-Level', 
    price: 5000, 
    rate: '4.8', 
    name:' by Panya', 
    level: 'ม.6',
    detail: 'คอร์ส คณิตศาสตร์เสริม ม.5 เทอม 2 คิดคล่อง ไม่ท่องจำ ทำโจทย์ได้ โดย อ.นอตคอร์ส คณิตศาสตร์ ม.5 เทอม 2 (หลักสูตรใหม่) เสกเลขให้ง่าย เข้าใจได้ทุกคนด้วยเทคนิค Math Magic จากอาจารย์นอตคณิตศาสตร์ ม.5 เทอม 2 หลักสูตรใหม่ประกอบไปด้วยเนื้อหา 3 บท คือ จำนวนเชิงซ้อน, หลักการนับเบื้องต้น และความน่าจะเป็น ในบทเรียนจะประกอบไปด้วยเนื้อหาที่ปูพื้นฐานตั้งแต่ง่ายจนถึงระดับสูง เน้นให้นักเรียนเข้าใจ ไม่ต้องท่องจำ และอธิบายอย่างละเอียดโดยเชื่อมโยงกับชีวิตจริง พร้อมแบบฝึกหัดทุกระดับทั้งง่าย-ยาก มั่นใจได้ว่าหลังจากที่น้องได้เรียนเทคนิค Math Magic แล้วจะเข้าใจเนื้อหาอย่างละเอียด และเสกโจทย์ยากให้กลายเป็นง่ายได้แน่นอนคอร์สนี้เหมาะกับน้องๆ ที่อยู่ชั้น ม.5 ที่โรงเรียนใช้หลักสูตรใหม่ (2560) ที่เบื่อกับการเรียนคณิตฯแบบท่องจำ ทำโจทย์ไม่ได้ อาจารย์นอตจะมาเสกให้น้องเข้าใจเนื้อหา และสนุกไปกับคณิตศาสตร์ หรือแม้แต่การเตรียมตัวเพื่อสอบเข้ามหาวิทยาลัยก็สามารถใช้ความรู้ ความเข้าใจจากการเรียนคอร์สนี้ได้เช่นกัน !!!',
    profileTutors: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/math.jpg?alt=media&token=1b6975c7-3757-4bdb-99cc-571b8e8dfb78',
  ),
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/eng1.jpg?alt=media&token=9a20f909-a922-40ac-8ec8-ed8ce6adb0c5',
   nameCourse: 'คอร์สเรียนภาษาอังกฤษออน์ไลน์ \nกับ Andrew',
   price: 850, 
   rate: '4.5', 
   name: 'Andrew', 
   level: 'beginner',
   detail: 'ผู้สอน (Tutor) ระดับมืออาชีพ ของ THE BEST ENGLISH ที่มีประสบการณ์ในการสอนภาษาอังกฤษมายาวนานกว่า 20 ปี อีกทั้งยังมีความรู้เกี่ยวกับภาษาอังกฤษในทุกๆด้าน และพร้อมที่จะช่วยให้คุณได้พัฒนาทักษะด้านภาษาอังกฤษได้อย่างแท้จริง ทุกอาชีพสามารถเรียนรู้ภาษาอังกฤษได้อย่างง่ายดาย และ รวดเร็ว โดยการเรียนการสอน ที่ทำให้ท่านสามารถเรียนรู้ภาษาอังกฤษโดยธรรมชาติ เรียนตัวต่อตัวกับผู้สอน มีหลากหลายคอร์สที่ออกแบบเฉพาะ เพื่อให้ผู้เรียนเข้าใจง่าย เป็นเร็ว ภาษาอังกฤษ ผู้ใหญ่ ภาษาอังกฤษ เด็ก ภาษาอังกฤษพนักงานออฟฟิศ ภาษาอังกฤษ คนทำงาน ทุกคอร์สออกแบบเฉพาะโดยใช้ผู้เรียนเป็นศูนย์กลางออกแบบคอร์สเรียนเพื่อให้เรียนรู้ภาษาอังกฤษอย่างรวดเร็วแม้ไม่มีพื้นฐาน',
   profileTutors: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/profile_andrew.jpeg?alt=media&token=91b3d095-2339-4a5b-af1a-1111b1e9c05d',
  ),
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/math.jpg?alt=media&token=1b6975c7-3757-4bdb-99cc-571b8e8dfb78',
   nameCourse: 'คอร์สเรียนคณิตศาสตร์ ม.2 ออน์ไลน์',
   price: 900, 
   rate: '4.5', 
   name: 'พี่อ้อม', 
   level: 'ม.2',
   detail: 'คอร์ส คณิตศาสตร์ ม.2 เทอม 2 (หลักสูตรใหม่) เสกเลขให้ง่าย เข้าใจได้ทุกคนด้วยเทคนิค Math Magic จากอาจารย์คณิตศาสตร์ ม.2  หลักสูตรใหม่ประกอบไปด้วยเนื้อหา 3 บท คือ ความสัมพันธ์และฟังก์ชัน, ฟังก์ชันเอกซ์โพเนนเชียลและลอการิทึม, เรขาคณิตวิเคราะห์และภาคตัดกรวย ในบทเรียนจะประกอบไปด้วยเนื้อหาที่ปูพื้นฐานตั้งแต่ง่ายจนถึงระดับสูง เน้นให้นักเรียนเข้าใจ ไม่ต้องท่องจำ และอธิบายอย่างละเอียดโดยเชื่อมโยงกับชีวิตจริง พร้อมแบบฝึกหัดทุกระดับทั้งง่าย-ยาก มั่นใจได้ว่าหลังจากที่น้องได้เรียนเทคนิค Math Magic แล้วจะเข้าใจเนื้อหาอย่างละเอียด และเสกโจทย์ยากให้กลายเป็นง่ายได้แน่นอน',
   profileTutors: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/math.jpg?alt=media&token=1b6975c7-3757-4bdb-99cc-571b8e8dfb78',
  ),
];