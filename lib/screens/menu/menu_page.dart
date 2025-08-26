import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/menu/widgets/menu_app_bar.dart';
import 'package:cafebooking/screens/menu/widgets/menu_grid.dart';
import 'package:cafebooking/screens/menu/widgets/menu_header.dart';
import 'package:cafebooking/screens/menu/widgets/menu_tabs.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int selectedTab = 0; // 0..n

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientTop, AppColors.gradientBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const MenuAppBar(),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 4, 16, 8),
                child: MenuHeader(userName: 'John!'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                child: MenuTabs(
                  selectedIndex: selectedTab,
                  onChanged: (i) => setState(() => selectedTab = i),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: MenuGrid(
                    // In a real app, filter by selectedTab
                    items: const [
                      MenuItemVm(
                        imageUrl: 'assets/Images/Cappuccino.png',
                        title: 'Cappuccino',
                        description: 'Rich espresso with steamed milk foam',
                        price: 120,
                      ),
                      MenuItemVm(
                        imageUrl: 'assets/Images/green tea.png',
                        title: 'Green Tea',
                        description: 'Refreshing organic green tea',
                        price: 60,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
