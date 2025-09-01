import 'package:flutter/material.dart';
import 'full_name_field.dart';
import 'package:cafebooking/screens/loginpage/widgets/login_widgets/emailfield.dart';
import 'package:cafebooking/screens/loginpage/widgets/login_widgets/passwordfield.dart';
import 'create_account_button.dart';
import 'role_dropdown.dart';
import 'sign_in_link.dart';

class SignUpCard extends StatefulWidget {
  const SignUpCard({super.key});

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _selectedRole; // if you want to save role also

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FullNameField(controller: _fullNameController),
            const SizedBox(height: 12),
            EmailField(controller: _emailController),
            const SizedBox(height: 12),
            PasswordField(controller: _passwordController),
            const SizedBox(height: 12),
            RoleDropdown(onChanged: (role) => setState(() => _selectedRole = role)),
            const SizedBox(height: 20),
            CreateAccountButton(
              fullNameController: _fullNameController,
              emailController: _emailController,
              passwordController: _passwordController,
              role: _selectedRole,
            ),
            const SizedBox(height: 12),
            const SignInLink(),
          ],
        ),
      ),
    );
  }
}
