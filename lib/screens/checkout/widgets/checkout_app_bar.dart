import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/cartpage/cart_page.dart'; // ✅ import your CartPage

class CheckoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CheckoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Checkout"),
      centerTitle: true,
      backgroundColor: AppColors.buttonText, // ✅ use app color
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const CartPage()),
            (route) => false, // ✅ removes all previous pages
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
