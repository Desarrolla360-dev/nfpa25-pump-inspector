import 'package:flutter/material.dart';

/// Text styles for the "Data Plate" numeric-readout treatment: measurement
/// values (GPM, PSI, RPM, PASS/FAIL) render in a monospaced face with
/// tabular figures, visually distinct from UI labels and prose — the app's
/// numbers should read like an instrument, not like chat text.
class AppTypography {
  AppTypography._();

  static const String monoFontFamily = 'IBMPlexMono';

  static const List<FontFeature> _tabularFigures = [
    FontFeature.tabularFigures(),
  ];

  static const TextStyle dataValue = TextStyle(
    fontFamily: monoFontFamily,
    fontFeatures: _tabularFigures,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle dataValueLarge = TextStyle(
    fontFamily: monoFontFamily,
    fontFeatures: _tabularFigures,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  /// PASS / FAIL / APROBADA-style status badges. Kept uppercase deliberately
  /// — that's how real fire-safety signage communicates, not decoration.
  static const TextStyle badge = TextStyle(
    fontFamily: monoFontFamily,
    fontFeatures: _tabularFigures,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
  );
}
