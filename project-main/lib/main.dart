import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/Screens/about.dart';
import 'package:luk_to_learn/Screens/cart.dart';
import 'package:luk_to_learn/Screens/changepassword.dart';
import 'package:luk_to_learn/Screens/chatroom.dart';
import 'package:luk_to_learn/Screens/chatroomtutor.dart';
import 'package:luk_to_learn/Screens/checkinfocourse.dart';
import 'package:luk_to_learn/Screens/courses.dart';
import 'package:luk_to_learn/Screens/addcourses.dart';
import 'package:luk_to_learn/Screens/courses_screen/coursesdetail.dart';

import 'package:luk_to_learn/Screens/coursesvideo.dart';
import 'package:luk_to_learn/Screens/editprofile.dart';
import 'package:luk_to_learn/Screens/editprofiletutor.dart';
import 'package:luk_to_learn/Screens/forgotpass.dart';
import 'package:luk_to_learn/Screens/forgotpassOTP.dart';
import 'package:luk_to_learn/Screens/infocourse.dart';
import 'package:luk_to_learn/Screens/orderhis.dart';
import 'package:luk_to_learn/Screens/paymentqr.dart';
import 'package:luk_to_learn/Screens/paymentselect.dart';
import 'package:luk_to_learn/Screens/paymentvisa.dart';
import 'package:luk_to_learn/Screens/profile.dart';
import 'package:luk_to_learn/Screens/profiletutor.dart';
import 'package:luk_to_learn/Screens/question.dart';
import 'package:luk_to_learn/route.dart';
import 'package:luk_to_learn/Screens/welcome_screen.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/routetutor.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

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
    return GetMaterialApp(
      home: SplashScreenView(
      navigateRoute: AuthScreen(),
      duration: 3000,
      imageSize: 130,
      imageSrc: "https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/logo.png?alt=media&token=f9046186-043d-40eb-862f-85bd3bee8626",
      text: "Luk to Learn",
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: Colors.white,
    ),
      debugShowCheckedModeBanner: false,
      
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
        '/addcourses': ((context) => AddCourses()),
        '/question': ((context) => Question()),
        '/orderhis': ((context) => OrderHistory()),
        '/welcome_screen': ((context) => WelcomeScreen()),
        '/editprofile': ((context) => EditProfile()),
        '/editprofiletutor': ((context) => EditProfileTutor()),
        '/paymentselect': ((context) => PaymentSelect()),
        '/paymentqr': ((context) => PaymentQR()),
        '/paymentvisa': ((context) => PaymentVisa()),
        '/coursesvideo': ((context) => CoursesVideo(title: '')),
        '/chatroomtutor': ((context) => ChatRoomTutor()),
        '/chatroom': ((context) => ChatRoom()),
        '/coursesdetails': ((context) => CoursesDetails()),
        '/checkinfocourse': ((context) => CheckInfoCourse()),
        '/infocourse': ((context) => InfoCourse()),
      },
    );
  }
}
