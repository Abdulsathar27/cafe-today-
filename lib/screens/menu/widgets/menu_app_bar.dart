import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/cartpage/cart_page.dart';
import 'package:cafebooking/screens/profile/profilepage.dart';
import 'package:flutter/material.dart';

class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MenuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Menu"),
      centerTitle: true,
      backgroundColor: AppColors.primary,
      leading: IconButton(
        icon: const Icon(Icons.person_2_outlined), 
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const ProfilePage()), 
            (route) => false, 
          );
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_checkout_sharp), 
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const CartPage()), 
              (route) => false, 
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
