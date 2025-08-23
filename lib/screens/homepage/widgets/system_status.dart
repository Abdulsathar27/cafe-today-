import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
class SystemStatus extends StatelessWidget {
  final bool isOnline;
  const SystemStatus({super.key, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.circle,
            size: 10, color: isOnline ? Colors.green : Colors.red),
        const SizedBox(width: 6),
        Text(isOnline ? "System Online" : "System Offline",style: TextStyle(color: AppColors.accent),),
      ],
    );
  }
}
