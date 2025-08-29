import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/checkout/checkout_page.dart';
import 'package:cafebooking/screens/menu/menu_page.dart';
import 'package:flutter/material.dart';
import 'widgets/orders_tabs.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int selectedIndex = 0; // 0 = Mine, 1 = All

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // same gradient style used elsewhere
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientTop, AppColors.gradientBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // App bar row: back + title
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 6, 8, 8),
                child: Row(
                  children: const [
                    _BackButton(),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Orders',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Segmented tabs (Mine / All)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: OrdersTabs(
                  selectedIndex: selectedIndex,
                  onChanged: (i) => setState(() => selectedIndex = i),
                ),
              ),

              const SizedBox(height: 24),

              // Empty state (centered)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.access_time, // clock
                        size: 56,
                        color: AppColors.textSecondary.withOpacity(0.8),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'No orders yet',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Place your first order',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MenuPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonPrimary,
                          foregroundColor: AppColors.buttonText,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Browse Menu',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CheckoutPage())),
      splashRadius: 22,
    );
  }
}
