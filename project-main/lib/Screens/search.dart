import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:luk_to_learn/constants.dart';

class ScearchScreen extends StatefulWidget {
  const ScearchScreen({Key? key}) : super(key: key);

  @override
  State<ScearchScreen> createState() => _ScearchScreenState();
}

class _ScearchScreenState extends State<ScearchScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.5,
                  color: Color(0xff6360FF),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Back",
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.home_outlined,
                              color: Colors.white,
                              size: 32,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 230, 236),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: size.width / 1.5,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18),
                              topRight: Radius.circular(18),
                              bottomLeft: Radius.circular(18),
                              bottomRight: Radius.circular(18),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Search",
                                border: InputBorder.none,
                                suffixIcon: Icon(
                                  Icons.search,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Browser Catagory",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Wrap(
                              children: [
                                Category(width: 100, height: 50, text: 'Tekno'),
                                Category(
                                    width: 100, height: 50, text: 'Business'),
                                Category(width: 100, height: 50, text: 'Math'),
                                Category(width: 100, height: 50, text: 'Thai'),
                                Category(
                                    width: 100, height: 50, text: 'English'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: size.width,
              height: size.height,
              color: Color.fromARGB(255, 230, 230, 236),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recommended Course",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    coursebox(size),
                    SizedBox(
                      height: 15,
                    ),
                    coursebox(size),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
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
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xffFF8181)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Declarative interfaces for any Apple \nDevices",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "850.00 BTH",
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.amber,
                      size: 10,
                    ),
                    Text(
                      "By SomChai Wong",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.amber,
                      size: 10,
                    ),
                    Text(
                      "All Level",
                      style: TextStyle(color: Colors.grey),
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

  Widget Category(
      {required String text, required double width, required double height}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: Color(0xff6360FF),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
