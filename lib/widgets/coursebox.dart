import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';

class CourseBox extends StatefulWidget {
  const CourseBox({Key? key}) : super(key: key);

  @override
  State<CourseBox> createState() => _CourseBoxState();
}

class _CourseBoxState extends State<CourseBox> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              color: kPrimaryColor1,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Declarative interfaces for any Apple \nDevices",
                style: GoogleFonts.kanit(textStyle: TextStyle(fontWeight: FontWeight.w500),) ,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "850.00 BTH",
                style: GoogleFonts.kanit(textStyle: TextStyle(fontWeight: FontWeight.bold),),
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
                    style: GoogleFonts.kanit(textStyle: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.amber,
                    size: 10,
                  ),
                  Text(
                    "By SomChai Wong",
                    style: GoogleFonts.kanit(textStyle: TextStyle(color: Colors.grey),),
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.amber,
                    size: 10,
                  ),
                  Text(
                    "All Level",
                    style: GoogleFonts.kanit(textStyle: TextStyle(color: Colors.grey),),
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
}