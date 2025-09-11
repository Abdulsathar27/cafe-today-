import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/loginpage/login.dart';
import 'widgets/splash_background.dart';
import 'widgets/splash_logo.dart';

class SplashPage extends StatefulWidget {
  final Duration duration;

  const SplashPage({
    super.key,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.duration, _navigate);
  }

  Future<void> _navigate() async {
    if (!mounted) return;

    // ✅ Always redirect to login when app restarts
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const CafeLoginPage()),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: const [
            SplashBackground(),
            Center(child: SplashLogo()),
          ],
        ),
      ),
    );
  }
}
