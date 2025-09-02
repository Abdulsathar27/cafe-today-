import 'package:flutter/material.dart';
import 'package:cafebooking/models/cart_item.dart';
import 'package:cafebooking/services/cart_service.dart';

class CartSummary extends StatelessWidget {
  final List<CartItem> items;
  const CartSummary({super.key, required this.items, required List<CartItem> cartItems});

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
          Text("Total: ₹$total", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ElevatedButton(
            onPressed: () {
              // TODO: handle checkout
            },
            child: const Text("Checkout"),
          ),
        ],
      ),
    );
  }
}
