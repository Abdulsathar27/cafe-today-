import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';


class SectionShell extends StatelessWidget {
  final Widget header;
  final Widget body;
  final EdgeInsetsGeometry? padding;

  const SectionShell({
    super.key,
    required this.header,
    required this.body,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.badgeBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      padding: padding ?? const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [header, const SizedBox(height: 12), body],
      ),
    );
  }
}
