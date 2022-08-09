import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentQR extends StatefulWidget {
  const PaymentQR({Key? key}) : super(key: key);

  @override
  State<PaymentQR> createState() => _PaymentQRState();
}

class _PaymentQRState extends State<PaymentQR> {
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
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset('assets/images/qrcode.png'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 60,
                              width: 300,
                              decoration:
                                  BoxDecoration(color: Colors.grey[200]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: GoogleFonts.kanit(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '1500.0',
                                      style: GoogleFonts.kanit(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 50,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffFF8181),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 120),
                                  child: Text('เสร็จสิ้น',
                                      style: GoogleFonts.kanit(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
