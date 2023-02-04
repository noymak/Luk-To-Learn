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
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Feng1.jpg?alt=media&token=1c12bfa4-3009-4b58-a02a-c264877dfc61',
   nameCourse: 'คอร์สเรียนภาษาอังกฤษออน์ไลน์ \nกับ Andrew',
   price: 850, 
   rate: '4.5', 
   name: 'Andrew', 
   level: 'beginner',
   detail: 'ผู้สอน (Tutor) ระดับมืออาชีพ ของ THE BEST ENGLISH ',
   profileTutors: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fprofile_andrew.jpeg?alt=media&token=d5d3abea-0e3e-4fa1-8a28-2701b8ab52d4',
  ),
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fmath_a.jpg?alt=media&token=0833b23b-94cf-4901-bef6-e2a037f44232', 
   nameCourse: 'คณิตศาสตร์ A-Level', 
   price: 5000, 
   rate: '4.8', 
   name:'Panya', 
   level: 'ม.6',
   detail: 'คอร์ส คณิตศาสตร์เสริม ม.5 เทอม 2 คิดคล่อง ไม่ท่องจำ ทำโจทย์ได้ โดย อ.นอตคอร์ส คณิตศาสตร์ ม.5 เทอม 2 (หลักสูตรใหม่) เสกเลขให้ง่าย เข้าใจได้ทุกคนด้วยเทคนิค Math Magic จากอาจารย์นอตคณิตศาสตร์ ม.5 เทอม 2 หลักสูตรใหม่ประกอบไปด้วยเนื้อหา 3 บท คือ จำนวนเชิงซ้อน, หลักการนับเบื้องต้น และความน่าจะเป็น ในบทเรียนจะประกอบไปด้วยเนื้อหาที่ปูพื้นฐานตั้งแต่ง่ายจนถึงระดับสูง เน้นให้นักเรียนเข้าใจ ไม่ต้องท่องจำ และอธิบายอย่างละเอียดโดยเชื่อมโยงกับชีวิตจริง พร้อมแบบฝึกหัดทุกระดับทั้งง่าย-ยาก มั่นใจได้ว่าหลังจากที่น้องได้เรียนเทคนิค Math Magic แล้วจะเข้าใจเนื้อหาอย่างละเอียด และเสกโจทย์ยากให้กลายเป็นง่ายได้แน่นอนคอร์สนี้เหมาะกับน้องๆ ที่อยู่ชั้น ม.5 ที่โรงเรียนใช้หลักสูตรใหม่ (2560) ที่เบื่อกับการเรียนคณิตฯแบบท่องจำ ทำโจทย์ไม่ได้ อาจารย์นอตจะมาเสกให้น้องเข้าใจเนื้อหา และสนุกไปกับคณิตศาสตร์ หรือแม้แต่การเตรียมตัวเพื่อสอบเข้ามหาวิทยาลัยก็สามารถใช้ความรู้ ความเข้าใจจากการเรียนคอร์สนี้ได้เช่นกัน !!!',
   profileTutors: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fprofile_panya.jpeg?alt=media&token=6f1c9bb9-119b-4d9b-9870-4ca42f4a7b87',
  ),
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2FEng.jpg?alt=media&token=d8a39576-4d45-422c-bd9e-600bf2ddef36',
   nameCourse: 'คอร์สเรียนภาษาอังกฤษสำหรับเด็ก',
   price: 850, 
   rate: '4.5', 
   name: 'EduFirst', 
   level: '5-14 ปี',
   detail: 'คอร์สเรียน TGAT English ฉบับเข้มข้น ช่วยให้น้องๆ ได้เตรียมสอบอย่างมั่นใจ และได้คะแนน TGAT English ดีขึ้นอย่างแน่นอน *TGAT English* ☑ วิธีการเรียนภาษาอังกฤษจากประสบการณ์ของพี่ตวง และเทคนิค GET GAT English นอกจากจะช่วย เพิ่มคะแนน GAT English แล้วยังช่วยให้น้องๆ มีทักษะการใช้ภาษาอังกฤษติดตัวไปตลอด',
   profileTutors: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fprofile_eng.jpeg?alt=media&token=192a6994-deb4-4731-ae36-ea913c628f2f',
  ),
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fmath.jpg?alt=media&token=9db49477-9849-431c-b64b-e183b7e6491b',
   nameCourse: 'คอร์สเรียนคณิตศาสตร์ ม.2 ออน์ไลน์',
   price: 900, 
   rate: '4.5', 
   name: 'พี่อ้อม', 
   level: 'ม.2',
   detail: 'คอร์ส คณิตศาสตร์ ม.2 เทอม 2 (หลักสูตรใหม่) เสกเลขให้ง่าย เข้าใจได้ทุกคนด้วยเทคนิค Math Magic จากอาจารย์คณิตศาสตร์ ม.2  หลักสูตรใหม่ประกอบไปด้วยเนื้อหา 3 บท คือ ความสัมพันธ์และฟังก์ชัน, ฟังก์ชันเอกซ์โพเนนเชียลและลอการิทึม, เรขาคณิตวิเคราะห์และภาคตัดกรวย ในบทเรียนจะประกอบไปด้วยเนื้อหาที่ปูพื้นฐานตั้งแต่ง่ายจนถึงระดับสูง เน้นให้นักเรียนเข้าใจ ไม่ต้องท่องจำ และอธิบายอย่างละเอียดโดยเชื่อมโยงกับชีวิตจริง พร้อมแบบฝึกหัดทุกระดับทั้งง่าย-ยาก มั่นใจได้ว่าหลังจากที่น้องได้เรียนเทคนิค Math Magic แล้วจะเข้าใจเนื้อหาอย่างละเอียด และเสกโจทย์ยากให้กลายเป็นง่ายได้แน่นอน',
   profileTutors: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fmath.jpg?alt=media&token=9db49477-9849-431c-b64b-e183b7e6491b',
  ),
];

List<Courses> coursesBox =[
  Courses
  (
    image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fmath.jpg?alt=media&token=9db49477-9849-431c-b64b-e183b7e6491b', 
    nameCourse: 'คณิตศาสตร์ A-Level', 
    price: 5000, 
    rate: '4.8', 
    name:' by Panya', 
    level: 'ม.6',
    detail: 'คอร์ส คณิตศาสตร์เสริม ม.5 เทอม 2 คิดคล่อง ไม่ท่องจำ ทำโจทย์ได้ โดย อ.นอตคอร์ส คณิตศาสตร์ ม.5 เทอม 2 (หลักสูตรใหม่) เสกเลขให้ง่าย เข้าใจได้ทุกคนด้วยเทคนิค Math Magic จากอาจารย์นอตคณิตศาสตร์ ม.5 เทอม 2 หลักสูตรใหม่ประกอบไปด้วยเนื้อหา 3 บท คือ จำนวนเชิงซ้อน, หลักการนับเบื้องต้น และความน่าจะเป็น ในบทเรียนจะประกอบไปด้วยเนื้อหาที่ปูพื้นฐานตั้งแต่ง่ายจนถึงระดับสูง เน้นให้นักเรียนเข้าใจ ไม่ต้องท่องจำ และอธิบายอย่างละเอียดโดยเชื่อมโยงกับชีวิตจริง พร้อมแบบฝึกหัดทุกระดับทั้งง่าย-ยาก มั่นใจได้ว่าหลังจากที่น้องได้เรียนเทคนิค Math Magic แล้วจะเข้าใจเนื้อหาอย่างละเอียด และเสกโจทย์ยากให้กลายเป็นง่ายได้แน่นอนคอร์สนี้เหมาะกับน้องๆ ที่อยู่ชั้น ม.5 ที่โรงเรียนใช้หลักสูตรใหม่ (2560) ',
    profileTutors: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fmath.jpg?alt=media&token=9db49477-9849-431c-b64b-e183b7e6491b',
  ),
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fmath.jpg?alt=media&token=9db49477-9849-431c-b64b-e183b7e6491b',
   nameCourse: 'คอร์สเรียนภาษาอังกฤษออน์ไลน์ \nกับ Andrew',
   price: 850, 
   rate: '4.5', 
   name: 'Andrew', 
   level: 'beginner',
   detail: 'ผู้สอน (Tutor) ระดับมืออาชีพ ของ THE BEST ENGLISH ที่มีประสบการณ์ในการสอนภาษาอังกฤษมายาวนานกว่า 20 ปี อีกทั้งยังมีความรู้เกี่ยวกับภาษาอังกฤษในทุกๆด้าน และพร้อมที่จะช่วยให้คุณได้พัฒนาทักษะด้านภาษาอังกฤษได้อย่างแท้จริง ทุกอาชีพสามารถเรียนรู้ภาษาอังกฤษได้อย่างง่ายดาย และ รวดเร็ว โดยการเรียนการสอน ที่ทำให้ท่านสามารถเรียนรู้ภาษาอังกฤษโดยธรรมชาติ เรียนตัวต่อตัวกับผู้สอน มีหลากหลายคอร์สที่ออกแบบเฉพาะ เพื่อให้ผู้เรียนเข้าใจง่าย เป็นเร็ว ภาษาอังกฤษ ผู้ใหญ่ ภาษาอังกฤษ เด็ก ภาษาอังกฤษพนักงานออฟฟิศ ภาษาอังกฤษ คนทำงาน ทุกคอร์สออกแบบเฉพาะโดยใช้ผู้เรียนเป็นศูนย์กลางออกแบบคอร์สเรียนเพื่อให้เรียนรู้ภาษาอังกฤษอย่างรวดเร็วแม้ไม่มีพื้นฐาน',
   profileTutors: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fmath.jpg?alt=media&token=9db49477-9849-431c-b64b-e183b7e6491b',
  ),
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fmath.jpg?alt=media&token=9db49477-9849-431c-b64b-e183b7e6491b',
   nameCourse: 'คอร์สเรียนคณิตศาสตร์ ม.2 ออน์ไลน์',
   price: 900, 
   rate: '4.5', 
   name: 'พี่อ้อม', 
   level: 'ม.2',
   detail: 'คอร์ส คณิตศาสตร์ ม.2 เทอม 2 (หลักสูตรใหม่) เสกเลขให้ง่าย เข้าใจได้ทุกคนด้วยเทคนิค Math Magic จากอาจารย์คณิตศาสตร์ ม.2  หลักสูตรใหม่ประกอบไปด้วยเนื้อหา 3 บท คือ ความสัมพันธ์และฟังก์ชัน, ฟังก์ชันเอกซ์โพเนนเชียลและลอการิทึม, เรขาคณิตวิเคราะห์และภาคตัดกรวย ในบทเรียนจะประกอบไปด้วยเนื้อหาที่ปูพื้นฐานตั้งแต่ง่ายจนถึงระดับสูง เน้นให้นักเรียนเข้าใจ ไม่ต้องท่องจำ และอธิบายอย่างละเอียดโดยเชื่อมโยงกับชีวิตจริง พร้อมแบบฝึกหัดทุกระดับทั้งง่าย-ยาก มั่นใจได้ว่าหลังจากที่น้องได้เรียนเทคนิค Math Magic แล้วจะเข้าใจเนื้อหาอย่างละเอียด และเสกโจทย์ยากให้กลายเป็นง่ายได้แน่นอน',
   profileTutors: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fmath.jpg?alt=media&token=9db49477-9849-431c-b64b-e183b7e6491b',
  ),
];