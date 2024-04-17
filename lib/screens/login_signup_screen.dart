import 'package:flutter/material.dart';
import 'package:ui_flutter_course/screens/home_screen.dart';

class LoginSignupScreen extends StatelessWidget {
  final bool isSignup;

  const LoginSignupScreen({Key? key, required this.isSignup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: FlutterLogo(
                    size: 150,
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                const Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 28.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  isSignup ? "Create an account to get started" : "Sign in to continue",
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                MaterialButton(
                  onPressed: () {
                    isSignup
                        ? {}
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                  },
                  color: Theme.of(context).primaryColor,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    isSignup ? "Sign up".toUpperCase() : "Sign in".toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  textColor: Colors.white,
                  height: 70,
                  minWidth: double.infinity,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      isSignup ? "Already have an account?" : "Don't have an account?",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginSignupScreen(
                              isSignup: !isSignup,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        isSignup ? "LOG IN" : "SIGN UP",
                        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
