import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../main.dart';
import '../collections/inspection_record.dart';
import '../utils/app_colors.dart';
import '../utils/auth_session.dart';
import '../utils/inspection_status.dart';
import 'form_screen.dart';
import 'login_screen.dart';

import '../utils/responsive.dart';
import '../widgets/inspection_card.dart';
import '../widgets/inspection_grid.dart';
import 'inspection_preview_screen.dart';

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
    // Sort inspections so the most recent is first
    final records = await isar.inspectionRecords.where().findAll();
    records.sort((a, b) => b.timestamp.compareTo(a.timestamp));
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('¿Eliminar inspección?'),
        content: Text(
          'Se eliminará permanentemente el registro de "$companyNameDisplay". Esta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.errorRed,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Eliminar'),
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

  void _openPreview(InspectionRecord record) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InspectionPreviewScreen(record: record),
      ),
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

  Widget _buildOverviewCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 24),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int total = _inspections.length;
    int approved = _inspections
        .where((r) => r.status == InspectionStatus.approved)
        .length;
    int failed = _inspections
        .where((r) => r.status == InspectionStatus.failed)
        .length;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(24.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Panel PETROV',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Resumen',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: _logout,
                        icon: const Icon(
                          Icons.logout,
                          color: AppColors.primaryBlue,
                          size: 28,
                        ),
                        tooltip: 'Cerrar sesión',
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      _buildOverviewCard(
                        'Total',
                        total.toString(),
                        Icons.assignment_outlined,
                        AppColors.primaryBlue,
                      ),
                      const SizedBox(width: 12),
                      _buildOverviewCard(
                        'Aprobadas',
                        approved.toString(),
                        Icons.check_circle_outline,
                        AppColors.successGreen,
                      ),
                      const SizedBox(width: 12),
                      _buildOverviewCard(
                        'Fallas',
                        failed.toString(),
                        Icons.error_outline,
                        AppColors.errorRed,
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  const Text(
                    'Inspecciones Recientes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                ]),
              ),
            ),
            if (_inspections.isEmpty)
              const SliverFillRemaining(child: _EmptyState())
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0)
                    .copyWith(bottom: 80),
                sliver: Responsive.isTablet(context)
                    ? SliverToBoxAdapter(
                        child: InspectionGrid(
                          inspections: _inspections,
                          confirmDelete: _confirmDelete,
                          onDelete: _deleteInspection,
                          onTap: _openPreview,
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return InspectionCard(
                            record: _inspections[index],
                            confirmDelete: _confirmDelete,
                            onDelete: _deleteInspection,
                            onTap: _openPreview,
                          );
                        }, childCount: _inspections.length),
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
        elevation: 6,
        backgroundColor: AppColors.primaryRed,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Nueva Prueba',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
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
              color: AppColors.textSecondary.withValues(alpha: 0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.inbox_outlined,
              size: 56,
              color: AppColors.textSecondary.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Bandeja vacía',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Aún no has registrado ninguna prueba.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
