import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'widgets/checkout_app_bar.dart';
import 'widgets/order_summary_card.dart';
import 'widgets/address_card.dart';
import 'widgets/payment_method_card.dart';
import 'widgets/checkout_bottom_bar.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientTop, AppColors.gradientBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Content
              Positioned.fill(
                bottom: 72, // leave space for bottom bar
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                  child: Column(
                    children: const [
                      CheckoutAppBar(),
                      SizedBox(height: 12),
                      OrderSummaryCard(),
                      SizedBox(height: 12),
                      AddressCard(),
                      SizedBox(height: 12),
                      PaymentMethodCard(),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
              // Bottom bar (fixed)
              const Align(
                alignment: Alignment.bottomCenter,
                child: CheckoutBottomBar(
                  amount: 473, // matches screenshot
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
