import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/sign_up_page/sign_up_page.dart';
import 'package:cafebooking/screens/sign_up_page/widgets/sign_up_card.dart';
import 'package:flutter/material.dart';

class SignUpLink extends StatelessWidget {
  const SignUpLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don’t have an account? "),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpPage()),
            );
          },
          child: Text(
            "Sign up",
            style: TextStyle(
              color: AppColors.buttonPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
