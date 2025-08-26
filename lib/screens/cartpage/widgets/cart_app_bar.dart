import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/menu/menu_page.dart';
import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  final int itemCount;
  const CartAppBar({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MenuPage())),
            splashRadius: 22,
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Cart',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Text(
            '$itemCount Item${itemCount > 1 ? "s" : ""}',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
