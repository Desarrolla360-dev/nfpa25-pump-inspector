import 'package:flutter/material.dart';

/// Design tokens for the "Data Plate" system — a technical-instrument look
/// (equipment nameplates, gauges, safety signage) rather than a generic
/// rounded-card UI. Flat surfaces, hairline borders, deliberate color roles.
class AppColors {
  // Brand signal colors.
  static const Color primaryRed = Color(0xFFD6291F);
  static const Color primaryBlue = Color(0xFF1E3A8A);
  static const Color pendingAmber = Color(0xFFB8860B);
  static const Color successGreen = Color(0xFF1F7A4D);
  static const Color errorRed = primaryRed;

  // Surfaces: a cool neutral "paper" page background with pure-white plates
  // on top of it — the two-tone layering replaces drop shadows as the way
  // content stands out.
  static const Color background = Color(0xFFF6F7F8);
  static const Color surfaceWhite = Colors.white;

  // Text.
  static const Color textPrimary = Color(0xFF14213D); // ink
  static const Color textSecondary = Color(0xFF5C6470); // steel

  // Structural hairlines (replaces ad hoc Colors.grey.shadeNNN borders).
  static const Color hairline = Color(0xFFDBDFE3);
}
