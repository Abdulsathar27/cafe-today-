import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_sizes.dart';
import 'package:cafebooking/screens/loginpage/login.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String userName;
  final String role;

  const TopBar({super.key, required this.userName, required this.role});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.person),
            const Text("Welcome back!",style: TextStyle(color: AppColors.accent),),
            Text(userName, style: const TextStyle(fontWeight: FontWeight.bold,color: AppColors.accent)),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CafeLoginPage() ));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.logout,
                  size: AppSizes.iconM,
                  color: AppColors.accent,
                ),
                SizedBox(width: 6),
                Text(
                  role,
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
