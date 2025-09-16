import 'dart:io';
import 'package:cafebooking/screens/dashboard/add_items/edit_items_page.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/models/menu_item.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/dashboard/widgets/app_drawer.dart';
import 'package:cafebooking/screens/dashboard/dashboard_pages.dart';
import 'package:hive/hive.dart';

class ItemDetailsPage extends StatelessWidget {
  final MenuItem item;
  final String adminName;
  final String adminEmail;
  final String? profileImage;

  const ItemDetailsPage({
    super.key,
    required this.item,
    this.adminName = " ",
    this.adminEmail = " ",
    this.profileImage,
  });


  Future<void> _deleteItem(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Delete Item"),
        content: const Text("Are you sure you want to delete this item?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text("No")),
          TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text("Yes")),
        ],
      ),
    );

    if (confirm == true) {
      final box = Hive.box<MenuItem>('menuBox');

      final key = box.keys.firstWhere(
        (k) => box.get(k)?.id == item.id,
        orElse: () => null,
      );

      if (key != null) {
        await box.delete(key);

        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const DashboardPage()),
            (route) => false,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Item deleted successfully")),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    final imageUrl = item.imageUrl ?? "";

    if (imageUrl.isEmpty) {
      imageProvider = const AssetImage("assets/Images/Cafe.png");
    } else if (imageUrl.startsWith("/")) {
      imageProvider = FileImage(File(imageUrl));
    } else if (imageUrl.startsWith("assets/")) {
      imageProvider = AssetImage(imageUrl);
    } else {
      imageProvider = NetworkImage(imageUrl);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: AppColors.primary,
        actions: [
       
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            tooltip: "Edit Item",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditItemPage(existingItem: item),
                ),
              );
            },
          ),

          
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            tooltip: "Delete Item",
            onPressed: () => _deleteItem(context),
          ),
        ],
      ),
      drawer: AppDrawer(
        profileImage: profileImage,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(image: imageProvider, height: 220, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(item.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("₹${item.price}",
                style: const TextStyle(
                    fontSize: 20, color: AppColors.primary)),
            const SizedBox(height: 12),
            Text(item.description?.isNotEmpty == true
                ? item.description!
                : "No description available"),
            const SizedBox(height: 16),
            Chip(
              label: Text(item.category),
              backgroundColor: AppColors.secondary.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }
}
