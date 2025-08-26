import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MenuTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  const MenuTabs({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder),
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        children: [
          Expanded(child: _TabChip(icon: Icons.local_cafe, selected: selectedIndex == 0, onTap: () => onChanged(0))),
          const SizedBox(width: 6),
          Expanded(child: _TabChip(icon: Icons.cookie_outlined, selected: selectedIndex == 1, onTap: () => onChanged(1))),
          const SizedBox(width: 6),
          Expanded(child: _TabChip(icon: Icons.icecream_outlined, selected: selectedIndex == 2, onTap: () => onChanged(2))),
          const SizedBox(width: 6),
          Expanded(child: _TabChip(icon: Icons.local_drink_outlined, selected: selectedIndex == 3, onTap: () => onChanged(3))),
        ],
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  const _TabChip({required this.icon, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bg = selected ? AppColors.borderLight : Colors.transparent;
    final border = selected ? AppColors.cardBorder : Colors.transparent;
    final iconColor = selected ? AppColors.textPrimary : AppColors.textSecondary;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: border),
        ),
        alignment: Alignment.center,
        child: Icon(icon, size: 18, color: iconColor),
      ),
    );
  }
}
