import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imagePath;
  const ProductImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        imagePath,
        height: 250,
        fit: BoxFit.cover,
      ),
    );
  }
}
