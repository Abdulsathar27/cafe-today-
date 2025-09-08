import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/services/auth_service.dart';

class CreateAccountButton extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? role;

  const CreateAccountButton({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
    this.role,
  });

  Future<void> _handleRegister(BuildContext context) async {
    await AuthService.register(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.buttonPrimary,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        content: const Text("Registration successful! Please login.")
      
      
      ),
    );

    Navigator.pop(context); 
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary, 
        foregroundColor: AppColors.textWhite, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      ),
      onPressed: () => _handleRegister(context),
      child: const Text("Create Account",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
