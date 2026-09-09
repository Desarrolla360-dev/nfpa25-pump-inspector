import 'package:flutter/material.dart';

import '../utils/responsive.dart';

/// Lays out [fields] in a row (tablet) or stacked column (phone), with
/// consistent spacing — shared so every form step doesn't repeat the same
/// `Responsive.isTablet` branch.
class ResponsiveRow extends StatelessWidget {
  final List<Widget> fields;

  const ResponsiveRow(this.fields, {super.key});

  @override
  Widget build(BuildContext context) {
    if (!Responsive.isTablet(context)) {
      return Column(
        children: [
          for (var i = 0; i < fields.length; i++) ...[
            if (i > 0) const SizedBox(height: 16),
            fields[i],
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < fields.length; i++) ...[
          if (i > 0) const SizedBox(width: 16),
          Expanded(child: fields[i]),
        ],
      ],
    );
  }
}
