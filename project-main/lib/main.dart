import 'package:flutter/material.dart';
import 'package:luk_to_learn/Screens/forgotpass.dart';
import 'package:luk_to_learn/Screens/forgotpassOTP.dart';
import 'package:luk_to_learn/route.dart';
import 'package:luk_to_learn/Screens/welcome_screen.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/routetutor.dart';

import 'Screens/hometutor.dart';
import 'Screens/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgotPass(),
      routes: {
        '/register': ((context) => RegisterScreen()),
        '/route': ((context) => RouteScreen()),
        '/routetutor': ((context) => RouteTutorScreen())
      },
    );
  }
}
