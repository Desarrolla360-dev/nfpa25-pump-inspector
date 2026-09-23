import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../collections/inspection_record.dart';
import '../models/pump_test_model.dart';

class PdfGenerator {
  static Future<Uint8List> generateReport(InspectionRecord record) async {
    final baseFont = pw.Font.ttf(
      await rootBundle.load('assets/fonts/Inter-Regular.ttf'),
    );
    final boldFont = pw.Font.ttf(
      await rootBundle.load('assets/fonts/Inter-Bold.ttf'),
    );

    final pdf = pw.Document(
      theme: pw.ThemeData.withFont(base: baseFont, bold: boldFont),
    );

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.letter,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            _buildHeader(),
            pw.SizedBox(height: 20),
            _buildClientInfo(record),
            pw.SizedBox(height: 20),
            _buildPumpSpecs(record),
            pw.SizedBox(height: 20),
            _buildEquipmentSection(record),
            pw.SizedBox(height: 20),
            _buildResultsTable(record),
            pw.SizedBox(height: 40),
            _buildSignatures(record),
          ];
        },
      ),
    );

    return pdf.save();
  }

  static pw.Widget _buildHeader() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'PETROV',
          style: const pw.TextStyle(
            fontSize: 24,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.red800,
          ),
        ),
        pw.Text(
          'SOLUCIONES CONTRA INCENDIO',
          style: const pw.TextStyle(
            fontSize: 10,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.grey800,
          ),
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          'NFPA 25 PUMP INSPECTION REPORT (F-SER-034)',
          style: const pw.TextStyle(
            fontSize: 14,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue900,
          ),
        ),
        pw.Divider(),
      ],
    );
  }

  static pw.Widget _buildClientInfo(InspectionRecord record) {
    final dateString =
        "${record.timestamp.day}/${record.timestamp.month}/${record.timestamp.year}";
    final eq = record.equipmentData;

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'CLIENT INFORMATION',
                  style: const pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  record.companyName.isEmpty
                      ? 'N/A'
                      : record.companyName.toUpperCase(),
                ),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(
                  'DATE',
                  style: const pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 4),
                pw.Text(dateString),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        _buildInfoGrid([
          MapEntry('Contacto', eq.contactName.isEmpty ? 'N/A' : eq.contactName),
          MapEntry(
            'Ciudad y Estado',
            eq.cityState.isEmpty ? 'N/A' : eq.cityState,
          ),
          MapEntry('Sistema', eq.systemType.isEmpty ? 'N/A' : eq.systemType),
        ]),
      ],
    );
  }

  static pw.Widget _buildPumpSpecs(InspectionRecord record) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: const pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(4)),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
        children: [
          _specItem('NOMINAL FLOW', '${record.nominalGpm.toInt()} GPM'),
          _specItem('NOMINAL PRESSURE', '${record.nominalPsi.toInt()} PSI'),
          _specItem('NOMINAL SPEED', '${record.nominalRpm.toInt()} RPM'),
        ],
      ),
    );
  }

  static pw.Widget _specItem(String label, String value) {
    return pw.Column(
      children: [
        pw.Text(
          label,
          style: const pw.TextStyle(
            fontSize: 10,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 4),
        pw.Text(value, style: const pw.TextStyle(fontSize: 14)),
      ],
    );
  }

  static pw.Widget _buildEquipmentSection(InspectionRecord record) {
    final eq = record.equipmentData;
    final isDiesel = eq.motorFuelType == MotorFuelType.diesel;

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'DATOS DEL EQUIPO',
          style: const pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue900,
          ),
        ),
        pw.SizedBox(height: 6),
        _buildSectionTitle(
          'Bomba (${_orientationLabel(eq.pumpOrientation)}) — ${_approvedLabel(eq.pumpApproved)}',
        ),
        _buildInfoGrid([
          MapEntry('Marca', _orNa(eq.pumpBrand)),
          MapEntry('Modelo', _orNa(eq.pumpModel)),
          MapEntry('N° de Serie', _orNa(eq.pumpSerialNumber)),
          MapEntry(
            'Diámetro de Impulsor',
            '${eq.impellerDiameter.toStringAsFixed(2)} in',
          ),
          MapEntry(
            'Máx. Presión Desarrollada',
            '${eq.maxDevelopedPressure.toStringAsFixed(1)} PSI',
          ),
          MapEntry(
            'Presión al 150% de Capacidad',
            '${eq.pressureAt150Percent.toStringAsFixed(1)} PSI',
          ),
        ]),
        if (isDiesel) ...[
          pw.SizedBox(height: 8),
          _buildSectionTitle('Cabezal de Engranes'),
          _buildInfoGrid([
            MapEntry('Marca', _orNa(eq.gearHeadBrand)),
            MapEntry('Modelo', _orNa(eq.gearHeadModel)),
            MapEntry('N° de Serie', _orNa(eq.gearHeadSerialNumber)),
            MapEntry('Relación', _orNa(eq.gearHeadRatio)),
          ]),
        ],
        pw.SizedBox(height: 8),
        _buildSectionTitle(
          'Motor (${_fuelLabel(eq.motorFuelType)}) — ${_approvedLabel(eq.motorApproved)}',
        ),
        _buildInfoGrid([
          MapEntry('Marca', _orNa(eq.motorBrand)),
          MapEntry('Modelo', _orNa(eq.motorModel)),
          MapEntry('N° de Serie', _orNa(eq.motorSerialNumber)),
          MapEntry('RPM', eq.motorRpm.toStringAsFixed(0)),
          MapEntry('HP', eq.motorHp.toStringAsFixed(1)),
          MapEntry('Volts', eq.motorVolts.toStringAsFixed(0)),
          MapEntry('F.L.A.', eq.motorFla.toStringAsFixed(1)),
          MapEntry(
            'Factor de Servicio',
            eq.motorServiceFactor.toStringAsFixed(2),
          ),
        ]),
        pw.SizedBox(height: 8),
        _buildSectionTitle(
          'Controlador — ${_approvedLabel(eq.controllerApproved)}',
        ),
        _buildInfoGrid([
          MapEntry('Marca', _orNa(eq.controllerBrand)),
          MapEntry('Modelo', _orNa(eq.controllerModel)),
          MapEntry('N° de Serie', _orNa(eq.controllerSerialNumber)),
          MapEntry(
            'Voltaje',
            '${eq.controllerVoltage.toStringAsFixed(0)} Volts',
          ),
          MapEntry('Modo de Operación', _modeLabel(eq.operationMode)),
          MapEntry(
            'Presión de Arranque',
            '${eq.startPressure.toStringAsFixed(1)} PSI',
          ),
          MapEntry(
            'Presión de Paro',
            '${eq.stopPressure.toStringAsFixed(1)} PSI',
          ),
        ]),
        pw.SizedBox(height: 8),
        _buildSectionTitle(
          'Almacenamiento de Agua (${_storageLabel(eq.storageType)})',
        ),
        _buildInfoGrid([
          MapEntry(
            'Columna de Agua',
            '${eq.waterColumnFeet.toStringAsFixed(1)} Pies (${eq.waterColumnPsi.toStringAsFixed(1)} PSI)',
          ),
          MapEntry('Capacidad', _orNa(eq.storageCapacity)),
        ]),
      ],
    );
  }

  static String _orNa(String value) => value.isEmpty ? 'N/A' : value;

  static String _orientationLabel(PumpOrientation orientation) {
    return orientation == PumpOrientation.horizontal
        ? 'Horizontal'
        : 'Vertical';
  }

  static String _fuelLabel(MotorFuelType type) {
    return type == MotorFuelType.diesel ? 'Diésel' : 'Eléctrico';
  }

  static String _modeLabel(OperationMode mode) {
    return mode == OperationMode.manual ? 'Manual' : 'Automático';
  }

  static String _storageLabel(StorageType type) {
    return type == StorageType.tank ? 'Tanque' : 'Cisterna';
  }

  static String _approvedLabel(bool approved) =>
      approved ? 'Aprobado' : 'No Aprobado';

  static pw.Widget _buildSectionTitle(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 4),
      child: pw.Text(
        text,
        style: const pw.TextStyle(
          fontSize: 11,
          fontWeight: pw.FontWeight.bold,
          color: PdfColors.grey800,
        ),
      ),
    );
  }

  static pw.Widget _buildInfoGrid(List<MapEntry<String, String>> pairs) {
    final rows = <pw.TableRow>[];
    for (var i = 0; i < pairs.length; i += 2) {
      final second = i + 1 < pairs.length ? pairs[i + 1] : null;
      rows.add(
        pw.TableRow(
          children: [
            _infoCell(pairs[i]),
            second != null ? _infoCell(second) : pw.SizedBox(),
          ],
        ),
      );
    }

    return pw.Table(
      columnWidths: const {0: pw.FlexColumnWidth(), 1: pw.FlexColumnWidth()},
      children: rows,
    );
  }

  static pw.Widget _infoCell(MapEntry<String, String> pair) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: pw.RichText(
        text: pw.TextSpan(
          children: [
            pw.TextSpan(
              text: '${pair.key}: ',
              style: const pw.TextStyle(
                fontSize: 9,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.grey700,
              ),
            ),
            pw.TextSpan(
              text: pair.value,
              style: const pw.TextStyle(fontSize: 9),
            ),
          ],
        ),
      ),
    );
  }

  static pw.Widget _buildResultsTable(InspectionRecord record) {
    final headers = [
      'FLOW %',
      'FLOW (GPM)',
      'SUCTION (PSI)',
      'DISCHARGE (PSI)',
      'SPEED (RPM)',
      'NET (PSI)',
      'ADJUSTED (PSI)',
      'RESULT',
    ];

    final data = record.testPoints.map((p) {
      final status = p.adjustedPressure > 0
          ? (p.isPassed ? 'PASS' : 'FAIL')
          : 'N/A';
      return [
        '${p.flowPercentage}%',
        p.flowGpm.toStringAsFixed(1),
        p.suctionPressure.toStringAsFixed(1),
        p.dischargePressure.toStringAsFixed(1),
        p.speedRpm.toStringAsFixed(0),
        p.netPressure.toStringAsFixed(1),
        p.adjustedPressure.toStringAsFixed(1),
        status,
      ];
    }).toList();

    return pw.TableHelper.fromTextArray(
      headers: headers,
      data: data,
      border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
      headerStyle: const pw.TextStyle(
        fontSize: 9,
        fontWeight: pw.FontWeight.bold,
        color: PdfColors.white,
      ),
      headerDecoration: const pw.BoxDecoration(color: PdfColors.blue900),
      cellStyle: const pw.TextStyle(fontSize: 9),
      cellAlignment: pw.Alignment.center,
      cellPadding: const pw.EdgeInsets.symmetric(vertical: 6, horizontal: 2),
    );
  }

  static pw.Widget _buildSignatures(InspectionRecord record) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
      children: [
        _signatureBox('TECHNICIAN SIGNATURE', record.technicianSignature),
        _signatureBox('CLIENT SIGNATURE', record.clientSignature),
      ],
    );
  }

  static pw.Widget _signatureBox(String label, List<int>? signatureBytes) {
    return pw.Column(
      children: [
        if (signatureBytes != null && signatureBytes.isNotEmpty)
          pw.Container(
            height: 60,
            width: 150,
            child: pw.Image(
              pw.MemoryImage(Uint8List.fromList(signatureBytes)),
              fit: pw.BoxFit.contain,
            ),
          )
        else
          pw.SizedBox(height: 60, width: 150),

        pw.Container(width: 150, height: 1, color: PdfColors.black),
        pw.SizedBox(height: 4),
        pw.Text(label, style: const pw.TextStyle(fontSize: 10)),
      ],
    );
  }
}
