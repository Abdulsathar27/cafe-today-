import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/checkout/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/models/cart_item.dart';
import 'package:cafebooking/services/cart_service.dart';

class CartSummary extends StatelessWidget {
  final List<CartItem> items;
  const CartSummary({
    super.key,
    required this.items,
    required List<CartItem> cartItems,
  });

  @override
  Widget build(BuildContext context) {
    final total = CartService.getTotal();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total: ₹$total",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonPrimary,
              foregroundColor: AppColors.textWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const CheckoutPage()),
                (route) => false,
              );
            },
            child: const Text(
              "Checkout",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
