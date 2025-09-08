import 'package:flutter/material.dart';
import 'package:cafebooking/models/menu_item.dart';
import 'package:cafebooking/screens/menu/widgets/menu_item_card.dart';

class MenuGrid extends StatelessWidget {
  final List<MenuItem?> menuItems; 
  const MenuGrid({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    
    final validItems = menuItems.whereType<MenuItem>().toList();

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: validItems.length,
      itemBuilder: (context, index) {
        return MenuItemCard(menuItem: validItems[index]);
      },
    );
  }
}
