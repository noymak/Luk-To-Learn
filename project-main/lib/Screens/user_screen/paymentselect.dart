import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentSelect extends StatefulWidget {
  const PaymentSelect({Key? key}) : super(key: key);

  @override
  State<PaymentSelect> createState() => _PaymentSelectState();
}

class _PaymentSelectState extends State<PaymentSelect> {
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
                            Navigator.pushNamed(context, '/cart');
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
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/paymentqr');
                        },
                        child: Container(
                          height: 100,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xffFF8181),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30, left: 100),
                            child: Text(
                              'Qrcode',
                              style: GoogleFonts.kanit(fontSize: 30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/paymentvisa');
                        },
                        child: Container(
                          height: 100,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xffFF8181),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30, left: 70),
                            child: Text(
                              'Credit Card',
                              style: GoogleFonts.kanit(fontSize: 30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    Center(
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Text('กรุณาเลือกช่องทางการชำระ',
                              style: GoogleFonts.kanit(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ),
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
