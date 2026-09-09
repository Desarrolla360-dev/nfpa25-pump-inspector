import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

/// A labeled binary/multi-choice toggle (Horizontal/Vertical, Diésel/
/// Eléctrico, etc.), built on Material's `SegmentedButton`.
class AppSegmentedField<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<(T, String)> options;
  final ValueChanged<T> onChanged;

  const AppSegmentedField({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        SegmentedButton<T>(
          segments: [
            for (final option in options)
              ButtonSegment<T>(value: option.$1, label: Text(option.$2)),
          ],
          selected: {value},
          onSelectionChanged: (selection) => onChanged(selection.first),
        ),
      ],
    );
  }
}
