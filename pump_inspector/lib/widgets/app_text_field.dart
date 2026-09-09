import 'package:flutter/material.dart';

/// A labeled text input, styled via the app's global `InputDecorationTheme`.
/// Shared by every form step instead of repeating `TextFormField` wiring.
class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? suffixText;
  final bool numeric;
  final ValueChanged<String>? onChanged;

  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.suffixText,
    this.numeric = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: numeric ? TextInputType.number : TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(labelText: label, suffixText: suffixText),
    );
  }
}
