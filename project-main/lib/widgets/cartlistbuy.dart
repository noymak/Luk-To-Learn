import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/constants.dart';

class cartlistbuy extends StatelessWidget {
  const cartlistbuy({
    Key? key,
    required this.size,
    required this.linkImage, required this.nameCourse, required this.price, required this.rate, required this.name, required this.level, required this.detail
   }) : super(key: key);

  final Size size;
  final String? linkImage;
  final String? nameCourse;
  final int? price;
  final String? rate;
  final String? name;
  final String? level;
  final String? detail;

  @override
  Widget build(BuildContext context) {
    print(detail);
  return Column(
    children: [
      GestureDetector(
        onTap: (() {
          Get.toNamed('/coursesdetails',arguments: detail);
        }),
        child: Container(
          width: size.width,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    // color: kPrimaryColor1,
                  ),
                  child: linkImage == ''?Container(color: Colors.amber,): Image.network(linkImage!,fit: BoxFit.cover,),
      
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameCourse!,
                      
                      style: GoogleFonts.kanit(textStyle: TextStyle(fontWeight: FontWeight.w500),) ,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '${price} BTH',
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
                          rate!,
                          style: GoogleFonts.kanit(textStyle: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.amber,
                          size: 10,
                        ),
                        Text(
                          name!,
                          style: GoogleFonts.kanit(textStyle: TextStyle(color: Colors.grey),),
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.amber,
                          size: 10,
                        ),
                        Text(
                          level!,
                          style: GoogleFonts.kanit(textStyle: TextStyle(color: Colors.grey),),
                        ),
                      ],
                    ),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ),SizedBox(height: 20,),
    ],
  );
}
  }
