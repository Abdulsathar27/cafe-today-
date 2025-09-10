import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafebooking/models/menu_item.dart';
import 'package:cafebooking/screens/menu/widgets/menu_app_bar.dart';
import 'package:cafebooking/screens/menu/widgets/menu_header.dart';
import 'package:cafebooking/screens/menu/widgets/menu_tabs.dart';
import 'package:cafebooking/screens/menu/widgets/menu_grid.dart';
import 'package:cafebooking/screens/menu/widgets/menu_seeder.dart';
import 'package:cafebooking/services/user_service.dart';
import 'package:cafebooking/services/menu_helper.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;
  String _userName = '';

  @override
  void initState() {
    super.initState();

    // Seed menu items
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!Hive.isBoxOpen('menuBox')) {
        await Hive.openBox<MenuItem>('menuBox');
      }
      MenuSeeder.seedMenu();
    });

    // Load user name
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final name = await UserService.getUserName();
    if (mounted) {
      setState(() => _userName = name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuBoxOpen = Hive.isBoxOpen('menuBox');
    final Box<MenuItem>? menuBox =
        menuBoxOpen ? Hive.box<MenuItem>('menuBox') : null;

    return Scaffold(
      appBar: const MenuAppBar(),
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: Column(
          children: [
            MenuHeader(userName: _userName),
            MenuTabs(
              selectedIndex: _selectedIndex,
              onChanged: (value) => setState(() => _selectedIndex = value),
            ),
            Expanded(
              child: menuBox == null
                  ? const Center(child: CircularProgressIndicator())
                  : ValueListenableBuilder(
                      valueListenable: menuBox.listenable(),
                      builder: (context, Box<MenuItem> box, _) {
                        final items = box.values.whereType<MenuItem>().toList();
                        final filtered =
                            MenuHelper.filterByTab(items, _selectedIndex);

                        if (filtered.isEmpty) {
                          return Center(
                            child: Text(
                              "No items in ${MenuHelper.tabs[_selectedIndex]}",
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
