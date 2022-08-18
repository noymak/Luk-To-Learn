import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: GestureDetector(
                      onDoubleTap: () {
                        Navigator.pushNamed(context, "/route");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 110,
                          ),
                          Text(
                            "Edit Profile",
                            style: GoogleFonts.kanit(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                color: Color(0xff6360FF),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                            radius: 55,
                            backgroundImage:
                                AssetImage('assets/images/profile.jpg')),
                      ),
                      Positioned(
                        right: 3,
                        bottom: 3,
                        child: Container(
                          width: 35,
                          height: 35,
                          child: CircleAvatar(
                            child: Icon(Icons.add_a_photo_outlined),
                            backgroundColor: Colors.white,
                            radius: 55,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    width: size.width,
                    height: 615,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: GoogleFonts.kanit(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueAccent),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            EditPro('FirstName'),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Last Name',
                                style: GoogleFonts.kanit(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueAccent)),
                            SizedBox(
                              height: 10,
                            ),
                            EditPro('LastName'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'E-mail',
                              style: GoogleFonts.kanit(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueAccent),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            EditPro('E-mail'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'PhoneNumber',
                              style: GoogleFonts.kanit(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueAccent),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            EditPro('+66'),
                            SizedBox(
                              height: 130,
                            ),
                            Container(
                              height: 50,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: Color(0xffFF8181),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Text(
                                  "Update Profile",
                                  style: GoogleFonts.kanit(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container EditPro(String text) {
  return Container(
    decoration: BoxDecoration(
        // border: Border.all(),
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ]),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
        ),
      ),
    ),
  );
}
