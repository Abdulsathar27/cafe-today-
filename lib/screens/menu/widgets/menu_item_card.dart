import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:cafebooking/models/menu_item.dart';
import 'package:cafebooking/models/cart_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;
  const MenuItemCard({super.key, required this.menuItem});

  void _addToCart(BuildContext context) {
    try {
      final cartBox = Hive.box<CartItem>('cartBox');

     
      final existingIndex = cartBox.values.toList().indexWhere(
        (cartItem) => cartItem.menuItem.id == menuItem.id,
      );

      if (existingIndex != -1) {
        
        final existing = cartBox.getAt(existingIndex);
        if (existing != null) {
          cartBox.putAt(
            existingIndex,
            CartItem(
              menuItem: existing.menuItem,
              quantity: existing.quantity + 1,
            ),
          );
        }
      } else {
        
        cartBox.add(CartItem(menuItem: menuItem));
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.buttonPrimary,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          ),
          content: Text("${menuItem.title} added to cart"),
          duration: const Duration(seconds: 1),
        ),
      );
    } catch (e) {
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.buttonPrimary,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          ),
          content: const Text("Something went wrong while adding to cart"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                menuItem.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

         
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              menuItem.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              menuItem.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("₹${menuItem.price}"),
                ElevatedButton(
                  onPressed: () => _addToCart(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Add"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
