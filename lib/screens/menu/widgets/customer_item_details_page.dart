import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:cafebooking/models/menu_item.dart';
import 'package:cafebooking/models/cart_item.dart';
import 'package:cafebooking/constants/app_colors.dart';

class CustomerItemDetailsPage extends StatelessWidget {
  final MenuItem item;

  const CustomerItemDetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    final imageUrl = item.imageUrl ?? "";

    if (imageUrl.isEmpty) {
      imageProvider = const AssetImage("assets/Images/Cafe.png");
    } else if (imageUrl.startsWith("/")) {
      imageProvider = FileImage(File(imageUrl));
    } else if (imageUrl.startsWith("assets/")) {
      imageProvider = AssetImage(imageUrl);
    } else {
      imageProvider = NetworkImage(imageUrl);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: imageProvider,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              item.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "₹${item.price}",
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              item.description?.isNotEmpty == true
                  ? item.description!
                  : "No description available",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Chip(
              label: Text(item.category),
              backgroundColor: AppColors.secondary.withOpacity(0.2),
            ),
            const SizedBox(height: 30),

           
            ElevatedButton.icon(
              onPressed: () {
                final cartBox = Hive.box<CartItem>('cartBox');
                cartBox.add(CartItem(menuItem: item, quantity: 1, customerUsername: ''));

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.buttonPrimary,
                    behavior: SnackBarBehavior.floating,
                    margin: const EdgeInsets.only(
                      bottom: 80,
                      left: 16,
                      right: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    content: Text(
                      "${item.title} added to cart",
                      style: const TextStyle(
                        color: Colors.white,
                      ), 
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
              label: const Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
