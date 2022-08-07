import 'package:flutter/material.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatTutor extends StatelessWidget {
  const ChatTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: kPrimaryColor1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                        radius: 55,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg')),
                  ),
                ),
                Text('Sarah William',
                    style: GoogleFonts.kanit(
                        textStyle: TextStyle(fontSize: 20),
                        color: kPrimaryLightColor))
              ],
            ),
            Text('How old are you',
                style: GoogleFonts.kanit(textStyle: TextStyle(fontSize: 15)))
          ],
        ),
      ),
    );
  }
}
