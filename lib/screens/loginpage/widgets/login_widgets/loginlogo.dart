import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_sizes.dart';
import 'package:cafebooking/constants/app_texts.dart';
import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor:AppColors.primary,
          child: Icon(Icons.coffee_sharp, size:AppSizes.iconXL, color:AppColors.buttonText),
        ),
        const SizedBox(height: 12),
        const Text(
          AppTexts.appName,
          style: TextStyle(fontSize: AppSizes.textXXL, fontWeight: FontWeight.bold),
        ),
        const Text(
          AppTexts.welcomeUser,
          style: TextStyle(color:AppColors.textSecondary),
        ),
      ],
    );
  }
}
