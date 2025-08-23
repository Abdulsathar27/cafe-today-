import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(Icons.coffee, size: 80, color: AppColors.primary),
        SizedBox(height: 10),
        Text(
          "Cafe Today",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text("Where every sip buzzes with flavor" ,style: TextStyle(color: AppColors.accent),),
        SizedBox(height: 10,),
        Text("Customer Portal",
            style: TextStyle(color: AppColors.accent)),
      ],
    );
  }
}
