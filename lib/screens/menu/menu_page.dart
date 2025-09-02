import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafebooking/models/menu_item.dart';
import 'package:cafebooking/screens/menu/widgets/menu_app_bar.dart';
import 'package:cafebooking/screens/menu/widgets/menu_header.dart';
import 'package:cafebooking/screens/menu/widgets/menu_tabs.dart';
import 'package:cafebooking/screens/menu/widgets/menu_grid.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final menuBox = Hive.box<MenuItem>('menuBox');

    // ✅ preload sample data if empty
    if (menuBox.isEmpty) {
      menuBox.addAll([
        MenuItem(
          id: "1",
          title: "Cappuccino",
          description: "Rich espresso with steamed milk foam",
          imageUrl: "assets/Images/Cappuccino.png",
          price: 120,
        ),
        MenuItem(
          id: "2",
          title: "Green Tea",
          description: "Refreshing organic green tea",
          imageUrl: "assets/Images/green tea.png",
          price: 60,
        ),
        MenuItem(
          id: "3",
          title: "Latte",
          description: "Smooth blend of coffee and milk",
          imageUrl: "assets/Images/latte.png",
          price: 150,
        ),
      ]);
    }

    return Scaffold(
      appBar: const MenuAppBar(),
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: Column(
          children: [
            const MenuHeader(userName:""),
            MenuTabs(
              selectedIndex: _selectedIndex,
              onChanged: (int value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: menuBox.listenable(),
                builder: (context, Box<MenuItem> box, _) {
                  final items = box.values.whereType<MenuItem>().toList();

                  if (items.isEmpty) {
                    return const Center(child: Text("No menu items available"));
                  }

                  return MenuGrid(menuItems: items);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
