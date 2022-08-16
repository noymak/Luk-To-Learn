class Courses {
  String? image;
  String? nameCourse;
  int? price;
  String? rate;
  String? name;
  String? level;
  String? detail;

  Courses({
    required this.image,
    required this.nameCourse,
    required this.price,
    required this.rate,
    required this.name,
    required this.level,
    required this.detail,
  });
}

List<Courses> coursesInfo = [
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/eng1.jpg?alt=media&token=9a20f909-a922-40ac-8ec8-ed8ce6adb0c5',
   nameCourse: 'คอร์สเรียนภาษาอังกฤษออน์ไลน์ \nกับ Andrew',
   price: 850, 
   rate: '4.5', 
   name: 'by Andrew', 
   level: 'beginner',
   detail: 'asda',
  ),
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/math_a.jpg?alt=media&token=a443bceb-5a6f-47c1-b0e7-641271bea1b8', 
   nameCourse: 'คณิตศาสตร์ A-Level', 
   price: 5000, 
   rate: '4.8', 
   name:' by Panya', 
   level: 'ม.6',
   detail: '00',
  ),
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/Eng.jpg?alt=media&token=98e7b0f4-1b46-407b-a8f6-d37694af2108',
   nameCourse: 'คอร์สเรียนภาษาอังกฤษสำหรับเด็ก',
   price: 850, 
   rate: '4.5', 
   name: 'by EduFirst', 
   level: '5-14 ปี',
   detail: '00',
  ),
  Courses(
   image: 'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/math.jpg?alt=media&token=1b6975c7-3757-4bdb-99cc-571b8e8dfb78',
   nameCourse: 'คอร์สเรียนคณิตศาสตร์ ม.2 ออน์ไลน์',
   price: 900, 
   rate: '4.5', 
   name: 'by พี่อ้อม', 
   level: 'ม.2',
   detail: '00',
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
    detail: '00',
  )
];