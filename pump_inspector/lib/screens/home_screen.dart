import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../main.dart';
import '../collections/inspection_record.dart';
import '../utils/app_colors.dart';
import '../utils/app_typography.dart';
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
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadInspections();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadInspections() async {
    final records = await isar.inspectionRecords.where().findAll();
    records.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    setState(() {
      _inspections = records;
    });
  }

  List<InspectionRecord> get _filteredInspections {
    if (_searchQuery.isEmpty) return _inspections;
    return _inspections
        .where(
          (r) =>
              r.companyName.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();
  }

  Future<bool> _confirmDelete(InspectionRecord record) async {
    final companyNameDisplay =
        record.companyName.isEmpty ? 'Cliente sin nombre' : record.companyName;
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
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

  Future<void> _goToNewInspection() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FormScreen()),
    );
    _loadInspections();
  }

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Buenos días';
    if (hour < 18) return 'Buenas tardes';
    return 'Buenas noches';
  }

  String get _formattedDate {
    final now = DateTime.now();
    const months = [
      'ENE',
      'FEB',
      'MAR',
      'ABR',
      'MAY',
      'JUN',
      'JUL',
      'AGO',
      'SEP',
      'OCT',
      'NOV',
      'DIC',
    ];
    return '${now.day.toString().padLeft(2, '0')} ${months[now.month - 1]} ${now.year}';
  }

  @override
  Widget build(BuildContext context) {
    final total = _inspections.length;
    final approved =
        _inspections
            .where((r) => r.status == InspectionStatus.approved)
            .length;
    final failed =
        _inspections.where((r) => r.status == InspectionStatus.failed).length;
    final filtered = _filteredInspections;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildHeader(),
                  const SizedBox(height: 24),
                  _buildStatsPanel(total, approved, failed),
                  const SizedBox(height: 24),
                  _buildSearchBar(),
                  const SizedBox(height: 24),
                  _buildSectionHeader(filtered.length),
                  const SizedBox(height: 16),
                ]),
              ),
            ),
            if (filtered.isEmpty && _searchQuery.isNotEmpty)
              SliverFillRemaining(
                child: _SearchEmptyState(query: _searchQuery),
              )
            else if (_inspections.isEmpty)
              SliverFillRemaining(
                child: _EmptyState(onNewInspection: _goToNewInspection),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ).copyWith(bottom: 96),
                sliver:
                    Responsive.isTablet(context)
                        ? SliverToBoxAdapter(
                          child: InspectionGrid(
                            inspections: filtered,
                            confirmDelete: _confirmDelete,
                            onDelete: _deleteInspection,
                            onTap: _openPreview,
                          ),
                        )
                        : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => InspectionCard(
                              record: filtered[index],
                              confirmDelete: _confirmDelete,
                              onDelete: _deleteInspection,
                              onTap: _openPreview,
                            ),
                            childCount: filtered.length,
                          ),
                        ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToNewInspection,
        elevation: 4,
        backgroundColor: AppColors.primaryRed,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Nueva Prueba',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _greeting,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Inspector',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: _logout,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.hairline, width: 1.5),
                ),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primaryBlue.withValues(alpha: 0.1),
                  child: const Text(
                    'P',
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _formattedDate,
              style: AppTypography.dataValue.copyWith(
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsPanel(int total, int approved, int failed) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.hairline),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            _buildStatCell(
              value: total,
              label: 'TOTAL',
              color: AppColors.primaryBlue,
              isFirst: true,
            ),
            _buildStatDivider(),
            _buildStatCell(
              value: approved,
              label: 'APROBADAS',
              color: AppColors.successGreen,
            ),
            _buildStatDivider(),
            _buildStatCell(
              value: failed,
              label: 'FALLAS',
              color: AppColors.errorRed,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCell({
    required int value,
    required String label,
    required Color color,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: isFirst ? const Radius.circular(15) : Radius.zero,
            right: isLast ? const Radius.circular(15) : Radius.zero,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value.toString(),
              style: AppTypography.dataValue.copyWith(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: color,
                height: 1,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatDivider() {
    return Container(
      width: 1,
      color: AppColors.hairline,
      margin: const EdgeInsets.symmetric(vertical: 16),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      onChanged: (v) => setState(() => _searchQuery = v),
      style: const TextStyle(fontSize: 15, color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: 'Buscar por empresa...',
        hintStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 15,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.textSecondary,
          size: 20,
        ),
        suffixIcon:
            _searchQuery.isNotEmpty
                ? IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.textSecondary,
                    size: 18,
                  ),
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _searchQuery = '');
                  },
                )
                : null,
        filled: true,
        fillColor: AppColors.surfaceWhite,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.hairline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.hairline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.primaryBlue,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'INSPECCIONES',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.textSecondary,
            letterSpacing: 1.2,
          ),
        ),
        if (count > 0)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.primaryBlue.withValues(alpha: 0.15),
              ),
            ),
            child: Text(
              '$count',
              style: AppTypography.dataValue.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onNewInspection;

  const _EmptyState({required this.onNewInspection});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.06),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryBlue.withValues(alpha: 0.12),
                width: 1.5,
              ),
            ),
            child: const Icon(
              Icons.local_fire_department,
              size: 52,
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Sin inspecciones registradas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Registra tu primera prueba de bomba\npara comenzar el historial.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onNewInspection,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryRed,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              icon: const Icon(Icons.add, size: 20),
              label: const Text(
                'Registrar Primera Prueba',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchEmptyState extends StatelessWidget {
  final String query;

  const _SearchEmptyState({required this.query});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.textSecondary.withValues(alpha: 0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search_off,
              size: 44,
              color: AppColors.textSecondary.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Sin resultados para "$query"',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Intenta con otro nombre de empresa.',
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
