import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cafebooking/models/menu_item.dart';
import 'package:cafebooking/models/profile_model.dart';
import 'package:cafebooking/screens/menu/widgets/menu_app_bar.dart';
import 'package:cafebooking/screens/menu/widgets/menu_header.dart';
import 'package:cafebooking/screens/menu/widgets/menu_tabs.dart';
import 'package:cafebooking/screens/menu/widgets/menu_grid.dart';
import 'package:cafebooking/screens/menu/widgets/menu_seeder.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;
  String _userName = '';

  final List<String> _tabs = ["All", "Coffee", "Tea", "Others"];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        if (!Hive.isBoxOpen('menuBox')) {
          Hive.openBox<MenuItem>('menuBox').then((_) => MenuSeeder.seedMenu());
        } else {
          MenuSeeder.seedMenu();
        }
      } catch (_) {
       
      }
    });
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    String name = '';

    try {
      if (Hive.isBoxOpen('profileBox')) {
        final box = Hive.box<Profile>('profileBox');
        if (box.isNotEmpty) {
          final p = box.values.first;
          try {
            final dyn = p as dynamic;
            final n = dyn.name;
            if (n is String && n.isNotEmpty) name = n;
          } catch (_) {}
        }
      }
    } catch (_) {}

    if (name.isEmpty) {
      try {
        if (Hive.isBoxOpen('userBox')) {
          final u = Hive.box('userBox');
          final n = u.get('name') ?? '';
          if (n is String && n.isNotEmpty) name = n;
        }
      } catch (_) {}
    }

    if (name.isEmpty) {
      try {
        final sp = await SharedPreferences.getInstance();
        final n = sp.getString('name') ?? '';
        if (n.isNotEmpty) name = n;
      } catch (_) {}
    }

    if (mounted) {
      setState(() {
        _userName = name;
      });
    }
  }
  String _detectCategory(MenuItem item) {
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

  List<MenuItem> _filterByTab(List<MenuItem> items) {
    if (_selectedIndex == 0) return items; 
    final wanted = _tabs[_selectedIndex].toLowerCase();
    return items.where((it) => _detectCategory(it).toLowerCase() == wanted).toList();
  }

  @override
  Widget build(BuildContext context) {
    final menuBoxOpen = Hive.isBoxOpen('menuBox');
    final Box<MenuItem>? menuBox = menuBoxOpen ? Hive.box<MenuItem>('menuBox') : null;

    return Scaffold(
      appBar: const MenuAppBar(),
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: Column(
          children: [
            MenuHeader(userName: _userName),
            MenuTabs(
              selectedIndex: _selectedIndex,
              onChanged: (int value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
            ),
            Expanded(
              child: menuBox == null
                  ? const Center(child: CircularProgressIndicator())
                  : ValueListenableBuilder(
                      valueListenable: menuBox.listenable(),
                      builder: (context, Box<MenuItem> box, _) {
                        final items = box.values.whereType<MenuItem>().toList();
                        final filtered = _filterByTab(items);

                        if (filtered.isEmpty) {
                          return Center(
                            child: Text(
                              "No items in ${_tabs[_selectedIndex]}",
                              style: const TextStyle(color: Colors.grey),
                            ),
                          );
                        }
                        return MenuGrid(menuItems: filtered);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
