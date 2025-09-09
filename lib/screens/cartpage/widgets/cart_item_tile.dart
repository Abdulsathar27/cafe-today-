import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/models/cart_item.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onRemove;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItemTile({
    super.key,
    required this.cartItem,
    required this.onRemove,
    required this.onIncrease,
    required this.onDecrease,
  });

  Future<void> _confirmDelete(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Remove Item"),
        content: Text("Are you sure you want to remove ${cartItem.menuItem.title}?"),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.badgeText,
              foregroundColor: AppColors.textWhite,
            ),
            onPressed: () => Navigator.pop(ctx, false), // No
            child: const Text("No"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.logoutColor,
              foregroundColor: AppColors.textWhite
            ),
            onPressed: () => Navigator.pop(ctx, true), // Yes
            child: const Text("Yes"),
          ),
        ],
      ),
    );

    if (result == true) {
      onRemove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Image.asset(
          cartItem.menuItem.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(cartItem.menuItem.title),
        subtitle: Text("₹${cartItem.menuItem.price} x ${cartItem.quantity}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: onDecrease,
            ),
            Text(cartItem.quantity.toString()),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: onIncrease,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _confirmDelete(context), 
            ),
          ],
        ),
      ),
    );
  }
}
