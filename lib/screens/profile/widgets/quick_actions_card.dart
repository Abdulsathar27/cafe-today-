import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_texts.dart';
import 'section_shell.dart';

class QuickActionsCard extends StatelessWidget {
  const QuickActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      header: Row(
        children: [
          const Icon(Icons.bolt_outlined, size: AppSizes.textLl),
          const SizedBox(width: 8),
          Text(
            AppTexts.quickActions,
            style: TextStyle(
              fontSize: AppSizes.textM,
              fontWeight: FontWeight.w600,
              color: AppColors.sectionTitle,
            ),
          ),
        ],
      ),
      body: Column(
        children: const [
          _ActionTile(icon: Icons.history, title: AppTexts.orderHistory),
          SizedBox(height: 8),
          _ActionTile(
            icon: Icons.restaurant_menu_outlined,
            title: AppTexts.browsemenu,
          ),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  const _ActionTile({required this.icon, required this.title,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.actionTileBorder),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.centerLeft,
        ),
        child: Row(
          children: [
            Icon(icon, size: AppSizes.iconS,color: AppColors.backgroundDark,),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(fontSize: AppSizes.textSs,color:AppColors.textPrimary)),
          ],
        ),
      ),
    );
  }
}
