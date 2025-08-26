import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_texts.dart';
import 'package:cafebooking/screens/menu/menu_page.dart';
import 'package:flutter/material.dart';

class BrowseMenuButton extends StatelessWidget {
  const BrowseMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MenuPage ()),
        );
      },
      icon: const Icon(Icons.local_cafe, color: AppColors.backgroundLight),
      label: const Text(
        AppTexts.browsemenu,
        style: TextStyle(color: AppColors.textWhite),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
