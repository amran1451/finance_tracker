import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/utils/money.dart';
import '../../data/models/plan_models.dart';
import '../plan/plan_screen.dart';
import '../quick_entry/quick_entry_sheet.dart';
import '../transactions/transactions_screen.dart';
import 'home_providers.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  static const routePath = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final periodAsync = ref.watch(activePeriodProvider);
    final summaryAsync = ref.watch(periodSummaryProvider);
    final planAsync = ref.watch(planItemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Дом'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(periodSummaryProvider);
          ref.invalidate(planItemsProvider);
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            periodAsync.when(
              data: (period) {
                if (period == null) {
                  return const _EmptyStateCard(
                    title: 'Нет активного периода',
                    description:
                        'Создайте период в настройках, чтобы начать отслеживание.',
                  );
                }
                return _PeriodHeader(periodTitle: period.title);
              },
              loading: () => const _Skeleton(height: 80),
              error: (error, stackTrace) => _ErrorCard(error: error),
            ),
            const SizedBox(height: 12),
            summaryAsync.when(
              data: (summary) {
                if (summary == null) {
                  return const _Skeleton(height: 220);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SafeToSpendCard(summary: summary),
                    const SizedBox(height: 12),
                    _PlanFactCard(summary: summary),
                    const SizedBox(height: 12),
                    _CriticalitySliceCard(summary: summary),
                  ],
                );
              },
              loading: () => const _Skeleton(height: 220),
              error: (error, stackTrace) => _ErrorCard(error: error),
            ),
            const SizedBox(height: 20),
            Text(
              'Быстрые действия',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _QuickActionButton(
                  label: 'Транзакции',
                  icon: Icons.list_alt,
                  onTap: () => context.go(TransactionsScreen.routePath),
                ),
                _QuickActionButton(
                  label: 'План',
                  icon: Icons.flag,
                  onTap: () => context.go(PlanScreen.routePath),
                ),
                _QuickActionButton(
                  label: '+ Плановая',
                  icon: Icons.add_task,
                  onTap: () => showQuickEntrySheet(
                    context,
                    ref,
                    initialTab: QuickEntryTab.plannedExpense,
                  ),
                ),
                _QuickActionButton(
                  label: '+ Неплановая',
                  icon: Icons.flash_on,
                  onTap: () => showQuickEntrySheet(
                    context,
                    ref,
                    initialTab: QuickEntryTab.expense,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'План периода',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            planAsync.when(
              data: (items) {
                if (items.isEmpty) {
                  return const _EmptyStateCard(
                    title: 'Нет планов',
                    description: 'Добавьте плановую покупку, чтобы отслеживать прогресс.',
                  );
                }
                return Column(
                  children: [
                    for (final item in items)
                      _PlanProgressTile(
                        progress: item,
                        onTap: () => context.go(PlanScreen.routePath),
                      ),
                  ],
                );
              },
              loading: () => Column(
                children: const [
                  _Skeleton(height: 64),
                  SizedBox(height: 8),
                  _Skeleton(height: 64),
                ],
              ),
              error: (error, stackTrace) => _ErrorCard(error: error),
            ),
          ],
        ),
      ),
    );
  }
}

class _PeriodHeader extends StatelessWidget {
  const _PeriodHeader({required this.periodTitle});

  final String periodTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.calendar_month, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Активный период',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    periodTitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SafeToSpendCard extends StatelessWidget {
  const _SafeToSpendCard({required this.summary});

  final PeriodSummary summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Safe-to-Spend', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              formatAmount(summary.safeToSpend),
              style: theme.textTheme.displaySmall?.copyWith(
                color: summary.safeToSpend >= 0
                    ? theme.colorScheme.primary
                    : theme.colorScheme.error,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _MetricChip(
                  label: 'Доход',
                  value: formatAmount(summary.totalIncome),
                  icon: Icons.trending_up,
                ),
                _MetricChip(
                  label: 'Расход',
                  value: formatAmount(summary.totalExpenses),
                  icon: Icons.trending_down,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanFactCard extends StatelessWidget {
  const _PlanFactCard({required this.summary});

  final PeriodSummary summary;

  @override
  Widget build(BuildContext context) {
    final planned = summary.plannedExpenses;
    final unplanned = summary.unplannedExpenses;
    final expected = summary.planExpected;
    final total = planned + unplanned;
    final progress = expected == 0 ? 0.0 : (planned / expected).clamp(0.0, 1.0);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('План vs Факт vs Неплан',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                _MetricChip(
                  label: 'План',
                  value: formatAmount(expected),
                  icon: Icons.flag,
                ),
                _MetricChip(
                  label: 'Оплачено',
                  value: formatAmount(planned),
                  icon: Icons.check_circle,
                ),
                _MetricChip(
                  label: 'Неплан',
                  value: formatAmount(unplanned),
                  icon: Icons.flash_on,
                ),
                _MetricChip(
                  label: 'Факт',
                  value: formatAmount(total),
                  icon: Icons.ssid_chart,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CriticalitySliceCard extends StatelessWidget {
  const _CriticalitySliceCard({required this.summary});

  final PeriodSummary summary;

  @override
  Widget build(BuildContext context) {
    if (summary.criticalitySlices.isEmpty) {
      return const _EmptyStateCard(
        title: 'Критичность',
        description: 'Назначайте критичность транзакциям, чтобы увидеть распределение.',
      );
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('По критичности',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            for (final slice in summary.criticalitySlices)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Text(slice.criticality.iconEmoji ?? '•',
                        style: const TextStyle(fontSize: 22)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            slice.criticality.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          LinearProgressIndicator(
                            value: slice.share,
                            minHeight: 6,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(formatAmount(slice.totalAmount)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _PlanProgressTile extends StatelessWidget {
  const _PlanProgressTile({required this.progress, required this.onTap});

  final PlanItemProgress progress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final remaining = progress.remaining;
    final paid = progress.paidAmount;
    final expected = progress.item.expectedAmount;
    final percent = expected == 0 ? 0.0 : paid / expected;
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          progress.isDone ? Icons.check_circle : Icons.flag,
          color: progress.isDone
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        title: Text(progress.item.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(value: percent.clamp(0.0, 1.0)),
            const SizedBox(height: 4),
            Text('Оплачено: ${formatAmount(paid)}'),
            Text('Осталось: ${formatAmount(remaining)}'),
          ],
        ),
        trailing: Text('#${progress.item.priority}'),
      ),
    );
  }
}

class _MetricChip extends StatelessWidget {
  const _MetricChip({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      label: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18),
              const SizedBox(width: 4),
              Text(label),
            ],
          ),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  const _QuickActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}

class _EmptyStateCard extends StatelessWidget {
  const _EmptyStateCard({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  const _ErrorCard({required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Ошибка: $error',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onErrorContainer),
        ),
      ),
    );
  }
}

class _Skeleton extends StatelessWidget {
  const _Skeleton({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: height,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
