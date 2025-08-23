import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  final String userName;
  const MenuHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_back),
          Text(
            "Menu\nHi, $userName!",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: const [
              Icon(Icons.person),
              SizedBox(width: 10),
              Icon(Icons.shopping_cart),
            ],
          ),
        ],
      ),
    );
  }
}
