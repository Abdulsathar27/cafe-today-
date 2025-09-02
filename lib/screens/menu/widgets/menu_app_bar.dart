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
      backgroundColor: Colors.orange,
      leading: IconButton(
        icon: const Icon(Icons.person_2_outlined), // 👈 Profile icon
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const ProfilePage()), // replace with your ProfilePage
            (route) => false, // remove all previous routes
          );
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_checkout_outlined), // 👈 Cart icon
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const CartPage()), // replace with your CartPage
              (route) => false, // remove all previous routes
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
