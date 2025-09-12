import 'package:flutter/material.dart';
import 'recent_item_card.dart';

class RecentItemsList extends StatelessWidget {
  const RecentItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {"name": "Classic Latte", "category": "Coffee", "price": "\$4.50"},
      {"name": "Fresh Croissant", "category": "Pastry", "price": "\$3.25"},
      {"name": "Club Sandwich", "category": "Food", "price": "\$8.75"},
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Recent Items",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text("Recently added menu items"),
            const SizedBox(height: 12),
            ...items.map((item) => RecentItemCard(
                  name: item["name"]!,
                  category: item["category"]!,
                  price: item["price"]!,
                )),
          ],
        ),
      ),
    );
  }
}
