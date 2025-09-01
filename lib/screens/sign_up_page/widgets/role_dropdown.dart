import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RoleDropdown extends StatelessWidget {
  final ValueChanged<String?> onChanged;

  const RoleDropdown({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Role",
        prefixIcon: const Icon(Icons.work),
         border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // rounded corners
        ),
       
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.backgroundDark, width: 2), // active border
        ),
      ),
      items: const [
        DropdownMenuItem(value: "Customer", child: Text("Customer")),
        DropdownMenuItem(value: "Admin", child: Text("Admin")),
      ],
      onChanged: onChanged,
    );
  }
}
