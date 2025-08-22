import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_sizes.dart';
import 'package:cafebooking/screens/loginpage/widgets/login_widgets/footertext.dart';
import 'package:cafebooking/screens/loginpage/widgets/login_widgets/loginlogo.dart';
import 'package:cafebooking/screens/sign_up_page/widgets/sign_up_card.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.p24, vertical: AppSizes.p32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LoginLogo(),
              SizedBox(height: AppSizes.p24),
              SignUpCard(),
              SizedBox(height: AppSizes.p20),
              FooterText(),
            ],
          ),
        ),
      ),
    );
  }
}
