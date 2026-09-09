import 'package:flutter/material.dart';

import '../models/pump_test_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_typography.dart';
import 'data_plate.dart';

/// One editable row of the hydraulic test table (0%/50%/100%/125%/150% of
/// rated flow): captures the field readings and shows the computed net /
/// adjusted pressure and PASS/FAIL/PENDIENTE result for that point.
class TestPointCard extends StatelessWidget {
  final TestPoint point;
  final ValueChanged<String> onFlowGpmChanged;
  final ValueChanged<String> onSuctionChanged;
  final ValueChanged<String> onDischargeChanged;
  final ValueChanged<String> onRpmChanged;

  const TestPointCard({
    super.key,
    required this.point,
    required this.onFlowGpmChanged,
    required this.onSuctionChanged,
    required this.onDischargeChanged,
    required this.onRpmChanged,
  });

  @override
  Widget build(BuildContext context) {
    final hasResult = point.adjustedPressure > 0;
    final statusColor = !hasResult
        ? AppColors.pendingAmber
        : point.isPassed
        ? AppColors.successGreen
        : AppColors.errorRed;
    final statusLabel = !hasResult
        ? 'PENDIENTE'
        : (point.isPassed ? 'PASS' : 'FAIL');

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DataPlate(
        accentColor: statusColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Flujo al ${point.flowPercentage}%',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlue,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    statusLabel,
                    style: AppTypography.badge.copyWith(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'GPM Medido',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                    ),
                    onChanged: onFlowGpmChanged,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Succión (PSI)',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                    ),
                    onChanged: onSuctionChanged,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Descarga (PSI)',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                    ),
                    onChanged: onDischargeChanged,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'RPM Medido',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                    ),
                    onChanged: onRpmChanged,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.hairline),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(color: AppColors.textSecondary),
                      children: [
                        const TextSpan(text: 'Presión Neta: '),
                        TextSpan(
                          text: '${point.netPressure.toStringAsFixed(2)} PSI',
                          style: AppTypography.dataValue.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(color: AppColors.textPrimary),
                      children: [
                        const TextSpan(text: 'Presión Ajustada: '),
                        TextSpan(
                          text:
                              '${point.adjustedPressure.toStringAsFixed(2)} PSI',
                          style: AppTypography.dataValueLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
