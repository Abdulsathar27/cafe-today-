import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'widgets/cart_app_bar.dart';
import 'widgets/cart_item_tile.dart';
import 'widgets/cart_summary.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientTop, AppColors.gradientBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const CartAppBar(itemCount: 1),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: const [
                      CartItemTile(
                        imageUrl: 'assets/Images/Cappuccino.png',
                        title: 'Cappuccino',
                        price: 120,
                        quantity: 1,
                      ),
                      SizedBox(height: 16),
                      CartSummary(
                        subtotal: 120,
                        itemCount: 1,
                        fees: 0,
                        total: 120,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
