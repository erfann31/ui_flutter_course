import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_flutter_course/view/screens/login_signup_screen.dart';

void main() => runApp(
  ScreenUtilInit(
    minTextAdapt: true,
    splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginSignupScreen(isSignup: false,),
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xffD6D7EF),
                primaryColor: Color(0xff9395D3),
          ),
        ),
      ),
    );
