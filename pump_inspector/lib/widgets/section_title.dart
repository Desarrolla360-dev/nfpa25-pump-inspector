import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

/// A step/section heading in the "Data Plate" system: bold Inter, brand blue.
class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryBlue,
        letterSpacing: 0.2,
      ),
    );
  }
}
