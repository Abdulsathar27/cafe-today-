import 'dart:io';
import 'package:cafebooking/screens/dashboard/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/models/menu_item.dart';
import 'package:cafebooking/constants/app_colors.dart';

class ItemDetailsPage extends StatelessWidget {
  final MenuItem item;
  const ItemDetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    final imageUrl = item.imageUrl ?? "";

    if (imageUrl.isEmpty) {
      // ✅ fallback asset
      imageProvider = const AssetImage("assets/Images/Cafe.png");
    } else if (imageUrl.startsWith("/")) {
      // ✅ local file path
      imageProvider = FileImage(File(imageUrl));
    } else if (imageUrl.startsWith("assets/")) {
      // ✅ asset inside project
      imageProvider = AssetImage(imageUrl);
    } else {
      // ✅ assume network
      imageProvider = NetworkImage(imageUrl);
    }

    return Scaffold(
      appBar: AppBar(title: Text(item.title), backgroundColor: AppColors.primary),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(image: imageProvider, height: 220, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(item.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("₹${item.price}", style: const TextStyle(fontSize: 20, color: AppColors.primary)),
            const SizedBox(height: 12),
            Text(item.description?.isNotEmpty == true ? item.description! : "No description available"),
            const SizedBox(height: 16),
            Chip(label: Text(item.category), backgroundColor: AppColors.secondary.withOpacity(0.2)),
          ],
        ),
      ),
    );
  }
}
