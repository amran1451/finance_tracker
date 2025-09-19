import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/date_format.dart';
import '../../common/widgets/empty_state.dart';
import '../../common/widgets/period_pill.dart';
import '../../common/widgets/plan_badge.dart';
import '../../common/widgets/spending_chart.dart';
import '../controller/home_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(homeDashboardProvider);
    return dashboardAsync.when(
      data: (data) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              title: Text('Safe-to-Spend: ${data.safeToSpendLabel}'),
              actions: const [Icon(Icons.notifications_none)],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Balance'),
                                Text(
                                  data.safeToSpendLabel,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(color: AppColors.planBlue),
                                ),
                                const SizedBox(height: 12),
                                const PeriodPill(title: 'Current period', dateRange: '1 Jun - 30 Jun'),
                              ],
                            ),
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: SpendingChart(
                                planned: data.plannedSpending,
                                unplanned: data.unplannedSpending,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text('Upcoming plans', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 12),
                    if (data.plans.isEmpty)
                      const EmptyState(
                        title: 'No plans yet',
                        message: 'Create a plan to make your money intentional.',
                      )
                    else
                      Column(
                        children: data.plans
                            .map(
                              (plan) => Card(
                                margin: const EdgeInsets.only(bottom: 12),
                                child: ListTile(
                                  leading: CircleAvatar(child: Text(plan.title.characters.first.toUpperCase())),
                                  title: Text(plan.title),
                                  subtitle: Text('Due ${formatDate(plan.deadline)}'),
                                  trailing: PlanBadge(planned: !plan.done),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
