import 'package:cafebooking/constants/app_colors.dart';
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
             child: const Text("Customer",style: TextStyle(fontWeight: FontWeight.bold),),),
            OutlinedButton(onPressed: () {},
            
            style: OutlinedButton.styleFrom(
              foregroundColor:AppColors.backgroundLight,
              backgroundColor: AppColors.buttonPrimary,
              side: const BorderSide(color:AppColors.primary) 
            ),
             child: const Text("Staff",style: TextStyle(fontWeight: FontWeight.bold),)),
            OutlinedButton(onPressed: () {},
            
            style: OutlinedButton.styleFrom(
              foregroundColor:AppColors.backgroundLight,
              backgroundColor: AppColors.buttonPrimary,
              side: const BorderSide(color:AppColors.primary) 
            ),
             child: const Text("Admin",style: TextStyle(fontWeight: FontWeight.bold),)),
            
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
