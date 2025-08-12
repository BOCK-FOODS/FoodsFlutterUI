import 'package:first_practice/common/color_extension.dart'; // Uncomment if you have TColor defined here
import 'package:first_practice/common_widget/round_button.dart';
import 'package:flutter/material.dart';
import '../login/login_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    "assets/img/logo.png",
                    width: media.width * 0.55,
                    height: media.height * 0.55,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              SizedBox(height: media.width * 0.1),

              Text(
                "Welcome to the Bock",
                style: TextStyle(
                  color: TColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: media.width * 0.1),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RoundButton(
                  title: "Login",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: RoundButton(
                  title: "Create an Account",
                  type: RoundButtonType.textPrimary,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
