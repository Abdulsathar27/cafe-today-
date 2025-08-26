import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.coffee,
          size: 90,                
          color: AppColors.textWhite,
        ),
        const SizedBox(height: 10),
        Text(
          "CAFE 2DAY",
          style: GoogleFonts.poppins(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: AppColors.textWhite,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}
