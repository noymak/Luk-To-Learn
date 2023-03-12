import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Demo {
  late String image, title, description;
  late int price;
  Demo(
      {required this.image,
      required this.description,
      required this.price,
      required this.title});
}

List<Demo> demoBanner = [
  Demo(
      image:
          'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fmath_a.jpg?alt=media&token=0833b23b-94cf-4901-bef6-e2a037f44232',
      description: 'คอร์ส คณิตศาสตร์เสริม ม.5 เทอม 2 คิดคล่อง ไม่ท่องจำ ทำโจทย์ได้ โดย อ.นอตคอร์ส คณิตศาสตร์ ม.5 เทอม 2 (หลักสูตรใหม่) เสกเลขให้ง่าย เข้าใจได้ทุกคนด้วยเทคนิค Math Magic จากอาจารย์นอตคณิตศาสตร์ ม.5 เทอม 2 หลักสูตรใหม่ประกอบไปด้วยเนื้อหา 3 บท คือ จำนวนเชิงซ้อน, หลักการนับเบื้องต้น และความน่าจะเป็น ในบทเรียนจะประกอบไปด้วยเนื้อหาที่ปูพื้นฐานตั้งแต่ง่ายจนถึงระดับสูง เน้นให้นักเรียนเข้าใจ ไม่ต้องท่องจำ และอธิบายอย่างละเอียดโดยเชื่อมโยงกับชีวิตจริง พร้อมแบบฝึกหัดทุกระดับทั้งง่าย-ยาก มั่นใจได้ว่าหลังจากที่น้องได้เรียนเทคนิค Math Magic แล้วจะเข้าใจเนื้อหาอย่างละเอียด และเสกโจทย์ยากให้กลายเป็นง่ายได้แน่นอนคอร์สนี้เหมาะกับน้องๆ ที่อยู่ชั้น ม.5 ที่โรงเรียนใช้หลักสูตรใหม่ (2560) ที่เบื่อกับการเรียนคณิตฯแบบท่องจำ ทำโจทย์ไม่ได้ อาจารย์นอตจะมาเสกให้น้องเข้าใจเนื้อหา และสนุกไปกับคณิตศาสตร์ หรือแม้แต่การเตรียมตัวเพื่อสอบเข้ามหาวิทยาลัยก็สามารถใช้ความรู้ ความเข้าใจจากการเรียนคอร์สนี้ได้เช่นกัน !!!',
      price: 800,
      title: 'คอร์ส คณิตศาสตร์เสริม ม.5'),
      Demo(
      image:
          'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fmath_a.jpg?alt=media&token=0833b23b-94cf-4901-bef6-e2a037f44232',
      description: 'คอร์ส คณิตศาสตร์เสริม ม.5 เทอม 2 คิดคล่อง ไม่ท่องจำ ทำโจทย์ได้ โดย อ.นอตคอร์ส คณิตศาสตร์ ม.5 เทอม 2 (หลักสูตรใหม่) เสกเลขให้ง่าย เข้าใจได้ทุกคนด้วยเทคนิค Math Magic จากอาจารย์นอตคณิตศาสตร์ ม.5 เทอม 2 หลักสูตรใหม่ประกอบไปด้วยเนื้อหา 3 บท คือ จำนวนเชิงซ้อน, หลักการนับเบื้องต้น และความน่าจะเป็น ในบทเรียนจะประกอบไปด้วยเนื้อหาที่ปูพื้นฐานตั้งแต่ง่ายจนถึงระดับสูง เน้นให้นักเรียนเข้าใจ ไม่ต้องท่องจำ และอธิบายอย่างละเอียดโดยเชื่อมโยงกับชีวิตจริง พร้อมแบบฝึกหัดทุกระดับทั้งง่าย-ยาก มั่นใจได้ว่าหลังจากที่น้องได้เรียนเทคนิค Math Magic แล้วจะเข้าใจเนื้อหาอย่างละเอียด และเสกโจทย์ยากให้กลายเป็นง่ายได้แน่นอนคอร์สนี้เหมาะกับน้องๆ ที่อยู่ชั้น ม.5 ที่โรงเรียนใช้หลักสูตรใหม่ (2560) ที่เบื่อกับการเรียนคณิตฯแบบท่องจำ ทำโจทย์ไม่ได้ อาจารย์นอตจะมาเสกให้น้องเข้าใจเนื้อหา และสนุกไปกับคณิตศาสตร์ หรือแม้แต่การเตรียมตัวเพื่อสอบเข้ามหาวิทยาลัยก็สามารถใช้ความรู้ ความเข้าใจจากการเรียนคอร์สนี้ได้เช่นกัน !!!',
      price: 800,
      title: 'คอร์ส คณิตศาสตร์เสริม ม.5'),
      Demo(
      image:
          'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fmath_a.jpg?alt=media&token=0833b23b-94cf-4901-bef6-e2a037f44232',
      description: 'คอร์ส คณิตศาสตร์เสริม ม.5 เทอม 2 คิดคล่อง ไม่ท่องจำ ทำโจทย์ได้ โดย อ.นอตคอร์ส คณิตศาสตร์ ม.5 เทอม 2 (หลักสูตรใหม่) เสกเลขให้ง่าย เข้าใจได้ทุกคนด้วยเทคนิค Math Magic จากอาจารย์นอตคณิตศาสตร์ ม.5 เทอม 2 หลักสูตรใหม่ประกอบไปด้วยเนื้อหา 3 บท คือ จำนวนเชิงซ้อน, หลักการนับเบื้องต้น และความน่าจะเป็น ในบทเรียนจะประกอบไปด้วยเนื้อหาที่ปูพื้นฐานตั้งแต่ง่ายจนถึงระดับสูง เน้นให้นักเรียนเข้าใจ ไม่ต้องท่องจำ และอธิบายอย่างละเอียดโดยเชื่อมโยงกับชีวิตจริง พร้อมแบบฝึกหัดทุกระดับทั้งง่าย-ยาก มั่นใจได้ว่าหลังจากที่น้องได้เรียนเทคนิค Math Magic แล้วจะเข้าใจเนื้อหาอย่างละเอียด และเสกโจทย์ยากให้กลายเป็นง่ายได้แน่นอนคอร์สนี้เหมาะกับน้องๆ ที่อยู่ชั้น ม.5 ที่โรงเรียนใช้หลักสูตรใหม่ (2560) ที่เบื่อกับการเรียนคณิตฯแบบท่องจำ ทำโจทย์ไม่ได้ อาจารย์นอตจะมาเสกให้น้องเข้าใจเนื้อหา และสนุกไปกับคณิตศาสตร์ หรือแม้แต่การเตรียมตัวเพื่อสอบเข้ามหาวิทยาลัยก็สามารถใช้ความรู้ ความเข้าใจจากการเรียนคอร์สนี้ได้เช่นกัน !!!',
      price: 800,
      title: 'คอร์ส คณิตศาสตร์เสริม ม.5'),
      Demo(
      image:
          'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fmath_a.jpg?alt=media&token=0833b23b-94cf-4901-bef6-e2a037f44232',
      description: 'คอร์ส คณิตศาสตร์เสริม ม.5 เทอม 2 คิดคล่อง ไม่ท่องจำ ทำโจทย์ได้ โดย อ.นอตคอร์ส คณิตศาสตร์ ม.5 เทอม 2 (หลักสูตรใหม่) เสกเลขให้ง่าย เข้าใจได้ทุกคนด้วยเทคนิค Math Magic จากอาจารย์นอตคณิตศาสตร์ ม.5 เทอม 2 หลักสูตรใหม่ประกอบไปด้วยเนื้อหา 3 บท คือ จำนวนเชิงซ้อน, หลักการนับเบื้องต้น และความน่าจะเป็น ในบทเรียนจะประกอบไปด้วยเนื้อหาที่ปูพื้นฐานตั้งแต่ง่ายจนถึงระดับสูง เน้นให้นักเรียนเข้าใจ ไม่ต้องท่องจำ และอธิบายอย่างละเอียดโดยเชื่อมโยงกับชีวิตจริง พร้อมแบบฝึกหัดทุกระดับทั้งง่าย-ยาก มั่นใจได้ว่าหลังจากที่น้องได้เรียนเทคนิค Math Magic แล้วจะเข้าใจเนื้อหาอย่างละเอียด และเสกโจทย์ยากให้กลายเป็นง่ายได้แน่นอนคอร์สนี้เหมาะกับน้องๆ ที่อยู่ชั้น ม.5 ที่โรงเรียนใช้หลักสูตรใหม่ (2560) ที่เบื่อกับการเรียนคณิตฯแบบท่องจำ ทำโจทย์ไม่ได้ อาจารย์นอตจะมาเสกให้น้องเข้าใจเนื้อหา และสนุกไปกับคณิตศาสตร์ หรือแม้แต่การเตรียมตัวเพื่อสอบเข้ามหาวิทยาลัยก็สามารถใช้ความรู้ ความเข้าใจจากการเรียนคอร์สนี้ได้เช่นกัน !!!',
      price: 800,
      title: 'คอร์ส คณิตศาสตร์เสริม ม.5')
];