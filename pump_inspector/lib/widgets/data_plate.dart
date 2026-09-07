import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

/// A flat, hairline-bordered content panel with a solid accent bar on the
/// left edge — the app's stand-in for generic rounded-shadow cards. The bar
/// communicates status/category at a glance (like a physical equipment tag),
/// and the flat + hairline treatment reads as a technical document rather
/// than a SaaS dashboard.
class DataPlate extends StatelessWidget {
  final Widget child;
  final Color accentColor;
  final EdgeInsetsGeometry padding;
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.hairline),
          borderRadius: BorderRadius.circular(4),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 4, color: accentColor),
              Expanded(
                child: Material(
                  color: AppColors.surfaceWhite,
                  child: InkWell(
                    onTap: onTap,
                    child: Padding(padding: padding, child: child),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
