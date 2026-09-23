import 'package:flutter/material.dart';

class Responsive {
  Responsive._();

  static const double tabletBreakpoint = 600;

  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).shortestSide >= tabletBreakpoint;
  }

  static T value<T>(
    BuildContext context, {
    required T phone,
    required T tablet,
  }) {
    return isTablet(context) ? tablet : phone;
  }
}
