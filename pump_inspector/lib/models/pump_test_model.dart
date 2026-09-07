enum PumpOrientation { horizontal, vertical }

enum MotorFuelType { diesel, electric }

enum OperationMode { manual, automatic }

enum StorageType { tank, cistern }

class EquipmentData {
  // Datos generales adicionales
  final String cityState;
  final String contactName;
  final String systemType;

  // Bomba
  final PumpOrientation pumpOrientation;
  final String pumpBrand;
  final String pumpModel;
  final String pumpSerialNumber;
  final double impellerDiameter;
  final double maxDevelopedPressure;
  final double pressureAt150Percent;
  final bool pumpApproved;

  // Motor
  final MotorFuelType motorFuelType;
  final String motorBrand;
  final String motorModel;
  final String motorSerialNumber;
  final double motorRpm;
  final double motorHp;
  final double motorVolts;
  final double motorFla;
  final double motorServiceFactor;
  final bool motorApproved;

  // Cabezal de engranes (solo aplica si motorFuelType == diesel)
  final String gearHeadBrand;
  final String gearHeadModel;
  final String gearHeadSerialNumber;
  final String gearHeadRatio;

  // Controlador
  final String controllerBrand;
  final String controllerModel;
  final double controllerVoltage;
  final String controllerSerialNumber;
  final OperationMode operationMode;
  final double startPressure;
  final double stopPressure;
  final bool controllerApproved;

  // Almacenamiento de agua
  final StorageType storageType;
  final double waterColumnFeet;
  final String storageCapacity;

  double get waterColumnPsi => waterColumnFeet / 2.31;

  const EquipmentData({
    this.cityState = '',
    this.contactName = '',
    this.systemType = '',
    this.pumpOrientation = PumpOrientation.horizontal,
    this.pumpBrand = '',
    this.pumpModel = '',
    this.pumpSerialNumber = '',
    this.impellerDiameter = 0.0,
    this.maxDevelopedPressure = 0.0,
    this.pressureAt150Percent = 0.0,
    this.pumpApproved = false,
    this.motorFuelType = MotorFuelType.electric,
    this.motorBrand = '',
    this.motorModel = '',
    this.motorSerialNumber = '',
    this.motorRpm = 0.0,
    this.motorHp = 0.0,
    this.motorVolts = 0.0,
    this.motorFla = 0.0,
    this.motorServiceFactor = 0.0,
    this.motorApproved = false,
    this.gearHeadBrand = '',
    this.gearHeadModel = '',
    this.gearHeadSerialNumber = '',
    this.gearHeadRatio = '',
    this.controllerBrand = '',
    this.controllerModel = '',
    this.controllerVoltage = 0.0,
    this.controllerSerialNumber = '',
    this.operationMode = OperationMode.automatic,
    this.startPressure = 0.0,
    this.stopPressure = 0.0,
    this.controllerApproved = false,
    this.storageType = StorageType.tank,
    this.waterColumnFeet = 0.0,
    this.storageCapacity = '',
  });

  EquipmentData copyWith({
    String? cityState,
    String? contactName,
    String? systemType,
    PumpOrientation? pumpOrientation,
    String? pumpBrand,
    String? pumpModel,
    String? pumpSerialNumber,
    double? impellerDiameter,
    double? maxDevelopedPressure,
    double? pressureAt150Percent,
    bool? pumpApproved,
    MotorFuelType? motorFuelType,
    String? motorBrand,
    String? motorModel,
    String? motorSerialNumber,
    double? motorRpm,
    double? motorHp,
    double? motorVolts,
    double? motorFla,
    double? motorServiceFactor,
    bool? motorApproved,
    String? gearHeadBrand,
    String? gearHeadModel,
    String? gearHeadSerialNumber,
    String? gearHeadRatio,
    String? controllerBrand,
    String? controllerModel,
    double? controllerVoltage,
    String? controllerSerialNumber,
    OperationMode? operationMode,
    double? startPressure,
    double? stopPressure,
    bool? controllerApproved,
    StorageType? storageType,
    double? waterColumnFeet,
    String? storageCapacity,
  }) {
    return EquipmentData(
      cityState: cityState ?? this.cityState,
      contactName: contactName ?? this.contactName,
      systemType: systemType ?? this.systemType,
      pumpOrientation: pumpOrientation ?? this.pumpOrientation,
      pumpBrand: pumpBrand ?? this.pumpBrand,
      pumpModel: pumpModel ?? this.pumpModel,
      pumpSerialNumber: pumpSerialNumber ?? this.pumpSerialNumber,
      impellerDiameter: impellerDiameter ?? this.impellerDiameter,
      maxDevelopedPressure: maxDevelopedPressure ?? this.maxDevelopedPressure,
      pressureAt150Percent: pressureAt150Percent ?? this.pressureAt150Percent,
      pumpApproved: pumpApproved ?? this.pumpApproved,
      motorFuelType: motorFuelType ?? this.motorFuelType,
      motorBrand: motorBrand ?? this.motorBrand,
      motorModel: motorModel ?? this.motorModel,
      motorSerialNumber: motorSerialNumber ?? this.motorSerialNumber,
      motorRpm: motorRpm ?? this.motorRpm,
      motorHp: motorHp ?? this.motorHp,
      motorVolts: motorVolts ?? this.motorVolts,
      motorFla: motorFla ?? this.motorFla,
      motorServiceFactor: motorServiceFactor ?? this.motorServiceFactor,
      motorApproved: motorApproved ?? this.motorApproved,
      gearHeadBrand: gearHeadBrand ?? this.gearHeadBrand,
      gearHeadModel: gearHeadModel ?? this.gearHeadModel,
      gearHeadSerialNumber: gearHeadSerialNumber ?? this.gearHeadSerialNumber,
      gearHeadRatio: gearHeadRatio ?? this.gearHeadRatio,
      controllerBrand: controllerBrand ?? this.controllerBrand,
      controllerModel: controllerModel ?? this.controllerModel,
      controllerVoltage: controllerVoltage ?? this.controllerVoltage,
      controllerSerialNumber:
          controllerSerialNumber ?? this.controllerSerialNumber,
      operationMode: operationMode ?? this.operationMode,
      startPressure: startPressure ?? this.startPressure,
      stopPressure: stopPressure ?? this.stopPressure,
      controllerApproved: controllerApproved ?? this.controllerApproved,
      storageType: storageType ?? this.storageType,
      waterColumnFeet: waterColumnFeet ?? this.waterColumnFeet,
      storageCapacity: storageCapacity ?? this.storageCapacity,
    );
  }
}

class TestPoint {
  final int flowPercentage;
  final double flowGpm;
  final double speedRpm;
  final double dischargePressure;
  final double suctionPressure;
  final double netPressure;
  final double adjustedPressure;
  final bool isPassed;

  TestPoint({
    required this.flowPercentage,
    this.flowGpm = 0.0,
    this.speedRpm = 0.0,
    this.dischargePressure = 0.0,
    this.suctionPressure = 0.0,
    this.netPressure = 0.0,
    this.adjustedPressure = 0.0,
    this.isPassed = false,
  });

  TestPoint copyWith({
    int? flowPercentage,
    double? flowGpm,
    double? speedRpm,
    double? dischargePressure,
    double? suctionPressure,
    double? netPressure,
    double? adjustedPressure,
    bool? isPassed,
  }) {
    return TestPoint(
      flowPercentage: flowPercentage ?? this.flowPercentage,
      flowGpm: flowGpm ?? this.flowGpm,
      speedRpm: speedRpm ?? this.speedRpm,
      dischargePressure: dischargePressure ?? this.dischargePressure,
      suctionPressure: suctionPressure ?? this.suctionPressure,
      netPressure: netPressure ?? this.netPressure,
      adjustedPressure: adjustedPressure ?? this.adjustedPressure,
      isPassed: isPassed ?? this.isPassed,
    );
  }
}

class PumpTest {
  final String companyName;
  final double nominalGpm;
  final double nominalPsi;
  final double nominalRpm;
  final EquipmentData equipmentData;
  final List<TestPoint> testPoints;
  final List<int>? technicianSignature;
  final List<int>? clientSignature;

  PumpTest({
    this.companyName = '',
    this.nominalGpm = 0.0,
    this.nominalPsi = 0.0,
    this.nominalRpm = 0.0,
    this.equipmentData = const EquipmentData(),
    this.technicianSignature = const [],
    this.clientSignature = const [],
    this.testPoints = const [],
  });

  PumpTest copyWith({
    String? companyName,
    double? nominalGpm,
    double? nominalPsi,
    double? nominalRpm,
    EquipmentData? equipmentData,
    List<TestPoint>? testPoints,
    List<int>? technicianSignature,
    List<int>? clientSignature,
  }) {
    return PumpTest(
      companyName: companyName ?? this.companyName,
      nominalGpm: nominalGpm ?? this.nominalGpm,
      nominalPsi: nominalPsi ?? this.nominalPsi,
      nominalRpm: nominalRpm ?? this.nominalRpm,
      equipmentData: equipmentData ?? this.equipmentData,
      testPoints: testPoints ?? this.testPoints,
      technicianSignature: technicianSignature ?? this.technicianSignature,
      clientSignature: clientSignature ?? this.clientSignature,
    );
  }
}
