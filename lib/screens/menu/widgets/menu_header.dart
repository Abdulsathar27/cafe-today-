import 'package:cafebooking/constants/app_sizes.dart';
import 'package:cafebooking/constants/app_texts.dart';
import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  final String userName;
  const MenuHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "${AppTexts.welcomeUser}, $userName 👋",
          style: const TextStyle(fontSize:AppSizes.textXL, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
