import 'package:cafebooking/constants/app_texts.dart';
import 'package:flutter/material.dart';

class FullNameField extends StatelessWidget {
  const FullNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: AppTexts.fullname,
        hintText: AppTexts.enteryourname,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
