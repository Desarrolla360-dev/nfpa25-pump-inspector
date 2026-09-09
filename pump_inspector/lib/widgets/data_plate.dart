import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

/// A flat, hairline-bordered content panel with a solid accent bar on the
/// left edge — the app's stand-in for generic rounded-shadow cards. The bar
/// communicates status/category at a glance (like a physical equipment tag),
/// and the flat + hairline treatment reads as a technical document rather
/// than a SaaS dashboard.
///
/// The accent bar is a separate flat layer (via `Stack`), not part of the
/// panel's own border — `BoxDecoration` forbids a `borderRadius` on a border
/// whose sides aren't all the same color. Sizing the bar with `Positioned`
/// (top: 0, bottom: 0) also means this never needs the extra intrinsic-size
/// layout pass an `IntrinsicHeight` + `Row` approach would (a pattern
/// Flutter's performance guide warns against).
class DataPlate extends StatelessWidget {
  static const double _accentWidth = 4;

  final Widget child;
  final Color accentColor;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  const DataPlate({
    super.key,
    required this.child,
    required this.accentColor,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(4);

    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          Material(
            color: AppColors.surfaceWhite,
            child: InkWell(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  border: Border.all(color: AppColors.hairline),
                ),
                child: Padding(
                  padding: padding.add(
                    const EdgeInsets.only(left: _accentWidth),
                  ),
                  child: child,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: _accentWidth,
            child: Container(color: accentColor),
          ),
        ],
      ),
    );
  }
}
