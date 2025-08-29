import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_colors.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.badgeBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: const [
              Icon(Icons.place, size: 18, color: AppColors.badgeText),
              SizedBox(width: 8),
              Text(
                'Delivery Address',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Full Address',
            style: TextStyle(fontSize: 12, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Enter your complete delivery address with landmark...',
              filled: true,
              fillColor: AppColors.inputFill,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.cardBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
            maxLines: 2,
            minLines: 2,
          ),
          const SizedBox(height: 10),

          // Estimated delivery chip/banner
          Container(
            decoration: BoxDecoration(
              color: AppColors.badgeBg, // light green background from constants
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.cardBorder),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: const [
                Icon(Icons.access_time, size: 18, color: AppColors.badgeText),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Estimated delivery time',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.badgeText,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '25–35 minutes after order confirmation',
                  style: TextStyle(fontSize: 12, color: AppColors.textPrimary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
