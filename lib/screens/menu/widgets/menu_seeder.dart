import 'package:cafebooking/models/menu_item.dart';
import 'package:hive/hive.dart';

class MenuSeeder {
  static Future<void> seedMenu() async {
    final menuBox = Hive.box<MenuItem>('menuBox');

    if (menuBox.isEmpty) {
      await menuBox.addAll([
        MenuItem(
          id: "1",
          title: "Cappuccino",
          description: "Rich espresso with steamed milk foam",
          imageUrl: "assets/Images/Cappuccino.png",
          price: 120,
          category: "Coffee",
        ),
        MenuItem(
          id: "2",
          title: "Green Tea",
          description: "Refreshing organic green tea",
          imageUrl: "assets/Images/green tea.png",
          price: 60,
          category: "Tea",
        ),
        MenuItem(
          id: "3",
          title: "Latte",
          description: "Smooth blend of coffee and milk",
          imageUrl: "assets/Images/latte.png",
          price: 150,
          category: "Coffee",
        ),
      ]);
    }
  }
}
