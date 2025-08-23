import 'package:flutter/material.dart';

class MenuTabs extends StatelessWidget {
  const MenuTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.coffee, size: 30),
          Icon(Icons.fastfood, size: 30),
          Icon(Icons.cake, size: 30),
        ],
      ),
    );
  }
}
