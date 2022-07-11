import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luk_to_learn/Screens/about.dart';
import 'package:luk_to_learn/Screens/cart.dart';
import 'package:luk_to_learn/Screens/changepassword.dart';
import 'package:luk_to_learn/Screens/courses.dart';
import 'package:luk_to_learn/Screens/coursesdetail.dart';
import 'package:luk_to_learn/Screens/forgotpass.dart';
import 'package:luk_to_learn/Screens/forgotpassOTP.dart';
import 'package:luk_to_learn/Screens/profile.dart';
import 'package:luk_to_learn/route.dart';
import 'package:luk_to_learn/Screens/welcome_screen.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/routetutor.dart';

import 'Screens/Auth/auth.dart';
import 'Screens/hometutor.dart';
import 'Screens/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
      routes: {
        '/register': ((context) => RegisterScreen()),
        '/route': ((context) => RouteScreen()),
        '/routetutor': ((context) => RouteTutorScreen()),
        '/forgotpass': ((context) => ForgotPass()),
        '/forgotpassOTP': ((context) => ForgotPassOTP()),
        '/changepassword': ((context) => ChangePass()),
        '/about': ((context) => AboutLTL()),
        '/cart': ((context) => CartScreen()),
        '/courses': ((context) => CoursesScreen()),
        '/coursesdetail': ((context) => Detail()),
      },
    );
  }
}
