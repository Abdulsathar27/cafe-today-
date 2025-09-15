import 'package:cafebooking/models/menu_item.dart';

class MenuHelper {
  static const tabs = ["All", "Coffee", "Tea", "Others"];

  static String detectCategory(MenuItem item) {
    try {
      final dyn = item as dynamic;
      final cat = dyn.category;
      if (cat is String && cat.isNotEmpty) return cat;
    } catch (_) {}

    final combined = '${item.title} ${item.description}'.toLowerCase();
    if (combined.contains('coffee')) return 'Coffee';
    if (combined.contains('tea')) return 'Tea';
    return 'Others';
  }

  static List<MenuItem> filterByTab(List<MenuItem> items, int selectedIndex) {
    if (selectedIndex == 0) return items; 
    final wanted = tabs[selectedIndex].toLowerCase();
    return items.where((it) => detectCategory(it).toLowerCase() == wanted).toList();
  }
}
