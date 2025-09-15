import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/screens/sign_up_page/widgets/create_account_button.dart';
import 'package:cafebooking/screens/sign_up_page/widgets/full_name_field.dart';
import 'package:cafebooking/screens/sign_up_page/widgets/role_dropdown.dart';
import 'package:cafebooking/screens/sign_up_page/widgets/sign_in_link.dart';

class SignUpCard extends StatefulWidget {
  const SignUpCard({super.key});

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController(); 

  String _selectedRole = "customer"; 

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FullNameField(controller: _fullNameController),
            const SizedBox(height: 12),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: AppColors.backgroundDark,
                    width: 2,
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "Phone",
                prefixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: AppColors.backgroundDark,
                    width: 2,
                  ),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: AppColors.backgroundDark,
                    width: 2,
                  ),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 12),
            RoleDropdown(
              onChanged: (role) {
                setState(() {
                  _selectedRole = role ?? "customer";
                });
              },
            ),
            const SizedBox(height: 20),
            CreateAccountButton(
              fullNameController: _fullNameController,
              emailController: _emailController,
              phoneController: _phoneController,
              passwordController: _passwordController, 
              selectedRole: _selectedRole,
            ),
            const SizedBox(height: 12),
            const SignInLink(),
          ],
        ),
      ),
    );
  }
}
