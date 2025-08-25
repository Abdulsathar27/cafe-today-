import 'package:cafebooking/constants/app_colors.dart';
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
            onPressed: () => Navigator.maybePop(context),
          ),
          const SizedBox(width: 4),
          // Title centered-ish visually like screenshot
          const Expanded(
            child: Text(
              AppTexts.profile,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          // gear icon
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
          // Edit (text button look)
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined, size: 18, color: Colors.black87),
            label: Text(AppTexts.edit, style: TextStyle(color: AppColors.editColor)),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          const SizedBox(width: 4),
          // Logout (red)
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.logout, size: 18, color: AppColors.logoutColor),
            label: Text(AppTexts.logout, style: TextStyle(color: AppColors.logoutColor)),
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
