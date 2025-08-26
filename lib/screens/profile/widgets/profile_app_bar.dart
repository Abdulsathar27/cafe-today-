import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_sizes.dart';
import 'package:cafebooking/screens/homepage/home.dart';
import 'package:cafebooking/screens/loginpage/login.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_texts.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Row(
        children: [
          // Back arrow
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage())),
          ),
          const SizedBox(width: 4),
          // Title centered-ish visually like screenshot
          const Expanded(
            child: Text(
              AppTexts.profile,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: AppSizes.textLl,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 4),
          // Edit (text button look)
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.edit_outlined,
              size: AppSizes.textLl,
              color: Colors.black87,
            ),
            label: Text(
              AppTexts.edit,
              style: TextStyle(color: AppColors.editColor),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          const SizedBox(width: 4),
          // Logout (red)
          TextButton.icon(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CafeLoginPage()));
            },
            icon: Icon(Icons.logout, size: 18, color: AppColors.logoutColor),
            label: Text(
              AppTexts.logout,
              style: TextStyle(color: AppColors.logoutColor),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
