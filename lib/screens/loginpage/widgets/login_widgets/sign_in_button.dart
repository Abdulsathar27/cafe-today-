// lib/screens/loginpage/widgets/login_widgets/sign_in_button.dart
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
    required this.passwordController, required void Function() onPressed,
  });

  void _showSnackBar(BuildContext ctx, String message, {bool isError = false}) {
    ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        backgroundColor: isError ? AppColors.buttonPrimary : AppColors.buttonPrimary,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Text(message, style: const TextStyle(color: AppColors.textWhite)),
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Validation snackbars (preserves your requested messages)
    if (email.isEmpty && password.isEmpty) {
      _showSnackBar(context, "Please enter email and password", isError: true);
      return;
    }
    if (email.isEmpty) {
      _showSnackBar(context, "Please enter your email", isError: true);
      return;
    }
    if (password.isEmpty) {
      _showSnackBar(context, "Please enter your password", isError: true);
      return;
    }

    try {
      final success = await AuthService.login(email, password);

      if (success) {
        
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const MenuPage()),
          (route) => false,
        );
      } else {
        _showSnackBar(context, "Invalid email or password. Please try again!", isError: true);
      }
    } catch (e) {
      
      _showSnackBar(context, "Something went wrong. Please try again.", isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          foregroundColor: AppColors.textWhite,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        ),
        onPressed: () => _handleLogin(context),
        child: const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
