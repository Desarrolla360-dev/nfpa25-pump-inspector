import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../collections/inspection_record.dart';
import '../models/pump_test_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_typography.dart';
import '../utils/inspection_status.dart';
import '../utils/pdf_generator.dart';
import '../widgets/pump_curve_chart.dart';

/// Read-only summary of everything captured for one inspection — client
/// info, equipment nameplate data, the 5 test points, the performance
/// chart, and the signatures. Reached by tapping a card on Home; the PDF
/// report is generated from the share button here instead of on tap.
class InspectionPreviewScreen extends StatelessWidget {
  final InspectionRecord record;

  const InspectionPreviewScreen({super.key, required this.record});

  Future<void> _sharePdf(BuildContext context) async {
    final pdfBytes = await PdfGenerator.generateReport(record);
    await Printing.layoutPdf(
      onLayout: (format) => pdfBytes,
      name: 'PETROV_NFPA25_${record.companyName}.pdf',
    );
  }

  @override
  Widget build(BuildContext context) {
    final eq = record.equipmentData;
    final status = record.status;
    final dateString =
        "${record.timestamp.day.toString().padLeft(2, '0')}/${record.timestamp.month.toString().padLeft(2, '0')}/${record.timestamp.year}";
    final testPoints = record.testPoints
        .map(
          (p) => TestPoint(
            flowPercentage: p.flowPercentage,
            flowGpm: p.flowGpm,
            speedRpm: p.speedRpm,
            dischargePressure: p.dischargePressure,
            suctionPressure: p.suctionPressure,
            netPressure: p.netPressure,
            adjustedPressure: p.adjustedPressure,
            isPassed: p.isPassed,
          ),
        )
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          record.companyName.isEmpty
              ? 'Cliente sin nombre'
              : record.companyName,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            tooltip: 'Compartir PDF',
            onPressed: () => _sharePdf(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionCard(
            title: 'Datos Generales',
            trailing: _StatusPill(status: status),
            rows: [
              _InfoRow('Fecha', dateString),
              _InfoRow('Contacto', _orNa(eq.contactName)),
              _InfoRow('Ciudad y Estado', _orNa(eq.cityState)),
              _InfoRow('Sistema', _orNa(eq.systemType)),
            ],
          ),
          const SizedBox(height: 12),
          _SectionCard(
            title: 'Bomba',
            trailing: _ApprovedPill(approved: eq.pumpApproved),
            rows: [
              _InfoRow(
                'Orientación',
                eq.pumpOrientation == PumpOrientation.horizontal
                    ? 'Horizontal'
                    : 'Vertical',
              ),
              _InfoRow('Marca', _orNa(eq.pumpBrand)),
              _InfoRow('Modelo', _orNa(eq.pumpModel)),
              _InfoRow('N° de Serie', _orNa(eq.pumpSerialNumber)),
              _InfoRow(
                'Diámetro de Impulsor',
                '${eq.impellerDiameter.toStringAsFixed(2)} in',
              ),
              _InfoRow('Flujo Nominal', '${record.nominalGpm.toInt()} GPM'),
              _InfoRow('Presión Nominal', '${record.nominalPsi.toInt()} PSI'),
              _InfoRow('Vel. Nominal', '${record.nominalRpm.toInt()} RPM'),
              _InfoRow(
                'Máx. Presión Desarrollada',
                '${eq.maxDevelopedPressure.toStringAsFixed(1)} PSI',
              ),
              _InfoRow(
                'Presión al 150%',
                '${eq.pressureAt150Percent.toStringAsFixed(1)} PSI',
              ),
            ],
          ),
          const SizedBox(height: 12),
          _SectionCard(
            title: 'Motor',
            trailing: _ApprovedPill(approved: eq.motorApproved),
            rows: [
              _InfoRow(
                'Tipo',
                eq.motorFuelType == MotorFuelType.diesel
                    ? 'Diésel'
                    : 'Eléctrico',
              ),
              _InfoRow('Marca', _orNa(eq.motorBrand)),
              _InfoRow('Modelo', _orNa(eq.motorModel)),
              _InfoRow('N° de Serie', _orNa(eq.motorSerialNumber)),
              _InfoRow('RPM', eq.motorRpm.toStringAsFixed(0)),
              _InfoRow('HP', eq.motorHp.toStringAsFixed(1)),
              _InfoRow('Volts', eq.motorVolts.toStringAsFixed(0)),
              _InfoRow('F.L.A.', eq.motorFla.toStringAsFixed(1)),
              _InfoRow(
                'Factor de Servicio',
                eq.motorServiceFactor.toStringAsFixed(2),
              ),
            ],
          ),
          if (eq.motorFuelType == MotorFuelType.diesel) ...[
            const SizedBox(height: 12),
            _SectionCard(
              title: 'Cabezal de Engranes',
              rows: [
                _InfoRow('Marca', _orNa(eq.gearHeadBrand)),
                _InfoRow('Modelo', _orNa(eq.gearHeadModel)),
                _InfoRow('N° de Serie', _orNa(eq.gearHeadSerialNumber)),
                _InfoRow('Relación', _orNa(eq.gearHeadRatio)),
              ],
            ),
          ],
          const SizedBox(height: 12),
          _SectionCard(
            title: 'Controlador',
            trailing: _ApprovedPill(approved: eq.controllerApproved),
            rows: [
              _InfoRow('Marca', _orNa(eq.controllerBrand)),
              _InfoRow('Modelo', _orNa(eq.controllerModel)),
              _InfoRow('N° de Serie', _orNa(eq.controllerSerialNumber)),
              _InfoRow(
                'Voltaje',
                '${eq.controllerVoltage.toStringAsFixed(0)} Volts',
              ),
              _InfoRow(
                'Modo',
                eq.operationMode == OperationMode.manual
                    ? 'Manual'
                    : 'Automático',
              ),
              _InfoRow(
                'Presión de Arranque',
                '${eq.startPressure.toStringAsFixed(1)} PSI',
              ),
              _InfoRow(
                'Presión de Paro',
                '${eq.stopPressure.toStringAsFixed(1)} PSI',
              ),
            ],
          ),
          const SizedBox(height: 12),
          _SectionCard(
            title: 'Almacenamiento de Agua',
            rows: [
              _InfoRow(
                'Tipo',
                eq.storageType == StorageType.tank ? 'Tanque' : 'Cisterna',
              ),
              _InfoRow(
                'Columna de Agua',
                '${eq.waterColumnFeet.toStringAsFixed(1)} Pies (${eq.waterColumnPsi.toStringAsFixed(1)} PSI)',
              ),
              _InfoRow('Capacidad', _orNa(eq.storageCapacity)),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Resultados de la Prueba',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          ...record.testPoints.map((p) => _TestPointResultCard(point: p)),
          const SizedBox(height: 20),
          const Text(
            'Gráfica de Rendimiento',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          PumpCurveChart(
            testPoints: testPoints,
            nominalGpm: record.nominalGpm,
            nominalPsi: record.nominalPsi,
            maxDevelopedPressure: eq.maxDevelopedPressure,
            pressureAt150Percent: eq.pressureAt150Percent,
          ),
          const SizedBox(height: 20),
          const Text(
            'Firmas',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _SignatureBox(
                  label: 'Técnico',
                  bytes: record.technicianSignature,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _SignatureBox(
                  label: 'Cliente',
                  bytes: record.clientSignature,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

String _orNa(String value) => value.isEmpty ? 'N/A' : value;

class _InfoRow {
  final String label;
  final String value;
  const _InfoRow(this.label, this.value);
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final List<_InfoRow> rows;

  const _SectionCard({required this.title, this.trailing, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: AppColors.hairline.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryBlue,
                ),
              ),
              ?trailing,
            ],
          ),
          const SizedBox(height: 12),
          for (final row in rows) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      row.label,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      row.value,
                      textAlign: TextAlign.end,
                      style: AppTypography.dataValue.copyWith(
                        fontSize: 13,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ApprovedPill extends StatelessWidget {
  final bool approved;
  const _ApprovedPill({required this.approved});

  @override
  Widget build(BuildContext context) {
    final color = approved ? AppColors.successGreen : AppColors.errorRed;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        approved ? 'Aprobado' : 'No Aprobado',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final InspectionStatus status;
  const _StatusPill({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: status.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _TestPointResultCard extends StatelessWidget {
  final PointRecord point;
  const _TestPointResultCard({required this.point});

  @override
  Widget build(BuildContext context) {
    final hasResult = point.adjustedPressure > 0;
    final statusColor = !hasResult
        ? AppColors.pendingAmber
        : point.isPassed
        ? AppColors.successGreen
        : AppColors.errorRed;
    final statusLabel = !hasResult
        ? 'PENDIENTE'
        : (point.isPassed ? 'PASS' : 'FAIL');

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.hairline.withValues(alpha: 0.6)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flujo al ${point.flowPercentage}%',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${point.flowGpm.toStringAsFixed(0)} GPM · ${point.speedRpm.toStringAsFixed(0)} RPM',
                  style: AppTypography.dataValue.copyWith(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  'Neta ${point.netPressure.toStringAsFixed(1)} PSI · Ajustada ${point.adjustedPressure.toStringAsFixed(1)} PSI',
                  style: AppTypography.dataValue.copyWith(
                    fontSize: 12,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              statusLabel,
              style: AppTypography.badge.copyWith(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignatureBox extends StatelessWidget {
  final String label;
  final List<int>? bytes;
  const _SignatureBox({required this.label, required this.bytes});

  @override
  Widget build(BuildContext context) {
    final hasSignature = bytes != null && bytes!.isNotEmpty;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.hairline.withValues(alpha: 0.6)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 80,
            child: hasSignature
                ? Image.memory(Uint8List.fromList(bytes!), fit: BoxFit.contain)
                : Center(
                    child: Text(
                      'Sin firma',
                      style: TextStyle(
                        color: AppColors.textSecondary.withValues(alpha: 0.6),
                        fontSize: 12,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
