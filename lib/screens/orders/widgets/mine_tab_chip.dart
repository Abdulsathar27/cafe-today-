import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MineTabChip extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;

  const MineTabChip({
    super.key,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = selected ? AppColors.borderLight : Colors.transparent;
    final border = selected ? AppColors.cardBorder : Colors.transparent;
    final textColor =
        selected ? AppColors.textPrimary : AppColors.textSecondary;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: border),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 16, color: textColor),
            const SizedBox(width: 6),
            Text(
              'Mine',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
