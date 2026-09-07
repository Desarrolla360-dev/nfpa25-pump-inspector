import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import '../utils/app_colors.dart';
import '../utils/responsive.dart';

class SignaturePad extends StatefulWidget {
  final SignatureController controller;
  final String label;

  const SignaturePad({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  State<SignaturePad> createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontFamily: 'Oswald',
            fontWeight: FontWeight.w600,
            color: AppColors.primaryBlue,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.hairline),
            borderRadius: BorderRadius.circular(4),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Signature(
              controller: widget.controller,
              height: Responsive.value(context, phone: 150, tablet: 220),
              backgroundColor: AppColors.surfaceWhite,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: () => widget.controller.clear(),
            icon: const Icon(Icons.clear, size: 16, color: AppColors.errorRed),
            label: const Text(
              'Borrar',
              style: TextStyle(color: AppColors.errorRed),
            ),
          ),
        ),
      ],
    );
  }
}
