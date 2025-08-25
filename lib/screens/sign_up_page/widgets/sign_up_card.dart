import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_sizes.dart';
import 'package:cafebooking/constants/app_texts.dart';
import 'package:cafebooking/screens/loginpage/widgets/login_widgets/emailfield.dart';
import 'package:cafebooking/screens/loginpage/widgets/login_widgets/passwordfield.dart';
import 'package:cafebooking/screens/sign_up_page/widgets/create_account_button.dart';
import 'package:cafebooking/screens/sign_up_page/widgets/full_name_field.dart';
import 'package:cafebooking/screens/sign_up_page/widgets/role_dropdown.dart';
import 'package:cafebooking/screens/sign_up_page/widgets/sign_in_link.dart';
import 'package:flutter/material.dart';


class SignUpCard extends StatelessWidget {
  const SignUpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.p24),
      decoration: BoxDecoration(
        color: AppColors.textWhite,
        borderRadius: BorderRadius.circular(AppSizes.r12),
        boxShadow: [
          BoxShadow(
            color: AppColors.borderLight,
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            AppTexts.createaccount,
            style: TextStyle(fontSize: AppSizes.textXL, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSizes.p16),
          FullNameField(),
          SizedBox(height: AppSizes.p16),
          EmailField(),
          SizedBox(height: AppSizes.p16),
          PasswordField(),
          SizedBox(height: AppSizes.p16),
          RoleDropdown(),
          SizedBox(height: AppSizes.p20),
          CreateAccountButton(),
          SizedBox(height: AppSizes.p12),
          SignInLink(),
        ],
      ),
    );
  }
}
