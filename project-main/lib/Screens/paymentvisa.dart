import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentVisa extends StatefulWidget {
  const PaymentVisa({Key? key}) : super(key: key);

  @override
  State<PaymentVisa> createState() => _PaymentVisaState();
}

class _PaymentVisaState extends State<PaymentVisa> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 40.0),
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/paymentselect');
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 40,
                          ),
                        ),
                        Text(
                          'Payment',
                          style: GoogleFonts.kanit(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
