import 'package:flutter/material.dart';
import 'emailfield.dart';
import 'passwordfield.dart';
import 'sign_in_button.dart';
import 'signuplink.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            EmailField(controller: _emailController),
            const SizedBox(height: 12),
            PasswordField(controller: _passwordController),
            const SizedBox(height: 20),
            SignInButton(
              emailController: _emailController,
              passwordController: _passwordController, onPressed: () {},
            ),
            const SizedBox(height: 12),
            const SignUpLink(),
            const SizedBox(height: 12),
            
          ],
        ),
      ),
    );
  }
}
