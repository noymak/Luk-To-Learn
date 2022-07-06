import 'package:flutter/material.dart';

class ForgotPassOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff6360FF),
      body: Stack(
        children: [
          Container(
            height: 0.15,
            decoration: BoxDecoration(),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height / 2 * 0.15),
            height: size.height * 1,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        ForgotPassOTPForm("OTP"),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Please Enter OTP",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 320,
                        ),
                        Container(
                          height: 50,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Color(0xffFF8181),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              "Confirm",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Container ForgotPassOTPForm(String text) {
  return Container(
    decoration: BoxDecoration(
      // border: Border.all(),
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          offset: const Offset(
            5.0,
            5.0,
          ),
          blurRadius: 10.0,
          spreadRadius: 2.0,
        ), //BoxShadow
        // BoxShadow(
        //   color: Colors.white,
        //   offset: const Offset(0.0, 0.0),
        //   blurRadius: 0.0,
        //   spreadRadius: 0.0,
        // ), //BoxShadow
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
        ),
      ),
    ),
  );
}
