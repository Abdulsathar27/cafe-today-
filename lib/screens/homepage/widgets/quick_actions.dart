import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.person, size: 30,color: AppColors.accent,),
            SizedBox(height: 4,),
            Text("Profile",style: TextStyle(fontSize: AppSizes.textM,color: AppColors.accent),)
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children:const[
            Icon(Icons.receipt_long, size: 30,color: AppColors.accent,),
            SizedBox(height: 4,),
            Text("Orders",style: TextStyle(fontSize: AppSizes.textM,color: AppColors.accent),)
          ],
        )
        
        
        
      ],
    );
  }
}
