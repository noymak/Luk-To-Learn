import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';

class CreateChatRoom extends StatefulWidget {
  const CreateChatRoom({Key? key}) : super(key: key);

  @override
  State<CreateChatRoom> createState() => _CreateChatRoomState();
}

class _CreateChatRoomState extends State<CreateChatRoom> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kPrimaryColors,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Author',
                                  style: GoogleFonts.kanit(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      color: kPrimaryLightColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                 Hero(
                          tag: 'image',
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Fprofile.jpg?alt=media&token=b09dbfef-a9cf-45c2-9d09-ac71c41ca4d8'),
                          )),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sarah William',
                                          style: GoogleFonts.kanit(
                                            textStyle: TextStyle(
                                              fontSize: 18,
                                              color: kPrimaryLightColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Develop & Instructor',
                                          style: GoogleFonts.kanit(
                                            textStyle: TextStyle(
                                              fontSize: 18,
                                              color: kPrimaryLightColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              Container(
                width: size.width,
                height: size.height,
                margin: EdgeInsets.only(top: 20),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Room 1",
                                style: GoogleFonts.kanit(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/chatroomtutor");
                              },
                              child: Container(
                                height: 50,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: kPrimaryColor1,
                                ),
                                child: Icon(Icons.add_circle_outline_outlined),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
