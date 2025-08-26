import 'package:flutter/material.dart';
import 'menu_item_card.dart';

class MenuItemVm {
  final String imageUrl;
  final String title;
  final String description;
  final int price;
  const MenuItemVm({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });
}

class MenuGrid extends StatelessWidget {
  final List<MenuItemVm> items;
  const MenuGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final w = c.maxWidth;
        final cols = w >= 900 ? 3 : w >= 600 ? 2 : 2; // 2 columns on phone
        return GridView.builder(
          padding: const EdgeInsets.only(bottom: 12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.68, // 👈 slightly taller tiles (was ~0.76)
          ),
          itemCount: items.length,
          itemBuilder: (_, i) => MenuItemCard(vm: items[i]),
        );
      },
    );
  }
}
