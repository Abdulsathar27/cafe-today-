import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'mine_tab_chip.dart';
import 'all_tab_chip.dart';

class OrdersTabs extends StatelessWidget {
  final int selectedIndex; // 0 = Mine, 1 = All
  final ValueChanged<int> onChanged;

  const OrdersTabs({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Track container (pill)
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.inputFill,                // light track
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder),
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        children: [
          Expanded(
            child: MineTabChip(
              selected: selectedIndex == 0,
              onTap: () => onChanged(0),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: AllTabChip(
              selected: selectedIndex == 1,
              onTap: () => onChanged(1),
            ),
          ),
        ],
      ),
    );
  }
}
