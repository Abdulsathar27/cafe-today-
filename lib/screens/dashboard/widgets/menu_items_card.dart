import 'package:flutter/material.dart';

class MenuItemsCard extends StatelessWidget {
  const MenuItemsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const ListTile(
        title: Text("Menu Items", style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("48\n+2 from yesterday"),
      ),
    );
  }
}
