import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../models/pump_test_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_typography.dart';
import '../utils/math_engine.dart';
import '../utils/responsive.dart';

class PumpCurveChart extends StatelessWidget {
  final List<TestPoint> testPoints;
  final double nominalGpm;
  final double nominalPsi;
  final double maxDevelopedPressure;
  final double pressureAt150Percent;

  const PumpCurveChart({
    super.key,
    required this.testPoints,
    required this.nominalGpm,
    required this.nominalPsi,
    this.maxDevelopedPressure = 0.0,
    this.pressureAt150Percent = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final validPoints = testPoints
        .where((p) => p.adjustedPressure > 0)
        .toList();

    if (validPoints.isEmpty) {
      return const Center(
        child: Text(
          'Datos insuficientes',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    List<FlSpot> measuredSpots = validPoints.map((p) {
      return FlSpot(p.flowGpm, p.adjustedPressure);
    }).toList();

    List<FlSpot> nominalSpots = [];
    List<FlSpot> nfpaLimitSpots = [];

    if (nominalGpm > 0 && nominalPsi > 0) {
      // Prefer the real factory nameplate values (churn pressure at 0 GPM and
      // pressure at 150% capacity) when the technician captured them in the
      // Bomba step; fall back to a rough estimate otherwise so the curve
      // still renders something reasonable. Shared with MathEngine so the
      // dashed NFPA limit line always matches each point's PASS/FAIL badge.
      final churnPressure = MathEngine.resolveChurnPressure(
        nominalPsi: nominalPsi,
        maxDevelopedPressure: maxDevelopedPressure,
      );
      final pressure150 = MathEngine.resolvePressureAt150(
        nominalPsi: nominalPsi,
        pressureAt150Percent: pressureAt150Percent,
      );

      nominalSpots = [
        FlSpot(0, churnPressure),
        FlSpot(nominalGpm, nominalPsi),
        FlSpot(nominalGpm * 1.5, pressure150),
      ];

      nfpaLimitSpots = nominalSpots.map((spot) {
        return FlSpot(spot.x, spot.y * 0.95);
      }).toList();
    }

    double maxY = nominalPsi > 0 ? (nominalPsi * 1.4) : 200;
    if (nominalSpots.isNotEmpty) {
      final highestSpot = nominalSpots
          .map((s) => s.y)
          .reduce((a, b) => a > b ? a : b);
      maxY = maxY > highestSpot * 1.1 ? maxY : highestSpot * 1.1;
    }
    double maxX = nominalGpm > 0 ? (nominalGpm * 1.6) : 3000;

    return Container(
      height: Responsive.value(context, phone: 300, tablet: 420),
      padding: const EdgeInsets.only(right: 24, top: 24, bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.hairline),
      ),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: maxX,
          minY: 0,
          maxY: maxY,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 20,
            verticalInterval: nominalGpm > 0 ? nominalGpm * 0.5 : 500,
            getDrawingHorizontalLine: (value) {
              return const FlLine(color: AppColors.hairline, strokeWidth: 1);
            },
            getDrawingVerticalLine: (value) {
              return const FlLine(color: AppColors.hairline, strokeWidth: 1);
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              axisNameWidget: const Text(
                'FLUJO (GPM)',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.4,
                ),
              ),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: nominalGpm > 0 ? nominalGpm * 0.5 : 500,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      value.toInt().toString(),
                      style: AppTypography.dataValue.copyWith(
                        fontSize: 10,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              axisNameWidget: const Text(
                'PRESIÓN (PSI)',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.4,
                ),
              ),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 20,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: AppTypography.dataValue.copyWith(
                      fontSize: 10,
                      color: AppColors.textSecondary,
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              bottom: BorderSide(color: AppColors.textSecondary, width: 1),
              left: BorderSide(color: AppColors.textSecondary, width: 1),
              right: BorderSide(color: Colors.transparent),
              top: BorderSide(color: Colors.transparent),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: nominalSpots,
              // Recta entre los 3 puntos de fábrica: debe coincidir con la
              // interpolación lineal de MathEngine.expectedFactoryPressure.
              isCurved: false,
              color: AppColors.primaryBlue,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: true),
            ),
            LineChartBarData(
              spots: nfpaLimitSpots,
              // Ídem: recta, para que coincida exactamente con el 95% usado
              // en MathEngine.validateNFPA25Point en cualquier punto del eje X.
              isCurved: false,
              color: AppColors.pendingAmber,
              barWidth: 2,
              isStrokeCapRound: true,
              dashArray: [5, 5],
              dotData: const FlDotData(show: false),
            ),
            LineChartBarData(
              spots: measuredSpots,
              isCurved: true,
              color: AppColors.primaryRed,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.primaryRed.withValues(alpha: 0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
