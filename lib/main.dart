import 'package:flutter/material.dart';
import 'package:ui_flutter_course/view/screens/login_signup_screen.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginSignupScreen(isSignup: false,),
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffD6D7EF),
              primaryColor: Color(0xff9395D3),
        ),
      ),
    );
