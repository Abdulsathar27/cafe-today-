import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_texts.dart';
import 'package:flutter/material.dart';

class QuickLoginSection extends StatelessWidget {
  const QuickLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor:AppColors.backgroundLight,
              backgroundColor: AppColors.buttonPrimary,
              side: const BorderSide(color:AppColors.primary) 
            ),
             child: const Text(AppTexts.customer1,style: TextStyle(fontWeight: FontWeight.bold),),),
            
            OutlinedButton(onPressed: () {},
            
            style: OutlinedButton.styleFrom(
              foregroundColor:AppColors.backgroundLight,
              backgroundColor: AppColors.buttonPrimary,
              side: const BorderSide(color:AppColors.primary) 
            ),
             child: const Text(AppTexts.admin,style: TextStyle(fontWeight: FontWeight.bold),)),
            
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
