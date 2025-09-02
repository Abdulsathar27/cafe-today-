import 'package:cafebooking/screens/cartpage/widgets/cart_app_bar.dart';
import 'package:cafebooking/screens/cartpage/widgets/cart_item_tile.dart';
import 'package:cafebooking/screens/cartpage/widgets/cart_summary.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafebooking/models/cart_item.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBox = Hive.box<CartItem>('cartBox');

    return Scaffold(
      appBar: const CartAppBar(),
      body: ValueListenableBuilder(
        valueListenable: cartBox.listenable(),
        builder: (context, Box<CartItem> box, _) {
          final cartItems = box.values.toList();

          if (cartItems.isEmpty) {
            return const Center(child: Text("Your cart is empty 🛒"));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    return CartItemTile(
                      cartItem: cartItem,
                      onRemove: () => box.deleteAt(index),
                      onIncrease: () {
                        box.putAt(
                          index,
                          CartItem(
                            menuItem: cartItem.menuItem,
                            quantity: cartItem.quantity + 1,
                          ),
                        );
                      },
                      onDecrease: () {
                        if (cartItem.quantity > 1) {
                          box.putAt(
                            index,
                            CartItem(
                              menuItem: cartItem.menuItem,
                              quantity: cartItem.quantity - 1,
                            ),
                          );
                        } else {
                          box.deleteAt(index);
                        }
                      },
                    );
                  },
                ),
              ),
              CartSummary(cartItems: cartItems, items: [],),
            ],
          );
        },
      ),
    );
  }
}
