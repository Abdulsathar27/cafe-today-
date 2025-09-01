import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FullNameField extends StatelessWidget {
  final TextEditingController controller;

  const FullNameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: "Full Name",
        prefixIcon: const Icon(Icons.person),
         border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // rounded corners
        ),
       
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.backgroundDark, width: 2), // active border
        ),
      ),
    );
  }
}
