import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/Screens/tutor_screen/addedcourses.dart';
import 'package:luk_to_learn/Screens/user_screen/about.dart';
import 'package:luk_to_learn/Screens/user_screen/cart.dart';
import 'package:luk_to_learn/Screens/user_screen/changepassword.dart';
import 'package:luk_to_learn/Screens/user_screen/chatroom.dart';
import 'package:luk_to_learn/Screens/tutor_screen/chatroomtutor.dart';
import 'package:luk_to_learn/Screens/tutor_screen/checkinfocourse.dart';
import 'package:luk_to_learn/Screens/user_screen/courses.dart';
import 'package:luk_to_learn/Screens/tutor_screen/addcourses.dart';
import 'package:luk_to_learn/Screens/courses_screen/coursesdetail.dart';

import 'package:luk_to_learn/Screens/user_screen/coursesvideo.dart';
import 'package:luk_to_learn/Screens/user_screen/editprofile.dart';
import 'package:luk_to_learn/Screens/tutor_screen/editprofiletutor.dart';
import 'package:luk_to_learn/Screens/user_screen/forgotpass.dart';
import 'package:luk_to_learn/Screens/user_screen/forgotpassOTP.dart';
import 'package:luk_to_learn/Screens/tutor_screen/infocourse.dart';
import 'package:luk_to_learn/Screens/user_screen/orderhis.dart';
import 'package:luk_to_learn/Screens/user_screen/paymentqr.dart';
import 'package:luk_to_learn/Screens/user_screen/paymentselect.dart';
import 'package:luk_to_learn/Screens/user_screen/paymentvisa.dart';
import 'package:luk_to_learn/Screens/user_screen/profile.dart';
import 'package:luk_to_learn/Screens/tutor_screen/profiletutor.dart';
import 'package:luk_to_learn/Screens/user_screen/question.dart';
import 'package:luk_to_learn/route.dart';
import 'package:luk_to_learn/Screens/welcome_screen.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/routetutor.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'Screens/Auth/auth.dart';
import 'Screens/tutor_screen/hometutor.dart';
import 'Screens/user_screen/register.dart';

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
        '/addedcourses': ((context) => AddedCourses()),
      },
    );
  }
}
