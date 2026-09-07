import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../main.dart';
import '../collections/inspection_record.dart';
import '../utils/app_colors.dart';
import 'form_screen.dart';

import 'package:printing/printing.dart';

import '../utils/pdf_generator.dart';
import '../utils/responsive.dart';
import '../utils/app_typography.dart';
import '../widgets/data_plate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<InspectionRecord> _inspections = [];

  @override
  void initState() {
    super.initState();
    _loadInspections();
  }

  Future<void> _loadInspections() async {
    final records = await isar.inspectionRecords.where().findAll();
    setState(() {
      _inspections = records;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inspecciones PETROV')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Reportes Recientes',
              style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _inspections.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.assignment_outlined,
                            size: 40,
                            color: AppColors.hairline,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Aún no hay inspecciones',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Toca "Nueva Prueba" para registrar la primera.',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Responsive.isTablet(context)
                  ? _buildInspectionGrid()
                  : ListView.builder(
                      itemCount: _inspections.length,
                      itemBuilder: (context, index) {
                        return _buildInspectionCard(_inspections[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormScreen()),
          );
          _loadInspections();
        },
        backgroundColor: AppColors.primaryRed,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Nueva Prueba',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildInspectionGrid() {
    const columns = 2;
    final rowCount = (_inspections.length / columns).ceil();

    return ListView.builder(
      itemCount: rowCount,
      itemBuilder: (context, rowIndex) {
        final firstIndex = rowIndex * columns;
        final secondIndex = firstIndex + 1;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildInspectionCard(_inspections[firstIndex])),
            const SizedBox(width: 16),
            Expanded(
              child: secondIndex < _inspections.length
                  ? _buildInspectionCard(_inspections[secondIndex])
                  : const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }

  Future<bool> _confirmDelete(InspectionRecord record) async {
    final companyNameDisplay = record.companyName.isEmpty
        ? 'Cliente sin nombre'
        : record.companyName;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('¿Eliminar inspección?'),
        content: Text(
          'Se eliminará permanentemente el registro de "$companyNameDisplay". Esta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text(
              'Eliminar',
              style: TextStyle(
                color: AppColors.errorRed,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
    return confirmed ?? false;
  }

  Future<void> _deleteInspection(InspectionRecord record) async {
    await isar.writeTxn(() async {
      await isar.inspectionRecords.delete(record.id);
    });
    setState(() {
      _inspections.removeWhere((r) => r.id == record.id);
    });
  }

  Widget _buildInspectionCard(InspectionRecord record) {
    final dateString =
        "${record.timestamp.day}/${record.timestamp.month}/${record.timestamp.year}";
    final hasResults = record.testPoints.any((p) => p.adjustedPressure > 0);
    final hasFailedPoints = record.testPoints.any(
      (p) => !p.isPassed && p.adjustedPressure > 0,
    );
    final statusColor = !hasResults
        ? AppColors.pendingAmber
        : hasFailedPoints
        ? AppColors.errorRed
        : AppColors.successGreen;
    final statusLabel = !hasResults
        ? 'Pendiente'
        : hasFailedPoints
        ? 'Falla'
        : 'Aprobado';
    final companyNameDisplay = record.companyName.isEmpty
        ? 'Cliente sin nombre'
        : record.companyName;

    return Dismissible(
      key: ValueKey(record.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) => _confirmDelete(record),
      onDismissed: (_) => _deleteInspection(record),
      background: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: AppColors.errorRed,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.centerRight,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.delete, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Eliminar',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: DataPlate(
          accentColor: statusColor,
          onTap: () async {
            final pdfBytes = await PdfGenerator.generateReport(record);
            await Printing.layoutPdf(
              onLayout: (format) => pdfBytes,
              name: 'PETROV_NFPA25_${record.companyName}.pdf',
            );
          },
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      companyNameDisplay,
                      style: const TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${record.nominalGpm.toInt()} GPM | $dateString',
                      style: AppTypography.dataValue.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: statusColor.withValues(alpha: 0.4)),
                ),
                child: Text(
                  statusLabel.toUpperCase(),
                  style: AppTypography.badge.copyWith(
                    color: statusColor,
                    fontSize: 11,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, color: AppColors.primaryBlue),
            ],
          ),
        ),
      ),
    );
  }
}
