import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  final String userName;
  const MenuHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: 'Hi, ',
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
          children: [
            TextSpan(
              text: userName,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
