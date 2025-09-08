import 'package:cafebooking/screens/orders/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/models/cart_item.dart';
import 'package:cafebooking/models/order_item.dart';
import 'package:cafebooking/models/order_model.dart';

class CheckoutBottomBar extends StatelessWidget {
  const CheckoutBottomBar({super.key});

  Future<void> _placeOrder(BuildContext context, Box<CartItem> cartBox) async {
    try {
      // build order items
      final items = <OrderItem>[];
      int total = 0;

      for (final cartItem in cartBox.values) {
        final menu = cartItem.menuItem;
        final qty = cartItem.quantity;
        final price = menu.price;

        total += price * qty;

        items.add(OrderItem(
          title: menu.title,
          price: price,
          quantity: qty,
          imageUrl: menu.imageUrl,
        ));
      }

      // open ordersBox if not already
      if (!Hive.isBoxOpen('ordersBox')) {
        await Hive.openBox<Order>('ordersBox');
      }
      final ordersBox = Hive.box<Order>('ordersBox');

      // create order
      final order = Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        items: items,
        total: total,
        date: DateTime.now(),
        status: 'Placed',
      );

      await ordersBox.add(order);

      // clear cart
      await cartBox.clear();

      // success feedback
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.buttonPrimary,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: const Text("Order placed successfully 🎉"),
        ),
      );

      // navigate to orders page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const OrdersPage()),
        (route) => false,
      );
    } catch (e, st) {
      debugPrint('Order save failed: $e\n$st');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.buttonPrimary,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: const Text("Something went wrong"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: ValueListenableBuilder(
        valueListenable: Hive.box<CartItem>('cartBox').listenable(),
        builder: (context, Box<CartItem> cartBox, _) {
          int total = 0;
          for (var cartItem in cartBox.values) {
            total += cartItem.menuItem.price * cartItem.quantity;
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹$total",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                onPressed: () async {
                  if (cartBox.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.buttonPrimary,
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        content: const Text("Your cart is empty"),
                      ),
                    );
                    return;
                  }
                  await _placeOrder(context, cartBox);
                },
                child: const Text(
                  "Place Order",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
