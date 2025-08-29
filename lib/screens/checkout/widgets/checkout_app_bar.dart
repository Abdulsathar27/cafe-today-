import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_colors.dart';

class CheckoutAppBar extends StatelessWidget {
  const CheckoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 8),
      child: Column(
        children: const [
          _TopRow(),
          SizedBox(height: 2),
          Text(
            'Complete your order',
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _TopRow extends StatelessWidget {
  const _TopRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _BackBtn(),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            'Checkout',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        SizedBox(width: 48), // balance the back button width for visual center
      ],
    );
  }
}

class _BackBtn extends StatelessWidget {
  const _BackBtn();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      splashRadius: 22,
      onPressed: () => Navigator.maybePop(context),
    );
  }
}
