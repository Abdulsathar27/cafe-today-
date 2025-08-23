import 'package:cafebooking/screens/homepage/widgets/browse_menu_button.dart';
import 'package:cafebooking/screens/homepage/widgets/logo_section.dart';
import 'package:cafebooking/screens/homepage/widgets/quick_actions.dart';
import 'package:cafebooking/screens/homepage/widgets/system_status.dart';
import 'package:cafebooking/screens/homepage/widgets/top_bar.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              TopBar(userName: "John", role: "Customer"),
              SizedBox(height: 30),
              LogoSection(),
              SizedBox(height: 20),
              BrowseMenuButton(),
              SizedBox(height: 30),
              QuickActions(),
              SizedBox(height: 20),
              SystemStatus(isOnline: true),
            ],
          ),
        ),
      ),
    );
  }
}
