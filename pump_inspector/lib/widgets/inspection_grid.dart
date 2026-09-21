import 'package:flutter/material.dart';

import '../collections/inspection_record.dart';
import 'inspection_card.dart';

/// Tablet layout for "Reportes Recientes": pairs inspections two per row.
/// Modified to support shrinkWrap for CustomScrollView compatibility.
class InspectionGrid extends StatelessWidget {
  final List<InspectionRecord> inspections;
  final Future<bool> Function(InspectionRecord record) confirmDelete;
  final void Function(InspectionRecord record) onDelete;
  final void Function(InspectionRecord record) onTap;

  const InspectionGrid({
    super.key,
    required this.inspections,
    required this.confirmDelete,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const columns = 2;
    final rowCount = (inspections.length / columns).ceil();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: rowCount,
      itemBuilder: (context, rowIndex) {
        final firstIndex = rowIndex * columns;
        final secondIndex = firstIndex + 1;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: InspectionCard(
                record: inspections[firstIndex],
                confirmDelete: confirmDelete,
                onDelete: onDelete,
                onTap: onTap,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: secondIndex < inspections.length
                  ? InspectionCard(
                      record: inspections[secondIndex],
                      confirmDelete: confirmDelete,
                      onDelete: onDelete,
                      onTap: onTap,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}
