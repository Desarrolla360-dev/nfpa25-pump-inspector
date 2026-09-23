import 'dart:math';

class MathEngine {
  static double calculateAdjustedPressure({
    required double dischargePsi,
    required double suctionPsi,
    required double nominalRpm,
    required double measuredRpm,
  }) {
    if (measuredRpm == 0) return 0.0;

    double netPressure = dischargePsi - suctionPsi;
    double adjustedPressure = netPressure * pow((nominalRpm / measuredRpm), 2);

    return double.parse(adjustedPressure.toStringAsFixed(2));
  }

  static double resolveChurnPressure({
    required double nominalPsi,
    required double maxDevelopedPressure,
  }) {
    return maxDevelopedPressure > 0 ? maxDevelopedPressure : nominalPsi * 1.2;
  }

  static double resolvePressureAt150({
    required double nominalPsi,
    required double pressureAt150Percent,
  }) {
    return pressureAt150Percent > 0 ? pressureAt150Percent : nominalPsi * 0.65;
  }

  static double expectedFactoryPressure({
    required double flowGpm,
    required double nominalGpm,
    required double nominalPsi,
    required double churnPressure,
    required double pressureAt150,
  }) {
    if (nominalGpm <= 0) return nominalPsi;
    if (flowGpm <= 0) return churnPressure;

    if (flowGpm <= nominalGpm) {
      final ratio = flowGpm / nominalGpm;
      return churnPressure + (nominalPsi - churnPressure) * ratio;
    }

    final maxFlow = nominalGpm * 1.5;
    if (flowGpm <= maxFlow) {
      final ratio = (flowGpm - nominalGpm) / (maxFlow - nominalGpm);
      return nominalPsi + (pressureAt150 - nominalPsi) * ratio;
    }

    final slope = (pressureAt150 - nominalPsi) / (maxFlow - nominalGpm);
    return pressureAt150 + slope * (flowGpm - maxFlow);
  }

  static bool validateNFPA25Point({
    required double adjustedPsi,
    required double expectedPsi,
  }) {
    double minimumLimit = expectedPsi * 0.95;
    return adjustedPsi >= minimumLimit;
  }
}
