import 'package:cafebooking/screens/menupage/widgets/menuheader.dart';
import 'package:cafebooking/screens/menupage/widgets/menutabs.dart';
import 'package:flutter/material.dart';
import 'menuitemcard.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final items = const [
      {
        "imageUrl": "assets/Images/Cappuccino.png",
        "title": "Cappuccino",
        "description": "Rich espresso with steamed milk foam",
        "price": 120,
      },
      {
        "imageUrl": "assets/Images/greentea.png",
        "title": "Green Tea",
        "description": "Refreshing organic green tea",
        "price": 60,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: Column(
          children: [
            const MenuHeader(userName: "John"),
            const MenuTabs(),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final w = constraints.maxWidth;
                  final crossAxisCount = w >= 1200 ? 5 : w >= 900 ? 4 : w >= 600 ? 3 : 2;

                  // Slightly taller tiles keep content comfy; tweak if needed.
                  const childAspectRatio = 0.72;

                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemCount: items.length,
                    itemBuilder: (_, i) {
                      final it = items[i];
                      return MenuItemCard(
                        imageUrl: it["imageUrl"] as String,
                        title: it["title"] as String,
                        description: it["description"] as String,
                        price: it["price"] as int,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
