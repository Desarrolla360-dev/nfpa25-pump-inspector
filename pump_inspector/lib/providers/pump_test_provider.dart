import 'package:flutter_riverpod/legacy.dart';

import '../models/pump_test_model.dart';
import '../utils/math_engine.dart';
import '../collections/inspection_record.dart';
import '../main.dart';

class PumpTestNotifier extends StateNotifier<PumpTest> {
  PumpTestNotifier()
    : super(
        PumpTest(
          testPoints: [
            TestPoint(flowPercentage: 0),
            TestPoint(flowPercentage: 50),
            TestPoint(flowPercentage: 100),
            TestPoint(flowPercentage: 125),
            TestPoint(flowPercentage: 150),
          ],
        ),
      );

  void updateCompanyInfo(String name) {
    state = state.copyWith(companyName: name);
  }

  void updateNominalData({
    required double gpm,
    required double psi,
    required double rpm,
  }) {
    state = state.copyWith(nominalGpm: gpm, nominalPsi: psi, nominalRpm: rpm);
  }

  void updateEquipmentData(EquipmentData data) {
    state = state.copyWith(equipmentData: data);
  }

  void updateTestPoint({
    required int index,
    required double flowGpm,
    required double speedRpm,
    required double dischargePressure,
    required double suctionPressure,
  }) {
    double adjustedPressure = MathEngine.calculateAdjustedPressure(
      dischargePsi: dischargePressure,
      suctionPsi: suctionPressure,
      nominalRpm: state.nominalRpm,
      measuredRpm: speedRpm,
    );

    final churnPressure = MathEngine.resolveChurnPressure(
      nominalPsi: state.nominalPsi,
      maxDevelopedPressure: state.equipmentData.maxDevelopedPressure,
    );
    final pressureAt150 = MathEngine.resolvePressureAt150(
      nominalPsi: state.nominalPsi,
      pressureAt150Percent: state.equipmentData.pressureAt150Percent,
    );
    final expectedPsi = MathEngine.expectedFactoryPressure(
      flowGpm: flowGpm,
      nominalGpm: state.nominalGpm,
      nominalPsi: state.nominalPsi,
      churnPressure: churnPressure,
      pressureAt150: pressureAt150,
    );

    bool isPassed = MathEngine.validateNFPA25Point(
      adjustedPsi: adjustedPressure,
      expectedPsi: expectedPsi,
    );

    double netPressure = dischargePressure - suctionPressure;

    List<TestPoint> updatedPoints = List.from(state.testPoints);
    updatedPoints[index] = updatedPoints[index].copyWith(
      flowGpm: flowGpm,
      speedRpm: speedRpm,
      dischargePressure: dischargePressure,
      suctionPressure: suctionPressure,
      netPressure: netPressure,
      adjustedPressure: adjustedPressure,
      isPassed: isPassed,
    );

    state = state.copyWith(testPoints: updatedPoints);
  }

  Future<void> saveInspectionToDatabase({
    List<int>? techSignature,
    List<int>? clientSig,
  }) async {
    final record = InspectionRecord()
      ..companyName = state.companyName
      ..nominalGpm = state.nominalGpm
      ..nominalPsi = state.nominalPsi
      ..nominalRpm = state.nominalRpm
      ..timestamp = DateTime.now()
      ..technicianSignature = techSignature
      ..clientSignature = clientSig
      ..equipmentData = (EquipmentDataEmbedded()
        ..cityState = state.equipmentData.cityState
        ..contactName = state.equipmentData.contactName
        ..systemType = state.equipmentData.systemType
        ..pumpOrientation = state.equipmentData.pumpOrientation
        ..pumpBrand = state.equipmentData.pumpBrand
        ..pumpModel = state.equipmentData.pumpModel
        ..pumpSerialNumber = state.equipmentData.pumpSerialNumber
        ..impellerDiameter = state.equipmentData.impellerDiameter
        ..maxDevelopedPressure = state.equipmentData.maxDevelopedPressure
        ..pressureAt150Percent = state.equipmentData.pressureAt150Percent
        ..pumpApproved = state.equipmentData.pumpApproved
        ..motorFuelType = state.equipmentData.motorFuelType
        ..motorBrand = state.equipmentData.motorBrand
        ..motorModel = state.equipmentData.motorModel
        ..motorSerialNumber = state.equipmentData.motorSerialNumber
        ..motorRpm = state.equipmentData.motorRpm
        ..motorHp = state.equipmentData.motorHp
        ..motorVolts = state.equipmentData.motorVolts
        ..motorFla = state.equipmentData.motorFla
        ..motorServiceFactor = state.equipmentData.motorServiceFactor
        ..motorApproved = state.equipmentData.motorApproved
        ..gearHeadBrand = state.equipmentData.gearHeadBrand
        ..gearHeadModel = state.equipmentData.gearHeadModel
        ..gearHeadSerialNumber = state.equipmentData.gearHeadSerialNumber
        ..gearHeadRatio = state.equipmentData.gearHeadRatio
        ..controllerBrand = state.equipmentData.controllerBrand
        ..controllerModel = state.equipmentData.controllerModel
        ..controllerVoltage = state.equipmentData.controllerVoltage
        ..controllerSerialNumber = state.equipmentData.controllerSerialNumber
        ..operationMode = state.equipmentData.operationMode
        ..startPressure = state.equipmentData.startPressure
        ..stopPressure = state.equipmentData.stopPressure
        ..controllerApproved = state.equipmentData.controllerApproved
        ..storageType = state.equipmentData.storageType
        ..waterColumnFeet = state.equipmentData.waterColumnFeet
        ..storageCapacity = state.equipmentData.storageCapacity)
      ..testPoints = state.testPoints.map((p) {
        return PointRecord()
          ..flowPercentage = p.flowPercentage
          ..flowGpm = p.flowGpm
          ..speedRpm = p.speedRpm
          ..dischargePressure = p.dischargePressure
          ..suctionPressure = p.suctionPressure
          ..netPressure = p.netPressure
          ..adjustedPressure = p.adjustedPressure
          ..isPassed = p.isPassed;
      }).toList();

    await isar.writeTxn(() async {
      await isar.inspectionRecords.put(record);
    });
  }
}

final pumpTestProvider = StateNotifierProvider<PumpTestNotifier, PumpTest>((
  ref,
) {
  return PumpTestNotifier();
});
