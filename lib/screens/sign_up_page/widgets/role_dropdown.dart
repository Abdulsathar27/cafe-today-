import 'package:cafebooking/constants/app_texts.dart';
import 'package:flutter/material.dart';

class RoleDropdown extends StatefulWidget {
  const RoleDropdown({super.key});

  @override
  State<RoleDropdown> createState() => _RoleDropdownState();
}

class _RoleDropdownState extends State<RoleDropdown> {
  String selectedRole = AppTexts.customer1;
  final List<String> roles = [AppTexts.customer1, AppTexts.staff, AppTexts.admin];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedRole,
      items: roles.map((role) {
        return DropdownMenuItem(
          value: role,
          child: Text(role),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedRole = value!;
        });
      },
      decoration: InputDecoration(
        labelText: AppTexts.role,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
