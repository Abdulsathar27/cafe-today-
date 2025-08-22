import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_sizes.dart';
import 'package:cafebooking/screens/loginpage/widgets/login_widgets/emailfield.dart';
import 'package:cafebooking/screens/loginpage/widgets/login_widgets/passwordfield.dart';
import 'package:cafebooking/screens/loginpage/widgets/login_widgets/quickloginsection.dart';
import 'package:cafebooking/screens/loginpage/widgets/login_widgets/sign_in_button.dart';
import 'package:cafebooking/screens/loginpage/widgets/login_widgets/signuplink.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:AppColors.textWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color:AppColors.textPrimary,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            "Sign In",
            style: TextStyle(fontSize: AppSizes.textXL, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          EmailField(),
          SizedBox(height: 16),
          PasswordField(),
          SizedBox(height: 20),
          SignInButton(),
          SizedBox(height: 12),
          SignUpLink(),
          SizedBox(height: 16),
          Divider(),
          SizedBox(height: 8),
          QuickLoginSection(),
        ],
      ),
    );
  }
}
