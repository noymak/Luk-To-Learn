import 'package:flutter/material.dart';

Widget onMyLoad(Size size , Color colors){
  return  Container(
                width: size.width,
                height: size.height * 0.4,
                color: colors,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Text('Loading..'),
                    )
                  ],
                ),
              );
}