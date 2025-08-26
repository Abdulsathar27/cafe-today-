import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'menu_grid.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItemVm vm;
  const MenuItemCard({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.badgeBg,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias, // ✅ clip image to rounded corners
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // ✅ make children full width
        children: [
          // ✅ image takes all remaining height & full width
          Expanded(
            child: SizedBox.expand(
              child: Image.asset(
                vm.imageUrl,
                fit: BoxFit.cover, // ✅ cover the box fully
                alignment: Alignment.center,
              ),
            ),
          ),

          // bottom content
          Container(
            color: AppColors.badgeBg,
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  vm.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  vm.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '₹${vm.price}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 30,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Add', style: TextStyle(fontWeight: FontWeight.w600)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonPrimary,
                          foregroundColor: AppColors.buttonText,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
