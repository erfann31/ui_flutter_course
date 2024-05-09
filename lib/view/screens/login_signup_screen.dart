import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_flutter_course/model/entities/user_model.dart';
import 'package:ui_flutter_course/model/repositories/account_repository.dart';
import 'package:ui_flutter_course/view/screens/home_screen.dart';

class LoginSignupScreen extends StatefulWidget {
  final bool isSignup;

  const LoginSignupScreen({required this.isSignup});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final StoreRepository _repository = StoreRepository();
  bool isLoading = false;
  void _handleLogin() async {
    if (_emailController.text.trim() == ""
        || _passwordController.text.trim() == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all of text fields"),
        ),
      );
    } else {
      if (!_emailController.text.trim().contains("@")
          || _passwordController.text.trim().length < 3) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Enter valid email address and password with at least 3 char"),
          ),
        );
      } else {
        setState(() {
          isLoading = true;
        });
        User user = User(
          email: _emailController.text.trim().toLowerCase(),
          password: _passwordController.text.trim(),
        );
        try {
          String? errorMessage = await _repository.login(user);
          print(errorMessage);
          if (errorMessage == null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
              ),
            );
          }
          setState(() {
            isLoading = false;
          });
        } catch (e) {
          print("Login failed: $e");
        }
      }
    }
  }

  void _handleSignup() async {
    if (_emailController.text.trim() == "" || _passwordController.text.trim() == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all of text fields"),
        ),
      );
    } else {
      if (!_emailController.text.trim().contains("@") || _passwordController.text.trim().length < 3) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Enter valid email address and password with at least 3 char"),
          ),
        );
      } else {
        setState(() {
          isLoading = true;
        });
        User user = User(
          email: _emailController.text.trim().toLowerCase(),
          password: _passwordController.text.trim(),
        );
        try {
          String? errorSignup = await _repository.signup(user);
          if (errorSignup == null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorSignup),
              ),
            );
          }
          setState(() {
            isLoading = false;
          });
        } catch (e) {
          print("Signup failed: $e");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: FlutterLogo(
                    size: 150.r,
                  ),
                ),
                SizedBox(
                  height: 60.0.h,
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 28.0.sp,
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Text(
                  widget.isSignup ? "Create an account to get started" : "Sign in to continue",
                  style: TextStyle(
                    fontSize: 16.0.sp,
                  ),
                ),
                SizedBox(
                  height: 30.0.h,
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 40.0.h,
                ),
                ElevatedButton(
                  onPressed: widget.isSignup ? _handleSignup : _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 8.w,
                    ),
                    minimumSize: Size(double.infinity, 0.085.sh),
                  ),
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          widget.isSignup ? "Sign up".toUpperCase() : "Sign in".toUpperCase(),
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                ),
                SizedBox(
                  height: 40.0.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.isSignup ? "Already have an account?" : "Don't have an account?",
                      style: TextStyle(fontSize: 16.0.sp),
                    ),
                    SizedBox(
                      width: 10.0.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginSignupScreen(
                              isSignup: !widget.isSignup,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        widget.isSignup ? "LOG IN" : "SIGN UP",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.0.sp,
                        ),
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
