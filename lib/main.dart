import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/Screens/courses_screen/coursedata.dart';
import 'package:luk_to_learn/Screens/courses_screen/coursehome.dart';
import 'package:luk_to_learn/Screens/courses_screen/coursehometutor.dart';
import 'package:luk_to_learn/Screens/courses_screen/mylist.dart';
import 'package:luk_to_learn/Screens/courses_screen/video_info.dart';
import 'package:luk_to_learn/Screens/tutor_screen/addedcourses.dart';
import 'package:luk_to_learn/Screens/tutor_screen/mycoursetutor.dart';
import 'package:luk_to_learn/Screens/tutor_screen/registertutor.dart';
import 'package:luk_to_learn/Screens/user_screen/courses/mycourse.dart';
import 'package:luk_to_learn/Screens/user_screen/profile/about.dart';
import 'package:luk_to_learn/Screens/user_screen/cart-payment/add-card.dart';
import 'package:luk_to_learn/Screens/user_screen/cart-payment/cart.dart';
import 'package:luk_to_learn/Screens/user_screen/home.dart';
import 'package:luk_to_learn/Screens/user_screen/login/changepassword.dart';
import 'package:luk_to_learn/Screens/user_screen/chatroom.dart';
import 'package:luk_to_learn/Screens/tutor_screen/chatroomtutor.dart';
import 'package:luk_to_learn/Screens/tutor_screen/checkinfocourse.dart';
import 'package:luk_to_learn/Screens/user_screen/courses/courses.dart';
import 'package:luk_to_learn/Screens/tutor_screen/addcourses.dart';
import 'package:luk_to_learn/Screens/courses_screen/coursesdetail.dart';

import 'package:luk_to_learn/Screens/user_screen/courses/coursesvideo.dart';
import 'package:luk_to_learn/Screens/user_screen/courses/coursevideo.new.dart';
import 'package:luk_to_learn/Screens/user_screen/profile/editprofile.dart';
import 'package:luk_to_learn/Screens/tutor_screen/editprofiletutor.dart';
import 'package:luk_to_learn/Screens/user_screen/login/forgotpass.dart';
import 'package:luk_to_learn/Screens/user_screen/login/forgotpassOTP.dart';
import 'package:luk_to_learn/Screens/tutor_screen/infocourse.dart';
import 'package:luk_to_learn/Screens/tutor_screen/login_tutor.dart';
import 'package:luk_to_learn/Screens/user_screen/info.demo.dart';
import 'package:luk_to_learn/Screens/user_screen/profile/orderhis.dart';
import 'package:luk_to_learn/Screens/user_screen/cart-payment/payment.dart';
import 'package:luk_to_learn/Screens/user_screen/cart-payment/paymentqr.dart';
import 'package:luk_to_learn/Screens/user_screen/cart-payment/paymentselect.dart';
import 'package:luk_to_learn/Screens/user_screen/cart-payment/paymentvisa.dart';
import 'package:luk_to_learn/Screens/user_screen/profile/profile.dart';
import 'package:luk_to_learn/Screens/tutor_screen/profiletutor.dart';
import 'package:luk_to_learn/Screens/user_screen/profile/question.dart';
import 'package:luk_to_learn/route.dart';
import 'package:luk_to_learn/Screens/welcome_screen.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/routetutor.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'Screens/Auth/auth.dart';
import 'Screens/tutor_screen/hometutor.dart';
import 'Screens/user_screen/login/register.dart';
import 'Screens/user_screen/login/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey = 'pk_test_51MdZALDNQPZ0Ew6OPPwkrVzx8NHjEOeVj8RZfrfxOLktyT6BIW05D5NXln0dbw0BlIgwDt4V97PjCTa67Kn5L49P00s2D8h50B';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
      home: SplashScreenView(
        navigateRoute: AuthScreen(),
        duration: 3000,
        imageSize: 130,
        imageSrc:
            "https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/image%2Flogo.png?alt=media&token=1804964d-7195-41a1-90f1-66e941be28ff",
        text: "Luk to Learn.",
        textType: TextType.TyperAnimatedText,
        textStyle: TextStyle(
          fontSize: 30.0,
        ),
        backgroundColor: kPrimaryLightColor,
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
        '/mycoursetutor': ((context) => MycourseTutor()),
        '/registertutor': ((context) => RegistrationScreen()),
        '/login_tutor': ((context) => LoginTutor()),
        '/coursesvideonew': ((context) => CourseVideoNew()),
        '/video_info': ((context) => VideoInfo()),
        '/payment': ((context) => PaymentForm()),
        '/add-card': ((context) => AddCard()),
        '/home': ((context) => HomeScreen()),
        '/mycourse':((context) => Mycourses()),
        '/coursedata': ((context) => courseData()),
        '/coursehome': ((context) => CourseHome()),
        '/mylist': ((context) => MyList()),
        '/coursehometutor': ((context) => courseHomeTutor()),
        '/info.demo': ((context) => Infodemo(linkImage: '', nameCourse: '', price: null, name: '', detail: '', profileTutors: '')),
      },
    );
  }
}
