import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      onPressed: () {},
      icon: const Icon(Icons.login, color: AppColors.backgroundLight,),
      label: const Text("Sign In", style: TextStyle(color:AppColors.backgroundLight,fontSize: AppSizes.textM,fontWeight: FontWeight.bold)),
    );
  }
}
