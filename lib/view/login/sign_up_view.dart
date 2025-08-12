import 'package:first_practice/view/login/login_view.dart';
import 'package:first_practice/view/login/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:first_practice/common/color_extension.dart';
import 'package:first_practice/common_widget/round_button.dart';
import 'package:first_practice/common_widget/round_textfield.dart';
//import 'package:first_practice/common_widget/round_icon_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _LoginViewState();
}

class _LoginViewState extends State<SignUpView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

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
                "Sign Up",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),

              /// Subtitle
              Text(
                "Add your details to Sign Up",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),

              /// Email Field
              RoundTextfield(
                hintText: "Your Name",
                controller: txtName,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 25),

              RoundTextfield(
                hintText: "Your Email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 25),

              /// Password Field
              RoundTextfield(
                hintText: "Your Mobile No", // ✅ hint is "Password"
                controller: txtMobile,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 25),
              RoundTextfield(hintText: "Your Address", controller: txtAddress),
              const SizedBox(height: 25),

              RoundTextfield(
                hintText: "Your Password",
                controller: txtPassword,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 25),
              RoundTextfield(
                hintText: "Your Confirm Password",
                controller: txtConfirmPassword,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 25),

              /// Login Button
              RoundButton(
                title: "Sign Up",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OtpView()),
                  );
                },
              ),
              const SizedBox(height: 4),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "If you already have an account?",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Login",
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
