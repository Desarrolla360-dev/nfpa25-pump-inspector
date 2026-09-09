import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../main.dart';
import '../collections/inspection_record.dart';
import '../utils/app_colors.dart';
import '../utils/auth_session.dart';
import 'form_screen.dart';
import 'login_screen.dart';

import 'package:printing/printing.dart';

import '../utils/pdf_generator.dart';
import '../utils/responsive.dart';
import '../widgets/inspection_card.dart';
import '../widgets/inspection_grid.dart';

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

  Future<void> _openReport(InspectionRecord record) async {
    final pdfBytes = await PdfGenerator.generateReport(record);
    await Printing.layoutPdf(
      onLayout: (format) => pdfBytes,
      name: 'PETROV_NFPA25_${record.companyName}.pdf',
    );
  }

  Future<void> _logout() async {
    await AuthSession.logout();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Inspecciones PETROV'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar sesión',
            onPressed: _logout,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'Reportes Recientes',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: _inspections.isEmpty
                        ? const _EmptyState()
                        : Responsive.isTablet(context)
                        ? InspectionGrid(
                            inspections: _inspections,
                            confirmDelete: _confirmDelete,
                            onDelete: _deleteInspection,
                            onTap: _openReport,
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(bottom: 80),
                            itemCount: _inspections.length,
                            itemBuilder: (context, index) {
                              return InspectionCard(
                                record: _inspections[index],
                                confirmDelete: _confirmDelete,
                                onDelete: _deleteInspection,
                                onTap: _openReport,
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.05),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.assignment_outlined,
              size: 56,
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Aún no hay inspecciones',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Toca "Nueva Prueba" para registrar la primera.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
