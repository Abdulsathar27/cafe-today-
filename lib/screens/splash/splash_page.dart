import 'dart:async';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'widgets/splash_background.dart';
import 'widgets/splash_logo.dart';

class SplashPage extends StatefulWidget {
  final Widget nextPage;
  final Duration duration;

  const SplashPage({
    super.key,
    required this.nextPage,
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
    _timer = Timer(widget.duration, () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => widget.nextPage),
      );
    });
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
          children: [
            SplashBackground(),    
            Center(child: SplashLogo()), 
          ],
        ),
      ),
    );
  }
}
