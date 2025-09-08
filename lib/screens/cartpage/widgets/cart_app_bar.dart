import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/menu/menu_page.dart';
import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Your Cart"),
      centerTitle: true,
      backgroundColor: AppColors.primary,

    
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MenuPage()), 
            (route) => false, 
          );
        },
      ),

     
      actions: [
        IconButton(
          icon: const Icon(Icons.check),
          onPressed: () {
            // 👉 TODO: Navigate to checkout page or trigger checkout logic
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
              backgroundColor: AppColors.buttonPrimary,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
          ),
                content: const Text("Proceeding to Checkout...")),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
