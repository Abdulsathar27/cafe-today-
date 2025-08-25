import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_sizes.dart';
import 'package:cafebooking/constants/app_texts.dart';
import 'package:flutter/material.dart';

class FooterText extends StatelessWidget {
  const FooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppTexts.qoutes1,
      style: TextStyle(color: AppColors.backgroundDark,fontSize: AppSizes.textM,fontWeight: FontWeight.bold),
    );
  }
}
