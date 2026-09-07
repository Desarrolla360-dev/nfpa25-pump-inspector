import 'package:flutter/material.dart';

/// Breakpoint helpers for adapting layouts between phone and tablet.
///
/// A device counts as a tablet when its shortest side is at least
/// [tabletBreakpoint] logical pixels — the standard Material Design
/// threshold, independent of orientation (so a rotated tablet is still
/// a tablet).
class Responsive {
  Responsive._();

  static const double tabletBreakpoint = 600;

  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).shortestSide >= tabletBreakpoint;
  }

  /// Picks between a phone and a tablet value based on the current screen.
  static T value<T>(
    BuildContext context, {
    required T phone,
    required T tablet,
  }) {
    return isTablet(context) ? tablet : phone;
  }
}
