import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/models/cart_item.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.badgeBg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ValueListenableBuilder(
          valueListenable: Hive.box<CartItem>('cartBox').listenable(),
          builder: (context, Box<CartItem> cartBox, _) {
            if (cartBox.isEmpty) {
              return const Text(
                "Your cart is empty",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              );
            }

            final cartItems = cartBox.values.toList();

            // ✅ Safe total calculation
            final total = cartItems.fold<double>(
              0,
              (sum, cartItem) =>
                  sum + (cartItem.menuItem.price * cartItem.quantity),
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Order Summary",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                // ✅ List all cart items safely
                ...cartItems.map((cartItem) {
                  final menuItem = cartItem.menuItem;
                  final price = menuItem.price * cartItem.quantity;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${menuItem.title} x${cartItem.quantity}"),
                        Text("₹$price"),
                      ],
                    ),
                  );
                }),

                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "₹$total",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
