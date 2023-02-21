import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColors,
        title: Text('Order History'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      orderhis(size),
                      SizedBox(
                        height: 20,
                      ),
                      orderhis(size),
                      SizedBox(
                        height: 20,
                      ),
                      orderhis(size),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Container orderhis(Size size) {
  return Container(
    width: size.width,
    height: 120,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18), color: Colors.grey[300]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "11/05/2022",
              style: GoogleFonts.kanit(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 80,
          ),
          Text(
            "850.00 BTH",
            style: GoogleFonts.kanit(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Declarative interfaces",
            style: GoogleFonts.kanit(fontSize: 15, fontWeight: FontWeight.w400),
          ),
        )
      ],
    ),
  );
}
