import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/currency_format.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/heatmap.dart';
import '../controller/analytics_controller.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsAsync = ref.watch(analyticsOverviewProvider);
    return AppScaffold(
      title: 'Analytics',
      body: analyticsAsync.when(
        data: (data) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Plan vs fact', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 12),
                    _buildMetric(context, 'Plan', formatCurrency(data.planned), AppColors.planBlue),
                    const SizedBox(height: 8),
                    _buildMetric(context, 'Unplanned', formatCurrency(data.unplanned), AppColors.unplannedAmber),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Heatmap', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SpendingHeatmap(values: data.heatmap),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildMetric(BuildContext context, String label, String value, Color color) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 12),
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
        const Spacer(),
        Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
