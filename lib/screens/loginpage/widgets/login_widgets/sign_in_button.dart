import 'package:flutter/material.dart';
import 'package:cafebooking/screens/menu/menu_page.dart';
import 'package:cafebooking/services/auth_service.dart';
import 'package:cafebooking/constants/app_colors.dart';

class SignInButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  Future<void> _handleLogin(BuildContext context) async {
    final success = await AuthService.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (success) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const MenuPage()),
        (route) => false,
      );
    } else {
      // 🎨 Creative snackbar with colors + icon
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.buttonPrimary,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Row(
            children: const [
              Icon(Icons.error_outline, color: AppColors.textWhite),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Invalid email or password. Please try again!",
                  style: TextStyle(color: AppColors.textWhite),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary, // button background
        foregroundColor: AppColors.textWhite, // button text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      ),
      onPressed: () => _handleLogin(context),
      child: const Text(
        "Login",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
