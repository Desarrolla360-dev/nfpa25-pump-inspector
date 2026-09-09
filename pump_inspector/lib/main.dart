import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'utils/app_colors.dart';
import 'utils/auth_session.dart';
import 'collections/inspection_record.dart';
import 'models/pump_test_model.dart';
import 'utils/math_engine.dart';

late Isar isar;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();

  isar = await Isar.open([InspectionRecordSchema], directory: dir.path);

  await _seedSampleData();

  final isLoggedIn = await AuthSession.isLoggedIn();

  runApp(ProviderScope(child: MainApp(startLoggedIn: isLoggedIn)));
}

// TEMPORAL: crea 2 inspecciones de ejemplo para pruebas manuales.
// Se retira una vez confirmado que se ven bien en la app.
Future<void> _seedSampleData() async {
  if (await isar.inspectionRecords.count() >= 3) return;

  PointRecord point({
    required int flowPercentage,
    required double flowGpm,
    required double speedRpm,
    required double dischargePressure,
    required double suctionPressure,
    required double nominalRpm,
    required double nominalGpm,
    required double nominalPsi,
    required double churnPressure,
    required double pressureAt150,
  }) {
    final netPressure = dischargePressure - suctionPressure;
    final adjustedPressure = MathEngine.calculateAdjustedPressure(
      dischargePsi: dischargePressure,
      suctionPsi: suctionPressure,
      nominalRpm: nominalRpm,
      measuredRpm: speedRpm,
    );
    final expectedPsi = MathEngine.expectedFactoryPressure(
      flowGpm: flowGpm,
      nominalGpm: nominalGpm,
      nominalPsi: nominalPsi,
      churnPressure: churnPressure,
      pressureAt150: pressureAt150,
    );
    final isPassed = MathEngine.validateNFPA25Point(
      adjustedPsi: adjustedPressure,
      expectedPsi: expectedPsi,
    );
    return PointRecord()
      ..flowPercentage = flowPercentage
      ..flowGpm = flowGpm
      ..speedRpm = speedRpm
      ..dischargePressure = dischargePressure
      ..suctionPressure = suctionPressure
      ..netPressure = netPressure
      ..adjustedPressure = adjustedPressure
      ..isPassed = isPassed;
  }

  // Registro 1: bomba eléctrica, todos los puntos aprobados.
  const nominalGpm1 = 1500.0;
  const nominalPsi1 = 120.0;
  const nominalRpm1 = 1770.0;
  const churnPressure1 = 145.0;
  const pressureAt150_1 = 95.0;
  final record1 = InspectionRecord()
    ..companyName = 'Hotel Riu Palace'
    ..nominalGpm = nominalGpm1
    ..nominalPsi = nominalPsi1
    ..nominalRpm = nominalRpm1
    ..timestamp = DateTime.now().subtract(const Duration(days: 2))
    ..equipmentData = (EquipmentDataEmbedded()
      ..cityState = 'Cancún, Quintana Roo'
      ..contactName = 'Roberto Díaz'
      ..systemType = 'Bomba Eléctrica'
      ..pumpOrientation = PumpOrientation.horizontal
      ..pumpBrand = 'AC FIRE PUMP'
      ..pumpModel = 'FP110HC-500'
      ..pumpSerialNumber = 'SN-88213'
      ..impellerDiameter = 7.5
      ..maxDevelopedPressure = 145.0
      ..pressureAt150Percent = 95.0
      ..pumpApproved = true
      ..motorFuelType = MotorFuelType.electric
      ..motorBrand = 'NIDEC'
      ..motorModel = '7322BEM'
      ..motorSerialNumber = 'MB-2291'
      ..motorRpm = 1780.0
      ..motorHp = 125.0
      ..motorVolts = 460.0
      ..motorFla = 156.0
      ..motorServiceFactor = 1.15
      ..motorApproved = true
      ..controllerBrand = 'EATON'
      ..controllerModel = 'FD-70-125'
      ..controllerVoltage = 460.0
      ..controllerSerialNumber = 'CT-5521'
      ..operationMode = OperationMode.automatic
      ..startPressure = 100.0
      ..stopPressure = 130.0
      ..controllerApproved = true
      ..storageType = StorageType.tank
      ..waterColumnFeet = 20.0
      ..storageCapacity = '500 M3')
    ..technicianSignature = null
    ..clientSignature = null
    ..testPoints = [
      point(
        flowPercentage: 0,
        flowGpm: 0,
        speedRpm: 1775,
        dischargePressure: 140,
        suctionPressure: 8,
        nominalRpm: nominalRpm1,
        nominalGpm: nominalGpm1,
        nominalPsi: nominalPsi1,
        churnPressure: churnPressure1,
        pressureAt150: pressureAt150_1,
      ),
      point(
        flowPercentage: 50,
        flowGpm: 750,
        speedRpm: 1772,
        dischargePressure: 135,
        suctionPressure: 7,
        nominalRpm: nominalRpm1,
        nominalGpm: nominalGpm1,
        nominalPsi: nominalPsi1,
        churnPressure: churnPressure1,
        pressureAt150: pressureAt150_1,
      ),
      point(
        flowPercentage: 100,
        flowGpm: 1500,
        speedRpm: 1770,
        dischargePressure: 124,
        suctionPressure: 6,
        nominalRpm: nominalRpm1,
        nominalGpm: nominalGpm1,
        nominalPsi: nominalPsi1,
        churnPressure: churnPressure1,
        pressureAt150: pressureAt150_1,
      ),
      point(
        flowPercentage: 125,
        flowGpm: 1875,
        speedRpm: 1765,
        dischargePressure: 112,
        suctionPressure: 5,
        nominalRpm: nominalRpm1,
        nominalGpm: nominalGpm1,
        nominalPsi: nominalPsi1,
        churnPressure: churnPressure1,
        pressureAt150: pressureAt150_1,
      ),
      point(
        flowPercentage: 150,
        flowGpm: 2250,
        speedRpm: 1760,
        dischargePressure: 100,
        suctionPressure: 4,
        nominalRpm: nominalRpm1,
        nominalGpm: nominalGpm1,
        nominalPsi: nominalPsi1,
        churnPressure: churnPressure1,
        pressureAt150: pressureAt150_1,
      ),
    ];

  // Registro 2: bomba diésel, con puntos que fallan a mayor flujo.
  const nominalGpm2 = 1000.0;
  const nominalPsi2 = 100.0;
  const nominalRpm2 = 1760.0;
  const churnPressure2 = 118.0;
  const pressureAt150_2 = 62.0;
  final record2 = InspectionRecord()
    ..companyName = 'Plaza Comercial Galerías'
    ..nominalGpm = nominalGpm2
    ..nominalPsi = nominalPsi2
    ..nominalRpm = nominalRpm2
    ..timestamp = DateTime.now().subtract(const Duration(days: 10))
    ..equipmentData = (EquipmentDataEmbedded()
      ..cityState = 'Guadalajara, Jalisco'
      ..contactName = 'María Fernanda López'
      ..systemType = 'Bomba Diésel'
      ..pumpOrientation = PumpOrientation.horizontal
      ..pumpBrand = 'PATTERSON'
      ..pumpModel = 'PS-100D'
      ..pumpSerialNumber = 'SN-55021'
      ..impellerDiameter = 9.0
      ..maxDevelopedPressure = 118.0
      ..pressureAt150Percent = 62.0
      ..pumpApproved = false
      ..motorFuelType = MotorFuelType.diesel
      ..motorBrand = 'JOHN DEERE'
      ..motorModel = '6068HF'
      ..motorSerialNumber = 'JD-77120'
      ..motorRpm = 1760.0
      ..motorHp = 175.0
      ..gearHeadBrand = 'FALK'
      ..gearHeadModel = 'YB2100'
      ..gearHeadSerialNumber = 'GH-3391'
      ..gearHeadRatio = '90° 1:1'
      ..motorApproved = true
      ..controllerBrand = 'EATON'
      ..controllerModel = 'FD-70-150-B-L1'
      ..controllerVoltage = 24.0
      ..controllerSerialNumber = 'CT-9002'
      ..operationMode = OperationMode.automatic
      ..startPressure = 90.0
      ..stopPressure = 105.0
      ..controllerApproved = true
      ..storageType = StorageType.cistern
      ..waterColumnFeet = 12.0
      ..storageCapacity = '300 M3')
    ..technicianSignature = null
    ..clientSignature = null
    ..testPoints = [
      point(
        flowPercentage: 0,
        flowGpm: 0,
        speedRpm: 1758,
        dischargePressure: 115,
        suctionPressure: 5,
        nominalRpm: nominalRpm2,
        nominalGpm: nominalGpm2,
        nominalPsi: nominalPsi2,
        churnPressure: churnPressure2,
        pressureAt150: pressureAt150_2,
      ),
      point(
        flowPercentage: 50,
        flowGpm: 500,
        speedRpm: 1750,
        dischargePressure: 100,
        suctionPressure: 5,
        nominalRpm: nominalRpm2,
        nominalGpm: nominalGpm2,
        nominalPsi: nominalPsi2,
        churnPressure: churnPressure2,
        pressureAt150: pressureAt150_2,
      ),
      point(
        flowPercentage: 100,
        flowGpm: 1000,
        speedRpm: 1740,
        dischargePressure: 80,
        suctionPressure: 4,
        nominalRpm: nominalRpm2,
        nominalGpm: nominalGpm2,
        nominalPsi: nominalPsi2,
        churnPressure: churnPressure2,
        pressureAt150: pressureAt150_2,
      ),
      point(
        flowPercentage: 125,
        flowGpm: 1250,
        speedRpm: 1730,
        dischargePressure: 65,
        suctionPressure: 3,
        nominalRpm: nominalRpm2,
        nominalGpm: nominalGpm2,
        nominalPsi: nominalPsi2,
        churnPressure: churnPressure2,
        pressureAt150: pressureAt150_2,
      ),
      point(
        flowPercentage: 150,
        flowGpm: 1500,
        speedRpm: 1720,
        dischargePressure: 50,
        suctionPressure: 2,
        nominalRpm: nominalRpm2,
        nominalGpm: nominalGpm2,
        nominalPsi: nominalPsi2,
        churnPressure: churnPressure2,
        pressureAt150: pressureAt150_2,
      ),
    ];

  await isar.writeTxn(() async {
    await isar.inspectionRecords.put(record1);
    await isar.inspectionRecords.put(record2);
  });
}

class MainApp extends StatelessWidget {
  final bool startLoggedIn;

  const MainApp({super.key, required this.startLoggedIn});

  @override
  Widget build(BuildContext context) {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.primaryBlue,
          brightness: Brightness.light,
        ).copyWith(
          primary: AppColors.primaryBlue,
          onPrimary: Colors.white,
          secondary: AppColors.primaryRed,
          onSecondary: Colors.white,
          error: AppColors.errorRed,
          surface: AppColors.surfaceWhite,
          onSurface: AppColors.textPrimary,
          outline: AppColors.hairline,
        );

    return MaterialApp(
      title: 'Pruebas PETROV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontWeight: FontWeight.w700),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0,
          scrolledUnderElevation: 0,
          iconTheme: IconThemeData(color: AppColors.primaryBlue),
          titleTextStyle: TextStyle(
            color: AppColors.primaryBlue,
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),
        cardTheme: CardThemeData(
          color: AppColors.surfaceWhite,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(color: AppColors.hairline),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.hairline,
          space: 1,
          thickness: 1,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.surfaceWhite,
          labelStyle: const TextStyle(color: AppColors.textSecondary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: AppColors.hairline),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: AppColors.hairline),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: AppColors.primaryBlue,
              width: 2,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryRed,
            foregroundColor: Colors.white,
            disabledBackgroundColor: AppColors.hairline,
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryBlue,
            side: const BorderSide(color: AppColors.primaryBlue),
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryBlue,
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        segmentedButtonTheme: SegmentedButtonThemeData(
          style: SegmentedButton.styleFrom(
            selectedBackgroundColor: AppColors.primaryBlue,
            selectedForegroundColor: Colors.white,
            side: const BorderSide(color: AppColors.hairline),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryRed,
          foregroundColor: Colors.white,
          extendedTextStyle: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      home: startLoggedIn ? const HomeScreen() : const LoginScreen(),
    );
  }
}
