import 'package:first_practice/view/login/sign_up_view.dart';
import 'package:first_practice/view/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:first_practice/common/color_extension.dart';
import 'package:first_practice/common_widget/round_button.dart';
import 'package:first_practice/common_widget/round_textfield.dart';
import 'package:first_practice/common_widget/round_icon_button.dart';
import 'package:first_practice/view/login/reset_password.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),

              /// Title
              Text(
                "Login",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),

              /// Subtitle
              Text(
                "Add your details to login",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),

              /// Email Field
              RoundTextfield(
                hintText: "Your Email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              /// Password Field
              RoundTextfield(
                hintText: "Password", // ✅ hint is "Password"
                controller: txtPassword,
                obscureText: true,
              ),
              const SizedBox(height: 25),

              /// Login Button
              RoundButton(
                title: "Login",
                onPressed: () {
                  // Handle login logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnBoardingView(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 4),

              /// Forgot Password
              TextButton(
                onPressed: () {
                  // Handle forgot password
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPasswordView(),
                    ),
                  );
                },
                child: Text(
                  "Forgot Your Password",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 25),

              Text(
                "or Login with",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 25),

              RoundIconButton(
                icon: "assets/img/facebook_logo.png",
                title: "Login with Facebook",
                color: Colors.blueAccent,
                onPressed: () {},
              ),

              const SizedBox(height: 25),

              RoundIconButton(
                icon: "assets/img/google_logo.png",
                title: "Login with Google",
                color: Colors.redAccent,
                onPressed: () {},
              ),

              TextButton(
                onPressed: () {
                  // Handle forgot password
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpView()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
