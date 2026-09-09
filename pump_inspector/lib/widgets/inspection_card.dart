import 'package:flutter/material.dart';

import '../collections/inspection_record.dart';
import '../utils/app_colors.dart';
import '../utils/app_typography.dart';
import '../utils/inspection_status.dart';
import 'data_plate.dart';

/// One row of the "Reportes Recientes" list: swipe-to-delete (with
/// confirmation) and tap to open the PDF report. The 3-way status —
/// Pendiente / Aprobado / Falla — lives on the accent bar and the badge,
/// never on color alone.
class InspectionCard extends StatelessWidget {
  final InspectionRecord record;
  final Future<bool> Function(InspectionRecord record) confirmDelete;
  final void Function(InspectionRecord record) onDelete;
  final void Function(InspectionRecord record) onTap;

  const InspectionCard({
    super.key,
    required this.record,
    required this.confirmDelete,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dateString =
        "${record.timestamp.day}/${record.timestamp.month}/${record.timestamp.year}";
    final status = record.status;
    final statusColor = status.color;
    final statusLabel = status.label;
    final companyNameDisplay = record.companyName.isEmpty
        ? 'Cliente sin nombre'
        : record.companyName;

    return Dismissible(
      key: ValueKey(record.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) => confirmDelete(record),
      onDismissed: (_) => onDelete(record),
      background: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: AppColors.errorRed,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.centerRight,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.delete, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Eliminar',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: DataPlate(
          accentColor: statusColor,
          onTap: () => onTap(record),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      companyNameDisplay,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${record.nominalGpm.toInt()} GPM | $dateString',
                      style: AppTypography.dataValue.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: statusColor.withValues(alpha: 0.4)),
                ),
                child: Text(
                  statusLabel.toUpperCase(),
                  style: AppTypography.badge.copyWith(
                    color: statusColor,
                    fontSize: 11,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, color: AppColors.primaryBlue),
            ],
          ),
        ),
      ),
    );
  }
}
