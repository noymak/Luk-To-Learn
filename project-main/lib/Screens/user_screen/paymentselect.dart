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
                    Expanded(
                        child: Column(
                      children: [
                        ListTile(
                          onTap: () {Navigator.pushNamed(context, '/paymentqr');},
                          leading: Container(
                              height: 40, width: 40, child: Image.asset('')),
                          title: Text('SCB QR'),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          onTap: () {Navigator.pushNamed(context, '/paymentvisa');},
                          leading: Container(
                              height: 40, width: 40, child: Image.asset('')),
                          title: Text('Credit Card'),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        
                      ],
                    ),),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'Total Amount',
                              style: GoogleFonts.kanit(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '1500.00 ฿',
                            style: GoogleFonts.kanit(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
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
