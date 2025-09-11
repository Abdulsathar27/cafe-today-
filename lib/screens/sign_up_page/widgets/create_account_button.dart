import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/services/profile_service.dart';
import 'package:cafebooking/screens/loginpage/login.dart';

class CreateAccountButton extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final String selectedRole;

  const CreateAccountButton({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.selectedRole,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final name = fullNameController.text.trim();
        final email = emailController.text.trim();
        final phone = phoneController.text.trim();
        final password = passwordController.text.trim();
        final role = selectedRole;

        if (name.isEmpty || email.isEmpty || password.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
               backgroundColor: AppColors.buttonPrimary,
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.only(bottom: 80, left: 16, right: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
              content: const Text("Please fill all fields")),
          );
          return;
        }

        // ✅ Save user profile in Hive
        await ProfileService.saveUser(
          name: name,
          email: email,
          phone: phone,
          password: password,
          role: role,
        );

        if (!context.mounted) return;

        // ✅ Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
             backgroundColor: AppColors.buttonPrimary,
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.only(bottom: 80, left: 16, right: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
            content: const Text("Account created successfully! Please login."),
          ),
        );

        // ✅ Navigate to Login Page (not Menu/Home directly)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const CafeLoginPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonPrimary,
        foregroundColor: AppColors.textWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
      ),
      child: const Text("Create Account"),
    );
  }
}
