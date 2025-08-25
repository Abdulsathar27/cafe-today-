import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_texts.dart';
import 'section_shell.dart';

class OrderStatsCard extends StatelessWidget {
  const OrderStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      header: Row(
        children: [
          const Icon(Icons.access_time, size: 18),
          const SizedBox(width: 8),
          Text(
            AppTexts.orderStats,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.sectionTitle,
            ),
          ),
        ],
      ),
      body: Row(
        children: const [
          Expanded(
            child: _StatTile(
              value: AppTexts.zero,
              label: AppTexts.orders,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _StatTile(
              value: AppTexts.zeroRupees,
              label: AppTexts.spent,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String value;
  final String label;
  const _StatTile({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        color: AppColors.statTileBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
