import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_sizes.dart';
import 'package:flutter/material.dart';


class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r8),
        ),
        padding: const EdgeInsets.symmetric(vertical: AppSizes.p12),
      ),
      onPressed: () {},
      icon: const Icon(Icons.person_add, color: AppColors.textWhite),
      label: const Text(
        "Create Account",
        style: TextStyle(color: AppColors.textWhite),
      ),
    );
  }
}
