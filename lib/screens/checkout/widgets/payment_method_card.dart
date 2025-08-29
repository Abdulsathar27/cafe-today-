import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_colors.dart';

class PaymentMethodCard extends StatefulWidget {
  const PaymentMethodCard({super.key});

  @override
  State<PaymentMethodCard> createState() => _PaymentMethodCardState();
}

class _PaymentMethodCardState extends State<PaymentMethodCard> {
  int _selected = 0; // 0=UPI, 1=Card, 2=COD

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
          const Text(
            'Payment Method',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),

          // UPI
          _PaymentTile(
            index: 0,
            selected: _selected == 0,
            onSelect: () => setState(() => _selected = 0),
            leadingIcon: Icons.account_balance_wallet_outlined,
            title: 'UPI Payment',
            subtitle: 'GooglePay, PhonePe, Paytm',
            badgeText: 'Instant',
            // orange-ish chip to mimic screenshot using primary
            badgeBg: AppColors.primary,
            badgeFg: AppColors.buttonText,
          ),
          const SizedBox(height: 10),

          // Card
          _PaymentTile(
            index: 1,
            selected: _selected == 1,
            onSelect: () => setState(() => _selected = 1),
            leadingIcon: Icons.credit_card,
            title: 'Card Payment',
            subtitle: 'Credit/Debit Cards',
            // purple-like: use accent for bg with white text (stays in palette)
            badgeText: 'Secure',
            badgeBg: AppColors.accent,
            badgeFg: AppColors.textWhite,
          ),
          const SizedBox(height: 10),

          // COD
          _PaymentTile(
            index: 2,
            selected: _selected == 2,
            onSelect: () => setState(() => _selected = 2),
            leadingIcon: Icons.currency_rupee,
            title: 'Cash on Delivery',
            subtitle: 'Pay when order arrives',
            // green-like: use existing badge colors
            badgeText: 'COD',
            badgeBg: AppColors.badgeBg,
            badgeFg: AppColors.badgeText,
          ),

          const SizedBox(height: 14),
          const _OrderPolicyNote(),
        ],
      ),
    );
  }
}

class _PaymentTile extends StatelessWidget {
  final int index;
  final bool selected;
  final VoidCallback onSelect;
  final IconData leadingIcon;
  final String title;
  final String subtitle;
  final String badgeText;
  final Color badgeBg;
  final Color badgeFg;

  const _PaymentTile({
    required this.index,
    required this.selected,
    required this.onSelect,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    required this.badgeText,
    required this.badgeBg,
    required this.badgeFg,
  });

  @override
  Widget build(BuildContext context) {
    final tileBorder = selected ? AppColors.primary : AppColors.cardBorder;
    final radioActive = AppColors.primary;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: tileBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onSelect,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio<int>(
              value: index,
              groupValue: selected ? index : null,
              onChanged: (_) => onSelect(),
              activeColor: radioActive,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            // Icon chip
            Container(
              width: 40,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.inputFill,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.cardBorder),
              ),
              alignment: Alignment.center,
              child: Icon(leadingIcon, size: 18, color: AppColors.accent),
            ),
            const SizedBox(width: 10),
            // Texts
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: badgeBg,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: Text(
                badgeText,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: badgeFg,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderPolicyNote extends StatelessWidget {
  const _OrderPolicyNote();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundLight, // soft panel
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.cardBorder),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.error_outline, color: AppColors.primary, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Order Policy:\n',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        'By placing this order, you agree to our terms & conditions. '
                        'Orders cannot be cancelled once confirmed. Estimated '
                        'delivery time may vary based on location.',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
