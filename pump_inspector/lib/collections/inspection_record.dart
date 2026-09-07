import 'package:isar/isar.dart';

import '../models/pump_test_model.dart';

part 'inspection_record.g.dart';

@collection
class InspectionRecord {
  Id id = Isar.autoIncrement;

  late String companyName;
  late double nominalGpm;
  late double nominalPsi;
  late double nominalRpm;
  late DateTime timestamp;

  EquipmentDataEmbedded equipmentData = EquipmentDataEmbedded();
  late List<PointRecord> testPoints;
  List<int>? technicianSignature;
  List<int>? clientSignature;
}

@embedded
class PointRecord {
  late int flowPercentage;
  late double flowGpm;
  late double speedRpm;
  late double dischargePressure;
  late double suctionPressure;
  late double netPressure;
  late double adjustedPressure;
  late bool isPassed;
}

@embedded
class EquipmentDataEmbedded {
  String cityState = '';
  String contactName = '';
  String systemType = '';

  @Enumerated(EnumType.name)
  PumpOrientation pumpOrientation = PumpOrientation.horizontal;
  String pumpBrand = '';
  String pumpModel = '';
  String pumpSerialNumber = '';
  double impellerDiameter = 0.0;
  double maxDevelopedPressure = 0.0;
  double pressureAt150Percent = 0.0;
  bool pumpApproved = false;

  @Enumerated(EnumType.name)
  MotorFuelType motorFuelType = MotorFuelType.electric;
  String motorBrand = '';
  String motorModel = '';
  String motorSerialNumber = '';
  double motorRpm = 0.0;
  double motorHp = 0.0;
  double motorVolts = 0.0;
  double motorFla = 0.0;
  double motorServiceFactor = 0.0;
  bool motorApproved = false;

  String gearHeadBrand = '';
  String gearHeadModel = '';
  String gearHeadSerialNumber = '';
  String gearHeadRatio = '';

  String controllerBrand = '';
  String controllerModel = '';
  double controllerVoltage = 0.0;
  String controllerSerialNumber = '';

  @Enumerated(EnumType.name)
  OperationMode operationMode = OperationMode.automatic;
  double startPressure = 0.0;
  double stopPressure = 0.0;
  bool controllerApproved = false;

  @Enumerated(EnumType.name)
  StorageType storageType = StorageType.tank;
  double waterColumnFeet = 0.0;
  String storageCapacity = '';

  @ignore
  double get waterColumnPsi => waterColumnFeet / 2.31;
}
