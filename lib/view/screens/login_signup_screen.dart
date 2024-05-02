import 'package:flutter/material.dart';
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
        User user = User(email: _emailController.text.trim(), password: _passwordController.text.trim());
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
        User user = User(email: _emailController.text.trim(), password: _passwordController.text.trim());
        try {
          String? errorSignup = await _repository.signup(user);
          String? errorLogin = await _repository.login(user);
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
                  widget.isSignup ? "Create an account to get started" : "Sign in to continue",
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(
                  height: 30.0,
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
                const SizedBox(
                  height: 10.0,
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
                const SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                  onPressed: widget.isSignup ? _handleSignup : _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    minimumSize: Size(double.infinity, 70),
                  ),
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          widget.isSignup ? "Sign up".toUpperCase() : "Sign in".toUpperCase(),
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.isSignup ? "Already have an account?" : "Don't have an account?",
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
                              isSignup: !widget.isSignup,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        widget.isSignup ? "LOG IN" : "SIGN UP",
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
