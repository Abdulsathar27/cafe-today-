import 'package:flutter/material.dart';

class RecentItemCard extends StatelessWidget {
  final String name;
  final String category;
  final String price;

  const RecentItemCard({
    super.key,
    required this.name,
    required this.category,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.fastfood)),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(category),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.red),
            onPressed: () {
              // TODO: delete item
            },
          ),
        ],
      ),
    );
  }
}
