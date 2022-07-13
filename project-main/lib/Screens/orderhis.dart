import 'package:flutter/material.dart';

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
      backgroundColor: Color(0xff6360FF),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xff6360FF),
              height: size.height * 0.15,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/route');
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text("Order History",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[300])),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
    height: 110,
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 100,
          ),
          Text(
            "850.00 BTH",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Declarative interfaces",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
        )
      ],
    ),
  );
}
