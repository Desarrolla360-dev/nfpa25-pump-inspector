import 'package:flutter/material.dart';

import '../collections/inspection_record.dart';
import 'app_colors.dart';

/// The 3-way result state for an inspection: no test data captured yet,
/// every captured point passed, or at least one point failed NFPA-25.
enum InspectionStatus { pending, approved, failed }

extension InspectionStatusStyle on InspectionStatus {
  Color get color => switch (this) {
    InspectionStatus.pending => AppColors.pendingAmber,
    InspectionStatus.approved => AppColors.successGreen,
    InspectionStatus.failed => AppColors.errorRed,
  };

  String get label => switch (this) {
    InspectionStatus.pending => 'Pendiente',
    InspectionStatus.approved => 'Aprobado',
    InspectionStatus.failed => 'Falla',
  };
}

extension InspectionRecordStatus on InspectionRecord {
  InspectionStatus get status {
    final hasResults = testPoints.any((p) => p.adjustedPressure > 0);
    if (!hasResults) return InspectionStatus.pending;

    final hasFailedPoints = testPoints.any(
      (p) => !p.isPassed && p.adjustedPressure > 0,
    );
    return hasFailedPoints
        ? InspectionStatus.failed
        : InspectionStatus.approved;
  }
}
