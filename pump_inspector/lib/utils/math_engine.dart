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

  /// Churn (shutoff, 0 GPM) pressure from the factory curve. Falls back to a
  /// rough estimate when the technician hasn't captured the real nameplate
  /// value ("Máxima presión desarrollada") yet.
  static double resolveChurnPressure({
    required double nominalPsi,
    required double maxDevelopedPressure,
  }) {
    return maxDevelopedPressure > 0 ? maxDevelopedPressure : nominalPsi * 1.2;
  }

  /// Factory pressure at 150% of rated capacity. Falls back to a rough
  /// estimate when "Presión al 150% de Capacidad" hasn't been captured yet.
  static double resolvePressureAt150({
    required double nominalPsi,
    required double pressureAt150Percent,
  }) {
    return pressureAt150Percent > 0 ? pressureAt150Percent : nominalPsi * 0.65;
  }

  /// Expected factory pressure at a given flow, linearly interpolating the
  /// three-point factory curve (0% churn -> 100% nominal -> 150% capacity),
  /// the same curve drawn in the performance chart and used in the original
  /// spreadsheet (Grafica!DD13:DD15).
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

    // Más allá del 150%: se extrapola con la pendiente del último tramo.
    final slope = (pressureAt150 - nominalPsi) / (maxFlow - nominalGpm);
    return pressureAt150 + slope * (flowGpm - maxFlow);
  }

  /// NFPA-25 8.3.7.3: la prueba es aceptable si el punto ajustado alcanza al
  /// menos el 95% de la presión esperada de fábrica PARA ESE FLUJO
  /// específico (no un umbral fijo de la presión nominal).
  static bool validateNFPA25Point({
    required double adjustedPsi,
    required double expectedPsi,
  }) {
    double minimumLimit = expectedPsi * 0.95;
    return adjustedPsi >= minimumLimit;
  }
}
