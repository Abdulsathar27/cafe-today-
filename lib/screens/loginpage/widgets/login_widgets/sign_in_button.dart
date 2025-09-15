import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/services/profile_service.dart';
import 'package:cafebooking/screens/menu/menu_page.dart';
import 'package:cafebooking/screens/dashboard/dashboard_pages.dart';

class SignInButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  Future<void> _handleLogin(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty && password.isEmpty) {
      _showSnack(context, "Please enter your email and password.");
      return;
    } else if (email.isEmpty) {
      _showSnack(context, "Please enter your email.");
      return;
    } else if (password.isEmpty) {
      _showSnack(context, "Please enter your password.");
      return;
    }

    final user = await ProfileService.readCombinedUser();

    if (user == null) {
      _showSnack(context, "No account found. Please sign up first.");
      return;
    }

    final savedEmail = user['email'] ?? '';
    final savedPassword = user['password'] ?? '';
    final role = (user['role'] ?? 'customer').toLowerCase();

    if (email == savedEmail && password == savedPassword) {
      if (!context.mounted) return;
      if (role == "admin") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const DashboardPage()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const MenuPage()),
          (route) => false, 
        );
      }
    } else {
      _showSnack(context, "Invalid credentials");
    }
  }

  void _showSnack(BuildContext context, String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.buttonPrimary,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 80, left: 16, right: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _handleLogin(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonPrimary,
        foregroundColor: AppColors.textWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 46),
      ),
      child: const Text("Sign In"),
    );
  }
}
