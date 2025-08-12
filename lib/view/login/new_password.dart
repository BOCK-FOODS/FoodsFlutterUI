//import 'package:first_practice/view/login/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:first_practice/common/color_extension.dart';
import 'package:first_practice/common_widget/round_button.dart';
import 'package:first_practice/common_widget/round_textfield.dart';
//import 'package:first_practice/common_widget/round_icon_button.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
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
                "New Password",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 15),

              /// Subtitle
              Text(
                "Please enter your new Password",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),

              /// Email Field
              RoundTextfield(hintText: "New Password", controller: txtPassword),
              const SizedBox(height: 20),

              /// Login Button
              RoundTextfield(
                hintText: "Confirm Password",
                controller: txtPassword,
              ),
              const SizedBox(height: 20),
              RoundButton(
                title: "send",
                onPressed: () {
                  // Handle login logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
