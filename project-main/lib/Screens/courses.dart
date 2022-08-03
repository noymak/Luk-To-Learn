import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/route');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Course Detail",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.api_sharp,
                            size: 60,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.api_sharp,
                            size: 60,
                            color: Colors.grey.shade400,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Declarative interface for nany Apple Devices",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Container(
                              width: 100,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  'ภาษาอังกฤษ',
                                  style: TextStyle(
                                    color: Color(0xff6360FF),
                                    fontSize: 14,
                                    // fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Color.fromARGB(255, 230, 230, 236),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'อาจารย์พิเศษในมหาวิทยาลัยชั้นนำและองค์กรต่างๆ เช่น'
                      'มหาวิทยาลัยศรีนครินทรวิโรฒ วิทยาลัยปัญญาภิวัฒน์\n(หลักสูตรปริญญาโท) และอื่นๆ อีกมากมาย'
                      'ปริญญาโท \nศิลปศาสตรมหาบัณฑิต ภาษาอังกฤษเพื่ออาชีพ สถาบันภาษา มหาวิทยาลัยธรรมศาสตร์',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Author',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage:
                                AssetImage('assets/images/profile.jpg'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sarah William',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '14 Courses',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: Colors.grey.shade600,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '1,400 Students',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/coursesvideo');
                          },
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xff6360FF),
                            ),
                            child: Center(
                              child: Text('See Detail',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 54, 175, 115),
                            ),
                            child: Center(
                              child: Text('Add to Cart',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
