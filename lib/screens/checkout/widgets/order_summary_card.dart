import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_colors.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

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
          // Header
          Row(
            children: const [
              Icon(Icons.restaurant_menu, size: 18, color: AppColors.accent),
              SizedBox(width: 8),
              Text(
                'Order Summary',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Spacer(),
            ],
          ),
          const SizedBox(height: 12),

          // Items
          const _LineItem(
            title: 'Crispy Spring Rolls',
            note: 'Qty: 1 × ₹180',
            price: 180,
          ),
          const SizedBox(height: 8),
          const _LineItem(
            title: 'Chicken Wings',
            note: 'Qty: 1 × ₹250',
            price: 250,
          ),

          const SizedBox(height: 12),
          const Divider(height: 16),

          // Subtotal / fees / tax
          const _AmountRow(label: 'Subtotal', value: '₹430'),
          const SizedBox(height: 6),
          const _AmountRow(
            label: 'Delivery fee',
            value: 'Free',
            valueColor: AppColors.badgeText, // green-ish from constants
          ),
          const SizedBox(height: 6),

          const SizedBox(height: 8),
          const Divider(height: 16),

          // Total
          Row(
            children: const [
              Expanded(
                child: Text(
                  'Total',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Text(
                '₹473',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.logoutColor, // red-like from constants
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LineItem extends StatelessWidget {
  final String title;
  final String note;
  final int price;

  const _LineItem({
    required this.title,
    required this.note,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                note,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        Text(
          '₹$price',
          style: const TextStyle(
            color: AppColors.logoutColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _AmountRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _AmountRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(label, style: const TextStyle(color: AppColors.textPrimary))),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
