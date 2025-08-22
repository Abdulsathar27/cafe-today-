import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/loginpage/widgets/login_widgets/footertext.dart';
import 'package:cafebooking/screens/loginpage/widgets/login_widgets/logincard.dart';
import 'package:cafebooking/screens/loginpage/widgets/login_widgets/loginlogo.dart';
import 'package:flutter/material.dart';

class CafeLoginPage extends StatelessWidget {
  const CafeLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.secondary,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LoginLogo(),
              SizedBox(height: 28),
              LoginCard(),
              SizedBox(height: 20),
              FooterText(),
            ],
          ),
        ),
      ),
    );
  }
}

