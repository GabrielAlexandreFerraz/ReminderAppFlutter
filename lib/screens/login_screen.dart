import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reminderapp/screens/home_screen.dart';
import 'package:reminderapp/screens/signup_screen.dart';
import 'package:reminderapp/utils/app_colors.dart';
import 'package:reminderapp/widgets/round_gradient_button.dart';
import 'package:reminderapp/widgets/round_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  Future<User?> _signIn(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = userCredential.user;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login Sucessfully"),
        ),
      );

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
      return user;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login Failed, Please check your email and password"),
        ),
      );
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: media.height * 0.01),
                  SizedBox(
                    width: media.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: media.width * 0.03,
                        ),
                        Text(
                          "Hey There",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: media.height * 0.03,
                        ),
                        Text(
                          "Welcome Back ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.1,
                  ),
                  RoundTextField(
                    textEditingController: _emailController,
                    hintText: "Email",
                    icon: "assets/icons/message_icon.png",
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: media.height * 0.05,
                  ),
                  RoundTextField(
                    textEditingController: _passController,
                    hintText: "Password",
                    icon: "assets/icons/lock_icon.png",
                    textInputType: TextInputType.text,
                    isObsecureText: _isObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      return null;
                    },
                    rightIcon: TextButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          _isObscure
                              ? "assets/icons/show_pwd_icon.png"
                              : "assets/icons/hide_pwd_icon.png",
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                          color: AppColors.grayColor,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Your Password?",
                        style: TextStyle(
                          color: AppColors.secundaryColor1,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.1,
                  ),
                  RoundGradientButton(
                    title: "Login",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _signIn(context, _emailController.text,
                            _passController.text);
                      }
                    },
                  ),
                  SizedBox(
                    height: media.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: 1,
                          color: AppColors.grayColor.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        "   or    ",
                        style: TextStyle(
                          color: AppColors.grayColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: 1,
                          color: AppColors.grayColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: AppColors.primaryColor1.withOpacity(0.5),
                                width: 1,
                              )),
                          child: Image.asset(
                            "assets/icons/google_icon.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: AppColors.primaryColor1.withOpacity(0.5),
                                width: 1,
                              )),
                          child: Image.asset(
                            "assets/icons/facebook_icon.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(text: "Don't have an account?   "),
                          TextSpan(
                            text: "Register",
                            style: TextStyle(
                              color: AppColors.secundaryColor1,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
