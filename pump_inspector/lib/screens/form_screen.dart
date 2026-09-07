import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:signature/signature.dart';

import '../models/pump_test_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_typography.dart';
import '../providers/pump_test_provider.dart';
import '../widgets/pump_curve_chart.dart';
import '../widgets/signature_pad.dart';
import '../widgets/data_plate.dart';
import '../utils/responsive.dart';

class FormScreen extends ConsumerStatefulWidget {
  const FormScreen({super.key});

  @override
  ConsumerState<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends ConsumerState<FormScreen> {
  int _currentStep = 0;

  // Cliente
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _cityStateController = TextEditingController();
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _systemTypeController = TextEditingController();

  // Bomba
  final TextEditingController _gpmController = TextEditingController();
  final TextEditingController _psiController = TextEditingController();
  final TextEditingController _rpmController = TextEditingController();
  final TextEditingController _pumpBrandController = TextEditingController();
  final TextEditingController _pumpModelController = TextEditingController();
  final TextEditingController _pumpSerialController = TextEditingController();
  final TextEditingController _impellerDiameterController =
      TextEditingController();
  final TextEditingController _maxDevelopedPressureController =
      TextEditingController();
  final TextEditingController _pressureAt150Controller =
      TextEditingController();

  // Motor
  final TextEditingController _motorBrandController = TextEditingController();
  final TextEditingController _motorModelController = TextEditingController();
  final TextEditingController _motorSerialController = TextEditingController();
  final TextEditingController _motorRpmController = TextEditingController();
  final TextEditingController _motorHpController = TextEditingController();
  final TextEditingController _motorVoltsController = TextEditingController();
  final TextEditingController _motorFlaController = TextEditingController();
  final TextEditingController _motorServiceFactorController =
      TextEditingController();

  // Cabezal de engranes (solo diésel)
  final TextEditingController _gearHeadBrandController =
      TextEditingController();
  final TextEditingController _gearHeadModelController =
      TextEditingController();
  final TextEditingController _gearHeadSerialController =
      TextEditingController();
  final TextEditingController _gearHeadRatioController =
      TextEditingController();

  // Controlador
  final TextEditingController _controllerBrandController =
      TextEditingController();
  final TextEditingController _controllerModelController =
      TextEditingController();
  final TextEditingController _controllerVoltageController =
      TextEditingController();
  final TextEditingController _controllerSerialController =
      TextEditingController();
  final TextEditingController _startPressureController =
      TextEditingController();
  final TextEditingController _stopPressureController = TextEditingController();

  // Almacenamiento
  final TextEditingController _waterColumnController = TextEditingController();
  final TextEditingController _storageCapacityController =
      TextEditingController();

  final SignatureController _techSignatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
  );

  final SignatureController _clientSignatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
  );

  @override
  void dispose() {
    _companyController.dispose();
    _cityStateController.dispose();
    _contactNameController.dispose();
    _systemTypeController.dispose();
    _gpmController.dispose();
    _psiController.dispose();
    _rpmController.dispose();
    _pumpBrandController.dispose();
    _pumpModelController.dispose();
    _pumpSerialController.dispose();
    _impellerDiameterController.dispose();
    _maxDevelopedPressureController.dispose();
    _pressureAt150Controller.dispose();
    _motorBrandController.dispose();
    _motorModelController.dispose();
    _motorSerialController.dispose();
    _motorRpmController.dispose();
    _motorHpController.dispose();
    _motorVoltsController.dispose();
    _motorFlaController.dispose();
    _motorServiceFactorController.dispose();
    _gearHeadBrandController.dispose();
    _gearHeadModelController.dispose();
    _gearHeadSerialController.dispose();
    _gearHeadRatioController.dispose();
    _controllerBrandController.dispose();
    _controllerModelController.dispose();
    _controllerVoltageController.dispose();
    _controllerSerialController.dispose();
    _startPressureController.dispose();
    _stopPressureController.dispose();
    _waterColumnController.dispose();
    _storageCapacityController.dispose();
    _techSignatureController.dispose();
    _clientSignatureController.dispose();
    super.dispose();
  }

  void _updateNominalData() {
    final gpm = double.tryParse(_gpmController.text) ?? 0.0;
    final psi = double.tryParse(_psiController.text) ?? 0.0;
    final rpm = double.tryParse(_rpmController.text) ?? 0.0;

    ref
        .read(pumpTestProvider.notifier)
        .updateNominalData(gpm: gpm, psi: psi, rpm: rpm);
  }

  void _updateEquipment(EquipmentData Function(EquipmentData current) update) {
    final current = ref.read(pumpTestProvider).equipmentData;
    ref.read(pumpTestProvider.notifier).updateEquipmentData(update(current));
  }

  @override
  Widget build(BuildContext context) {
    final testState = ref.watch(pumpTestProvider);
    final equipment = testState.equipmentData;

    const lastStepIndex = 7;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Prueba NFPA 25'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: () async {
          if (_currentStep == 1) {
            _updateNominalData();
          }

          if (_currentStep < lastStepIndex) {
            setState(() {
              _currentStep += 1;
            });
          } else {
            final techSig = await _techSignatureController.toPngBytes();
            final clientSig = await _clientSignatureController.toPngBytes();

            await ref
                .read(pumpTestProvider.notifier)
                .saveInspectionToDatabase(
                  techSignature: techSig?.toList(),
                  clientSig: clientSig?.toList(),
                );

            if (!context.mounted) return;
            final navigator = Navigator.of(context);
            final messenger = ScaffoldMessenger.of(context);
            navigator.pop();
            messenger.showSnackBar(
              const SnackBar(content: Text('Inspección guardada exitosamente')),
            );
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(
                      _currentStep == lastStepIndex ? 'Finalizar' : 'Siguiente',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                if (_currentStep > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Atrás'),
                    ),
                  ),
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text('Cliente'),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            content: _buildClienteStep(),
          ),
          Step(
            title: const Text('Bomba'),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            content: _buildBombaStep(equipment),
          ),
          Step(
            title: const Text('Motor'),
            isActive: _currentStep >= 2,
            state: _currentStep > 2 ? StepState.complete : StepState.indexed,
            content: _buildMotorStep(equipment),
          ),
          Step(
            title: const Text('Controlador'),
            isActive: _currentStep >= 3,
            state: _currentStep > 3 ? StepState.complete : StepState.indexed,
            content: _buildControladorStep(equipment),
          ),
          Step(
            title: const Text('Almacenamiento'),
            isActive: _currentStep >= 4,
            state: _currentStep > 4 ? StepState.complete : StepState.indexed,
            content: _buildAlmacenamientoStep(equipment),
          ),
          Step(
            title: const Text('Prueba'),
            isActive: _currentStep >= 5,
            state: _currentStep > 5 ? StepState.complete : StepState.indexed,
            content: _buildPruebaStep(testState),
          ),
          Step(
            title: const Text('Gráfica'),
            isActive: _currentStep >= 6,
            state: _currentStep > 6 ? StepState.complete : StepState.indexed,
            content: _buildGraficaStep(testState, equipment),
          ),
          Step(
            title: const Text('Firmas'),
            isActive: _currentStep >= lastStepIndex,
            content: _buildFirmasStep(),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Cliente
  // ---------------------------------------------------------------------

  Widget _buildClienteStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Datos Generales'),
        const SizedBox(height: 16),
        TextFormField(
          controller: _companyController,
          onChanged: (value) {
            ref.read(pumpTestProvider.notifier).updateCompanyInfo(value);
          },
          decoration: const InputDecoration(labelText: 'Nombre de la empresa'),
        ),
        const SizedBox(height: 16),
        _responsiveRow([
          _textField(
            controller: _contactNameController,
            label: 'Nombre del contacto',
            onChanged: (v) =>
                _updateEquipment((e) => e.copyWith(contactName: v)),
          ),
          _textField(
            controller: _cityStateController,
            label: 'Ciudad y Estado',
            onChanged: (v) => _updateEquipment((e) => e.copyWith(cityState: v)),
          ),
        ]),
        const SizedBox(height: 16),
        _textField(
          controller: _systemTypeController,
          label: 'Sistema (ej. Bomba Eléctrica)',
          onChanged: (v) => _updateEquipment((e) => e.copyWith(systemType: v)),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Bomba
  // ---------------------------------------------------------------------

  Widget _buildBombaStep(EquipmentData equipment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Identificación de la Bomba'),
        const SizedBox(height: 16),
        _segmentedField<PumpOrientation>(
          label: 'Orientación',
          value: equipment.pumpOrientation,
          options: const [
            (PumpOrientation.horizontal, 'Horizontal'),
            (PumpOrientation.vertical, 'Vertical'),
          ],
          onChanged: (v) =>
              _updateEquipment((e) => e.copyWith(pumpOrientation: v)),
        ),
        const SizedBox(height: 16),
        _responsiveRow([
          _textField(
            controller: _pumpBrandController,
            label: 'Marca',
            onChanged: (v) => _updateEquipment((e) => e.copyWith(pumpBrand: v)),
          ),
          _textField(
            controller: _pumpModelController,
            label: 'Modelo',
            onChanged: (v) => _updateEquipment((e) => e.copyWith(pumpModel: v)),
          ),
          _textField(
            controller: _pumpSerialController,
            label: 'N° de Serie',
            onChanged: (v) =>
                _updateEquipment((e) => e.copyWith(pumpSerialNumber: v)),
          ),
        ]),
        const SizedBox(height: 16),
        _textField(
          controller: _impellerDiameterController,
          label: 'Diámetro de Impulsor',
          suffixText: 'in',
          numeric: true,
          onChanged: (v) => _updateEquipment(
            (e) => e.copyWith(impellerDiameter: double.tryParse(v) ?? 0.0),
          ),
        ),
        const SizedBox(height: 24),
        _sectionTitle('Datos Nominales'),
        const SizedBox(height: 16),
        _responsiveRow([
          _textField(
            controller: _gpmController,
            label: 'Flujo Nominal (GPM)',
            suffixText: 'GPM',
            numeric: true,
          ),
          _textField(
            controller: _psiController,
            label: 'Presión Nominal (PSI)',
            suffixText: 'PSI',
            numeric: true,
          ),
          _textField(
            controller: _rpmController,
            label: 'Vel. Nominal (RPM)',
            suffixText: 'RPM',
            numeric: true,
          ),
        ]),
        const SizedBox(height: 16),
        _responsiveRow([
          _textField(
            controller: _maxDevelopedPressureController,
            label: 'Máxima Presión Desarrollada',
            suffixText: 'PSI',
            numeric: true,
            onChanged: (v) => _updateEquipment(
              (e) =>
                  e.copyWith(maxDevelopedPressure: double.tryParse(v) ?? 0.0),
            ),
          ),
          _textField(
            controller: _pressureAt150Controller,
            label: 'Presión al 150% de Capacidad',
            suffixText: 'PSI',
            numeric: true,
            onChanged: (v) => _updateEquipment(
              (e) =>
                  e.copyWith(pressureAt150Percent: double.tryParse(v) ?? 0.0),
            ),
          ),
        ]),
        const SizedBox(height: 16),
        _segmentedField<bool>(
          label: 'Estado de la Bomba',
          value: equipment.pumpApproved,
          options: const [(true, 'Aprobada'), (false, 'No Aprobada')],
          onChanged: (v) =>
              _updateEquipment((e) => e.copyWith(pumpApproved: v)),
        ),
        const SizedBox(height: 24),
        _segmentedField<MotorFuelType>(
          label: 'Tipo de Motor que Impulsa la Bomba',
          value: equipment.motorFuelType,
          options: const [
            (MotorFuelType.diesel, 'Diésel'),
            (MotorFuelType.electric, 'Eléctrico'),
          ],
          onChanged: (v) =>
              _updateEquipment((e) => e.copyWith(motorFuelType: v)),
        ),
        if (equipment.motorFuelType == MotorFuelType.diesel) ...[
          const SizedBox(height: 24),
          _sectionTitle('Cabezal de Engranes'),
          const SizedBox(height: 16),
          _responsiveRow([
            _textField(
              controller: _gearHeadBrandController,
              label: 'Marca',
              onChanged: (v) =>
                  _updateEquipment((e) => e.copyWith(gearHeadBrand: v)),
            ),
            _textField(
              controller: _gearHeadModelController,
              label: 'Modelo',
              onChanged: (v) =>
                  _updateEquipment((e) => e.copyWith(gearHeadModel: v)),
            ),
          ]),
          const SizedBox(height: 16),
          _responsiveRow([
            _textField(
              controller: _gearHeadSerialController,
              label: 'N° de Serie',
              onChanged: (v) =>
                  _updateEquipment((e) => e.copyWith(gearHeadSerialNumber: v)),
            ),
            _textField(
              controller: _gearHeadRatioController,
              label: 'Relación',
              onChanged: (v) =>
                  _updateEquipment((e) => e.copyWith(gearHeadRatio: v)),
            ),
          ]),
        ],
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Motor
  // ---------------------------------------------------------------------

  Widget _buildMotorStep(EquipmentData equipment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Datos del Motor'),
        const SizedBox(height: 4),
        Text(
          'Tipo: ${equipment.motorFuelType == MotorFuelType.diesel ? 'Diésel' : 'Eléctrico'} '
          '(se define en el paso "Bomba")',
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 16),
        _responsiveRow([
          _textField(
            controller: _motorBrandController,
            label: 'Marca',
            onChanged: (v) =>
                _updateEquipment((e) => e.copyWith(motorBrand: v)),
          ),
          _textField(
            controller: _motorModelController,
            label: 'Modelo',
            onChanged: (v) =>
                _updateEquipment((e) => e.copyWith(motorModel: v)),
          ),
          _textField(
            controller: _motorSerialController,
            label: 'N° de Serie',
            onChanged: (v) =>
                _updateEquipment((e) => e.copyWith(motorSerialNumber: v)),
          ),
        ]),
        const SizedBox(height: 16),
        _responsiveRow([
          _textField(
            controller: _motorRpmController,
            label: 'RPM',
            numeric: true,
            onChanged: (v) => _updateEquipment(
              (e) => e.copyWith(motorRpm: double.tryParse(v) ?? 0.0),
            ),
          ),
          _textField(
            controller: _motorHpController,
            label: 'HP',
            numeric: true,
            onChanged: (v) => _updateEquipment(
              (e) => e.copyWith(motorHp: double.tryParse(v) ?? 0.0),
            ),
          ),
          _textField(
            controller: _motorVoltsController,
            label: 'Volts',
            numeric: true,
            onChanged: (v) => _updateEquipment(
              (e) => e.copyWith(motorVolts: double.tryParse(v) ?? 0.0),
            ),
          ),
        ]),
        const SizedBox(height: 16),
        _responsiveRow([
          _textField(
            controller: _motorFlaController,
            label: 'F.L.A.',
            numeric: true,
            onChanged: (v) => _updateEquipment(
              (e) => e.copyWith(motorFla: double.tryParse(v) ?? 0.0),
            ),
          ),
          _textField(
            controller: _motorServiceFactorController,
            label: 'Factor de Servicio',
            numeric: true,
            onChanged: (v) => _updateEquipment(
              (e) => e.copyWith(motorServiceFactor: double.tryParse(v) ?? 0.0),
            ),
          ),
        ]),
        const SizedBox(height: 16),
        _segmentedField<bool>(
          label: 'Estado del Motor',
          value: equipment.motorApproved,
          options: const [(true, 'Aprobado'), (false, 'No Aprobado')],
          onChanged: (v) =>
              _updateEquipment((e) => e.copyWith(motorApproved: v)),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Controlador
  // ---------------------------------------------------------------------

  Widget _buildControladorStep(EquipmentData equipment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Datos del Controlador'),
        const SizedBox(height: 16),
        _responsiveRow([
          _textField(
            controller: _controllerBrandController,
            label: 'Marca',
            onChanged: (v) =>
                _updateEquipment((e) => e.copyWith(controllerBrand: v)),
          ),
          _textField(
            controller: _controllerModelController,
            label: 'Modelo',
            onChanged: (v) =>
                _updateEquipment((e) => e.copyWith(controllerModel: v)),
          ),
          _textField(
            controller: _controllerSerialController,
            label: 'N° de Serie',
            onChanged: (v) =>
                _updateEquipment((e) => e.copyWith(controllerSerialNumber: v)),
          ),
        ]),
        const SizedBox(height: 16),
        _textField(
          controller: _controllerVoltageController,
          label: 'Voltaje',
          suffixText: 'Volts',
          numeric: true,
          onChanged: (v) => _updateEquipment(
            (e) => e.copyWith(controllerVoltage: double.tryParse(v) ?? 0.0),
          ),
        ),
        const SizedBox(height: 16),
        _segmentedField<OperationMode>(
          label: 'Modo de Operación',
          value: equipment.operationMode,
          options: const [
            (OperationMode.manual, 'Manual'),
            (OperationMode.automatic, 'Automático'),
          ],
          onChanged: (v) =>
              _updateEquipment((e) => e.copyWith(operationMode: v)),
        ),
        const SizedBox(height: 16),
        _responsiveRow([
          _textField(
            controller: _startPressureController,
            label: 'Presión de Arranque',
            suffixText: 'PSI',
            numeric: true,
            onChanged: (v) => _updateEquipment(
              (e) => e.copyWith(startPressure: double.tryParse(v) ?? 0.0),
            ),
          ),
          _textField(
            controller: _stopPressureController,
            label: 'Presión de Paro',
            suffixText: 'PSI',
            numeric: true,
            onChanged: (v) => _updateEquipment(
              (e) => e.copyWith(stopPressure: double.tryParse(v) ?? 0.0),
            ),
          ),
        ]),
        const SizedBox(height: 16),
        _segmentedField<bool>(
          label: 'Estado del Controlador',
          value: equipment.controllerApproved,
          options: const [(true, 'Aprobado'), (false, 'No Aprobado')],
          onChanged: (v) =>
              _updateEquipment((e) => e.copyWith(controllerApproved: v)),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Almacenamiento
  // ---------------------------------------------------------------------

  Widget _buildAlmacenamientoStep(EquipmentData equipment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Almacenamiento de Agua'),
        const SizedBox(height: 16),
        _segmentedField<StorageType>(
          label: 'Tipo',
          value: equipment.storageType,
          options: const [
            (StorageType.tank, 'Tanque'),
            (StorageType.cistern, 'Cisterna'),
          ],
          onChanged: (v) => _updateEquipment((e) => e.copyWith(storageType: v)),
        ),
        const SizedBox(height: 16),
        _textField(
          controller: _waterColumnController,
          label: 'Columna de Agua',
          suffixText: 'Pies',
          numeric: true,
          onChanged: (v) => _updateEquipment(
            (e) => e.copyWith(waterColumnFeet: double.tryParse(v) ?? 0.0),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '≈ ${equipment.waterColumnPsi.toStringAsFixed(1)} PSI',
          style: AppTypography.dataValue.copyWith(
            color: AppColors.textSecondary,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 16),
        _textField(
          controller: _storageCapacityController,
          label: 'Capacidad (ej. 400 M3)',
          onChanged: (v) =>
              _updateEquipment((e) => e.copyWith(storageCapacity: v)),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Prueba
  // ---------------------------------------------------------------------

  Widget _buildPruebaStep(dynamic testState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Captura Hidráulica'),
        const SizedBox(height: 16),
        Builder(
          builder: (context) {
            if (!Responsive.isTablet(context)) {
              return Column(
                children: List.generate(testState.testPoints.length, (index) {
                  return _buildTestPointCard(
                    index,
                    testState.testPoints[index],
                  );
                }),
              );
            }

            final rows = <Widget>[];
            for (var i = 0; i < testState.testPoints.length; i += 2) {
              final hasSecond = i + 1 < testState.testPoints.length;
              rows.add(
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildTestPointCard(i, testState.testPoints[i]),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: hasSecond
                          ? _buildTestPointCard(
                              i + 1,
                              testState.testPoints[i + 1],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              );
            }
            return Column(children: rows);
          },
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Gráfica
  // ---------------------------------------------------------------------

  Widget _buildGraficaStep(dynamic testState, EquipmentData equipment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Análisis de Rendimiento'),
        const SizedBox(height: 16),
        PumpCurveChart(
          testPoints: testState.testPoints,
          nominalGpm: testState.nominalGpm,
          nominalPsi: testState.nominalPsi,
          maxDevelopedPressure: equipment.maxDevelopedPressure,
          pressureAt150Percent: equipment.pressureAt150Percent,
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Container(width: 12, height: 12, color: AppColors.primaryBlue),
            const SizedBox(width: 8),
            const Text('Curva Nominal'),
            const SizedBox(width: 16),
            Container(width: 12, height: 12, color: AppColors.pendingAmber),
            const SizedBox(width: 8),
            const Text('Límite NFPA 25 (-5%)'),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(width: 12, height: 12, color: AppColors.primaryRed),
            const SizedBox(width: 8),
            const Text('Desempeño Real'),
          ],
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Firmas
  // ---------------------------------------------------------------------

  Widget _buildFirmasStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Validación y Firmas'),
        const SizedBox(height: 16),
        Builder(
          builder: (context) {
            final techPad = SignaturePad(
              controller: _techSignatureController,
              label: 'Firma del Técnico',
            );
            final clientPad = SignaturePad(
              controller: _clientSignatureController,
              label: 'Firma del Cliente',
            );

            if (Responsive.isTablet(context)) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: techPad),
                  const SizedBox(width: 24),
                  Expanded(child: clientPad),
                ],
              );
            }

            return Column(
              children: [techPad, const SizedBox(height: 24), clientPad],
            );
          },
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Helpers de UI compartidos entre pasos
  // ---------------------------------------------------------------------

  /// Arma los campos en una fila (tablet) o apilados (teléfono), separados
  /// consistentemente, para no repetir el patrón Responsive en cada paso.
  Widget _responsiveRow(List<Widget> fields) {
    return Builder(
      builder: (context) {
        if (!Responsive.isTablet(context)) {
          return Column(
            children: [
              for (var i = 0; i < fields.length; i++) ...[
                if (i > 0) const SizedBox(height: 16),
                fields[i],
              ],
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < fields.length; i++) ...[
              if (i > 0) const SizedBox(width: 16),
              Expanded(child: fields[i]),
            ],
          ],
        );
      },
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String label,
    String? suffixText,
    bool numeric = false,
    ValueChanged<String>? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: numeric ? TextInputType.number : TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(labelText: label, suffixText: suffixText),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Oswald',
        fontSize: 19,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryBlue,
        letterSpacing: 0.2,
      ),
    );
  }

  Widget _segmentedField<T>({
    required String label,
    required T value,
    required List<(T, String)> options,
    required ValueChanged<T> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        SegmentedButton<T>(
          segments: [
            for (final option in options)
              ButtonSegment<T>(value: option.$1, label: Text(option.$2)),
          ],
          selected: {value},
          onSelectionChanged: (selection) => onChanged(selection.first),
        ),
      ],
    );
  }

  Widget _buildTestPointCard(int index, dynamic point) {
    final pointStatusColor = point.adjustedPressure > 0
        ? (point.isPassed ? AppColors.successGreen : AppColors.errorRed)
        : AppColors.pendingAmber;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DataPlate(
        accentColor: pointStatusColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Flujo al ${point.flowPercentage}%',
                  style: const TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryBlue,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: point.adjustedPressure > 0
                        ? (point.isPassed
                              ? AppColors.successGreen
                              : AppColors.errorRed)
                        : AppColors.pendingAmber,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    point.adjustedPressure > 0
                        ? (point.isPassed ? 'PASS' : 'FAIL')
                        : 'PENDIENTE',
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
                    onChanged: (value) =>
                        _updatePoint(index, point, flowGpm: value),
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
                    onChanged: (value) =>
                        _updatePoint(index, point, suction: value),
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
                    onChanged: (value) =>
                        _updatePoint(index, point, discharge: value),
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
                    onChanged: (value) =>
                        _updatePoint(index, point, rpm: value),
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

  void _updatePoint(
    int index,
    dynamic point, {
    String? flowGpm,
    String? suction,
    String? discharge,
    String? rpm,
  }) {
    ref
        .read(pumpTestProvider.notifier)
        .updateTestPoint(
          index: index,
          flowGpm: double.tryParse(flowGpm ?? point.flowGpm.toString()) ?? 0.0,
          suctionPressure:
              double.tryParse(suction ?? point.suctionPressure.toString()) ??
              0.0,
          dischargePressure:
              double.tryParse(
                discharge ?? point.dischargePressure.toString(),
              ) ??
              0.0,
          speedRpm: double.tryParse(rpm ?? point.speedRpm.toString()) ?? 0.0,
        );
  }
}
