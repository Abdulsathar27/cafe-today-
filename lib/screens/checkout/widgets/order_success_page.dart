// lib/screens/checkout/order_success_page.dart
import 'dart:async';
import 'package:cafebooking/screens/menu/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/orders/orders_page.dart';

class OrderSuccessPage extends StatefulWidget {
  final int? totalAmount;
  final int autoNavigateSeconds;

  const OrderSuccessPage({
    super.key,
    this.totalAmount,
    this.autoNavigateSeconds = 6,
  });

  @override
  State<OrderSuccessPage> createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends State<OrderSuccessPage>
    with TickerProviderStateMixin {
  late final AnimationController _ringController;
  late final AnimationController _checkController;
  late final AnimationController _textController;
  Timer? _autoNavTimer;

  @override
  void initState() {
    super.initState();

    _ringController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _checkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

 
    _playSequence();

    if (widget.autoNavigateSeconds > 0) {
      _autoNavTimer = Timer(
        Duration(seconds: widget.autoNavigateSeconds + 1),
        () {
          _goToOrdersPage();
        },
      );
    }
  }

  Future<void> _playSequence() async {
    try {
      await _ringController.forward();
      await _checkController.forward();
      await _textController.forward();
    } catch (_) {}
  }

  @override
  void dispose() {
    _ringController.dispose();
    _checkController.dispose();
    _textController.dispose();
    _autoNavTimer?.cancel();
    super.dispose();
  }

  void _goToOrdersPage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const OrdersPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 180,
                  height: 180,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _ringController,
                        builder: (context, child) {
                          final v = Curves.easeOut.transform(
                            _ringController.value,
                          );
                          final size = 80.0 + (v * 70.0);
                          final opacity = (1.0 - v).clamp(0.0, 1.0);
                          return Container(
                            width: size,
                            height: size,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary.withOpacity(
                                0.14 * opacity,
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      ScaleTransition(
                        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: _checkController,
                            curve: Curves.elasticOut,
                          ),
                        ),
                        child: FadeTransition(
                          opacity: _checkController,
                          child: Container(
                            width: 86,
                            height: 86,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 48,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: const Offset(0, 0.35),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: _textController,
                          curve: Curves.easeOut,
                        ),
                      ),
                  child: FadeTransition(
                    opacity: _textController,
                    child: Column(
                      children: [
                        const Text(
                          "Order placed!",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Order placed successfully 🎉",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 26),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textWhite,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: _goToOrdersPage,
                      child: const Text(
                        "View My Orders",
                       
                      ),
                    ),

                    const SizedBox(width: 12),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textWhite,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const MenuPage()),
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "Continue shopping",
                       
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
