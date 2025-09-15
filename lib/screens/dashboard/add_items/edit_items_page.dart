import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cafebooking/models/menu_item.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/dashboard/add_items/item_details_page.dart';
import 'package:cafebooking/screens/dashboard/widgets/app_drawer.dart';

class EditItemPage extends StatefulWidget {
  final MenuItem existingItem;

  const EditItemPage({super.key, required this.existingItem});

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late String _selectedCategory;
  File? _selectedImage;
  String? _savedImagePath;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.existingItem.title);
    _descriptionController =
        TextEditingController(text: widget.existingItem.description ?? "");
    _priceController =
        TextEditingController(text: widget.existingItem.price.toString());
    _selectedCategory = widget.existingItem.category;
    _savedImagePath = widget.existingItem.imageUrl;
  }


  Future<void> _pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      if (result != null && result.files.single.path != null) {
        setState(() => _selectedImage = File(result.files.single.path!));
      }
    } catch (e) {
      debugPrint(" File pick error: $e");
    }
  }

  
  Future<String> _saveImageToLocal(File imageFile) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName =
        "${DateTime.now().millisecondsSinceEpoch}_${imageFile.path.split('/').last}";
    final savedImage = File("${appDir.path}/$fileName");

    await imageFile.copy(savedImage.path);
    return savedImage.path;
  }

 
  Future<void> _updateItem() async {
    if (!_formKey.currentState!.validate()) return;

    String imagePath = _savedImagePath ?? "assets/Images/Cafe.png";

    if (_selectedImage != null) {
      try {
        imagePath = await _saveImageToLocal(_selectedImage!);
      } catch (e) {
        debugPrint(" Failed to save picked image: $e");
      }
    }

    final menuBox = Hive.box<MenuItem>('menuBox');

    final updatedItem = MenuItem(
      id: widget.existingItem.id,
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      price: int.parse(_priceController.text.trim()),
      imageUrl: imagePath,
      category: _selectedCategory,
    );

    final key = menuBox.keys.firstWhere(
      (k) => menuBox.get(k)?.id == widget.existingItem.id,
      orElse: () => null,
    );

    if (key != null) {
      await menuBox.put(key, updatedItem);
    }

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => ItemDetailsPage(item: updatedItem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Item"),
        backgroundColor: AppColors.primary,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              
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

              
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

             
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

              
              Row(
                children: [
                  if (_selectedImage != null)
                    Image.file(_selectedImage!,
                        width: 80, height: 80, fit: BoxFit.cover)
                  else if (_savedImagePath != null &&
                      _savedImagePath!.startsWith("/"))
                    Image.file(File(_savedImagePath!),
                        width: 80, height: 80, fit: BoxFit.cover)
                  else if (_savedImagePath != null &&
                      _savedImagePath!.startsWith("assets/"))
                    Image.asset(_savedImagePath!,
                        width: 80, height: 80, fit: BoxFit.cover)
                  else
                    Image.asset("assets/Images/Cafe.png",
                        width: 80, height: 80, fit: BoxFit.cover),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.folder_open),
                      label: const Text("Change Image"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              
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

              
              ElevatedButton(
                onPressed: _updateItem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: const Text(
                  "Update Item",
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
