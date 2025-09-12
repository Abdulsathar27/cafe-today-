import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cafebooking/models/menu_item.dart';
import 'package:cafebooking/constants/app_colors.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;
  final VoidCallback onAddToCart;

  const MenuItemCard({
    super.key,
    required this.menuItem,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    if (menuItem.imageUrl.isEmpty) {
      // ✅ No image → show placeholder
      imageProvider = const AssetImage("assets/images/placeholder.png");
    } else if (menuItem.imageUrl.startsWith("/")) {
      // ✅ Local file
      imageProvider = FileImage(File(menuItem.imageUrl));
    } else {
      // ✅ Network image
      imageProvider = NetworkImage(menuItem.imageUrl);
    }

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image(
                image: imageProvider,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Details
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(menuItem.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(
                  menuItem.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹${menuItem.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart,
                          color: AppColors.primary),
                      onPressed: onAddToCart,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
