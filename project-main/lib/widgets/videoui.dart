import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';

class VideoUi extends StatelessWidget {
  const VideoUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext index) {
    final nameVideoField = TextFormField(
      autofocus: false,
      // controller: nameVideoController.namevideoController,
      keyboardType: TextInputType.name,
      // onSaved: (value) {
      //   nameVideoController.namevideoController.text = value!;
      // },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.video_camera_front),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Video Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(
            child: Text(
              'เลือก Video ที่ต้องการ',
              style: GoogleFonts.kanit(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            
            height: 120,
            width: 220,
            decoration: BoxDecoration(
              color: kPrimaryColor1,
              borderRadius: BorderRadius.circular(26),
              
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'ตั้งชื่อให้แก่ Video ของท่าน',
            style: GoogleFonts.kanit(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          nameVideoField,
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     IconButton(
          //         onPressed: () {},
          //         icon: Icon(
          //           Icons.add_circle,
          //           color: Colors.greenAccent,
          //         )),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     IconButton(
          //         onPressed: () {},
          //         icon: Icon(
          //           Icons.remove_circle,
          //           color: Colors.redAccent,
          //         ))
          //   ],
          // )
        ],
      ),
    );
  }
}
