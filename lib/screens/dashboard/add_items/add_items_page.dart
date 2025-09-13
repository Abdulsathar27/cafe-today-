import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cafebooking/models/menu_item.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'item_details_page.dart';
import 'package:cafebooking/screens/dashboard/widgets/app_drawer.dart';

class AddItemsPage extends StatefulWidget {
  const AddItemsPage({super.key});

  @override
  State<AddItemsPage> createState() => _AddItemsPageState();
}

class _AddItemsPageState extends State<AddItemsPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  String _selectedCategory = "Food";
  File? _selectedImage;

  /// Pick image using File Picker
  Future<void> _pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null && result.files.single.path != null) {
        setState(() => _selectedImage = File(result.files.single.path!));
      }
    } catch (e) {
      debugPrint("❌ File pick error: $e");
      // fallback handled later
    }
  }

  /// Save picked image to local app storage
  Future<String> _saveImageToLocal(File imageFile) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName =
        "${DateTime.now().millisecondsSinceEpoch}_${imageFile.path.split('/').last}";
    final savedImage = File("${appDir.path}/$fileName");

    await imageFile.copy(savedImage.path);
    return savedImage.path;
  }

  /// Save item to Hive
  Future<void> _saveItem() async {
    if (!_formKey.currentState!.validate()) return;

    String imagePath = "assets/Images/Cafe.png"; // ✅ default asset

    if (_selectedImage != null) {
      try {
        imagePath = await _saveImageToLocal(_selectedImage!);
      } catch (e) {
        debugPrint("❌ Failed to save picked image: $e");
        imagePath = "assets/Images/Cafe.png";
      }
    }

    final menuBox = Hive.box<MenuItem>('menuBox');

    final newItem = MenuItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      price: int.parse(_priceController.text.trim()),
      imageUrl: imagePath,
      category: _selectedCategory,
    );

    await menuBox.add(newItem);

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => ItemDetailsPage(item: newItem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
        backgroundColor: AppColors.primary,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Title
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? "Enter item name" : null,
              ),
              const SizedBox(height: 12),

              // Description
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              // Price
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Price (₹)",
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v == null || int.tryParse(v) == null
                    ? "Enter valid price"
                    : null,
              ),
              const SizedBox(height: 12),

              // Image picker row (fixed with Expanded)
              Row(
                children: [
                  _selectedImage == null
                      ? Image.asset(
                          "assets/Images/Cafe.png",
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          _selectedImage!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                  const SizedBox(width: 10),
                  Expanded( // ✅ prevents overflow
                    child: ElevatedButton.icon(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.folder_open),
                      label: const Text("Pick Image"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Category dropdown
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: "Food", child: Text("Food")),
                  DropdownMenuItem(value: "Beverage", child: Text("Beverage")),
                ],
                onChanged: (v) =>
                    setState(() => _selectedCategory = v ?? "Food"),
              ),
              const SizedBox(height: 20),

              // Save button
              ElevatedButton(
                onPressed: _saveItem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: const Text(
                  "Save Item",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
