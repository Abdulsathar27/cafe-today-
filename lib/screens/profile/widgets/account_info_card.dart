import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_texts.dart';
import 'section_shell.dart';

class AccountInfoCard extends StatelessWidget {
  const AccountInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      header: Row(
        children: [
          const Icon(Icons.info_outline, size: AppSizes.iconS),
          const SizedBox(width: 8),
          Text(
            AppTexts.accountInfo,
            style: TextStyle(
              fontSize: AppSizes.textM,
              fontWeight: FontWeight.w600,
              color: AppColors.sectionTitle,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.badgeBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              AppTexts.customer1,
              style: TextStyle(
                fontSize: AppSizes.textS,
                fontWeight: FontWeight.w600,
                color: AppColors.badgeText,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _Label(AppTexts.name),
          _ReadOnlyField(placeholder: AppTexts.namePlaceholder),
          SizedBox(height: 12),
          _Label(AppTexts.email),
          _ReadOnlyField(placeholder: AppTexts.emailPlaceholder),
          SizedBox(height: 12),
          _Label(AppTexts.phone),
          _ReadOnlyField(placeholder: AppTexts.phonePlaceholder),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, left: 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: AppSizes.textS, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _ReadOnlyField extends StatelessWidget {
  final String placeholder;
  const _ReadOnlyField({required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: placeholder,
      readOnly: true,
      enabled: false,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: AppColors.inputFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.cardBorder),
        ),
      ),
      style: TextStyle(color: AppColors.inputHint, fontSize: AppSizes.textS),
    );
  }
}
