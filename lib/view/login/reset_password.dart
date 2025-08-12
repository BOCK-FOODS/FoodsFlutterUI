//import 'package:first_practice/view/login/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:first_practice/common/color_extension.dart';
import 'package:first_practice/common_widget/round_button.dart';
import 'package:first_practice/common_widget/round_textfield.dart';
import 'package:first_practice/view/login/new_password.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
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
                "Reset Password",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 15),

              /// Subtitle
              Text(
                "Please enter your email to receive a\nlink to create a new password via email",
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

              /// Login Button
              RoundButton(
                title: "send",
                onPressed: () {
                  // Handle login logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewPasswordView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
