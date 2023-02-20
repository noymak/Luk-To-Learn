import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/auth_tutor_controller.dart';
import 'package:luk_to_learn/controllers/cart_controller.dart';
import 'package:luk_to_learn/controllers/video_controller.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    var courseName = Get.arguments[0];
    var detailCourse = Get.arguments[1];
    var tutorName = Get.arguments[2];
    var index =Get.arguments[3];
    var size = MediaQuery.of(context).size;

    var controller = Get.put(AuthTutorController());
    var videoController = Get.put(VideoController());
    var cartContorller = Get.put(CartContorller());
    

    controller.fetchTutor(tutorName);

    print(courseName);

    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      body: SingleChildScrollView(
        child: GetBuilder<AuthTutorController>(
            init: AuthTutorController(),
            builder: (_) {
              return controller.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Column(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                              style: GoogleFonts.kanit(
                                                fontSize: 22,
                                                color: kPrimaryLightColor,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${courseName}",
                                          style: GoogleFonts.kanit(
                                              fontSize: 32,
                                              color: kPrimaryLightColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 18,
                                        ),
                                        Container(
                                          width: 100,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'ภาษาอังกฤษ',
                                              style: GoogleFonts.kanit(
                                                fontSize: 14,
                                                color: kPrimaryColors,
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
                                  style: GoogleFonts.kanit(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${detailCourse}',
                                  style: GoogleFonts.kanit(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.justify,
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
                                  style: GoogleFonts.kanit(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // CircleAvatar(
                                      //   radius: 28,
                                      //   backgroundImage: NetworkImage(
                                      //       '${controller.imageTutor[0]['image']}'),
                                      // ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${tutorName}',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Text(
                                          //       '14 Courses',
                                          //       style: GoogleFonts.kanit(
                                          //         color: Colors.grey,
                                          //       ),
                                          //     ),
                                          //     SizedBox(
                                          //       width: 5,
                                          //     ),
                                          //     Icon(
                                          //       Icons.circle,
                                          //       size: 8,
                                          //       color: Colors.grey.shade600,
                                          //     ),
                                          //     SizedBox(
                                          //       width: 5,
                                          //     ),
                                          //     Text(
                                          //       '1,400 Students',
                                          //       style: GoogleFonts.kanit(
                                          //         color: Colors.grey,
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
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
                                        Get.toNamed('/coursesvideonew',
                                            arguments: [
                                              courseName,
                                            ]);

                                        videoController
                                            .getCourseVideo(courseName);
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xff6360FF),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'See Detail',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              color: kPrimaryLightColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed('/cart',arguments: [index]);
                                        cartContorller.addCart(index);
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color:
                                              Color.fromARGB(255, 54, 175, 115),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Add to Cart',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              color: kPrimaryLightColor,
                                            ),
                                          ),
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
                    );
            }),
      ),
    );
  }
}
