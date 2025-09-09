import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_sizes.dart';
import 'package:cafebooking/screens/loginpage/login.dart';
import 'package:cafebooking/screens/menu/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_texts.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  Future<void> _confirmLogout(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          ElevatedButton(
            style:ElevatedButton.styleFrom(
              backgroundColor: AppColors.badgeText,
              foregroundColor: AppColors.textWhite,

            ),
            onPressed: () => Navigator.pop(ctx, false), 
            child: const Text("No"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.logoutColor,
              foregroundColor: AppColors.textWhite,
            ),
            onPressed: () => Navigator.pop(ctx, true), 
            child: const Text("Yes"),
          ),
        ],
      ),
    );

    if (result == true) {
      // ✅ If confirmed, go to login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const CafeLoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MenuPage()),
            ),
          ),
          const SizedBox(width: 4),
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
          TextButton.icon(
            onPressed: () => _confirmLogout(context),
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
