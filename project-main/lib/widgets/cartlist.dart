import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class cartlist extends StatelessWidget {
  const cartlist({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: size.width,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Declarative interfaces for any Apple \nDevices",
                          style: GoogleFonts.kanit(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "850.00 BTH",
                          style: GoogleFonts.kanit(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 10,
                            ),
                            Text(
                              "4.5",
                              style: GoogleFonts.kanit(fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.amber,
                              size: 10,
                            ),
                            Text(
                              "By SomChai Wong",
                              style: GoogleFonts.kanit(color: Colors.grey),
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.amber,
                              size: 10,
                            ),
                            Text(
                              "All Level",
                              style: GoogleFonts.kanit(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color(0xffFF8181),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
