import 'package:cafebooking/screens/cartpage/cart_page.dart';
import 'package:cafebooking/screens/profile/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafebooking/models/menu_item.dart';
import 'package:cafebooking/models/cart_item.dart';
import 'package:cafebooking/constants/app_colors.dart';

import 'package:cafebooking/screens/menu/widgets/menu_item_card.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final menuBox = Hive.box<MenuItem>('menuBox');

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Menu"),
          backgroundColor: AppColors.primary,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Food"),
              Tab(text: "Beverages"),
            ],
          ),
          actions: [
            // ✅ Profile Icon only
            IconButton(
              icon: const Icon(Icons.person,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfilePage()),
                );
                
              },
            ),

            // ✅ Cart Icon
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartPage()),
                );
              },
            ),
          ],
        ),
        backgroundColor: AppColors.backgroundLight ?? const Color(0xFFF5F5F5),

        body: ValueListenableBuilder(
          valueListenable: menuBox.listenable(),
          builder: (context, Box<MenuItem> box, _) {
            if (box.isEmpty) {
              return const Center(child: Text("No items available"));
            }

            final allItems = box.values.toList();

            final foodItems =
                allItems.where((item) => item.category == "Food").toList();
            final beverageItems =
                allItems.where((item) => item.category == "Beverage").toList();

            return TabBarView(
              children: [
                _buildGrid(foodItems),
                _buildGrid(beverageItems),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildGrid(List<MenuItem> items) {
    if (items.isEmpty) {
      return const Center(child: Text("No items in this category"));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final menuItem = items[index];
        return MenuItemCard(
          menuItem: menuItem,
          onAddToCart: () {
            final cartBox = Hive.box<CartItem>('cartBox');
            cartBox.add(CartItem(menuItem: menuItem, quantity: 1));

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("${menuItem.title} added to cart")),
            );
          },
        );
      },
    );
  }
}
