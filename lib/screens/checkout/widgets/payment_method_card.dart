import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_colors.dart';

class PaymentMethodCard extends StatefulWidget {
  const PaymentMethodCard({super.key});

  @override
  State<PaymentMethodCard> createState() => _PaymentMethodCardState();
}

class _PaymentMethodCardState extends State<PaymentMethodCard> {
  int? selectedIndex;

  final List<String> methods = [
    "Cash on Delivery",
    "UPI / Wallet",
    "Credit / Debit Card",
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.badgeBg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            
            ...List.generate(methods.length, (index) {
              return ListTile(
                title: Text(methods[index]),
                trailing: Radio<int>(
                  value: index,
                  groupValue: selectedIndex,
                  activeColor: AppColors.primary,
                  onChanged: (val) {
                    setState(() {
                      selectedIndex = val;
                    });
                  },
                ),
              );
            }),

            if (selectedIndex != null) ...[
              const Divider(),
              Text(
                "Selected: ${methods[selectedIndex!]}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.primary),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
