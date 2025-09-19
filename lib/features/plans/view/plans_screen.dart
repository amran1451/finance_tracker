import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/date_format.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/empty_state.dart';
import '../controller/plans_controller.dart';

class PlansScreen extends ConsumerWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plansAsync = ref.watch(plansProvider);
    return AppScaffold(
      title: 'Plans',
      body: plansAsync.when(
        data: (plans) {
          if (plans.isEmpty) {
            return const EmptyState(
              title: 'No plans yet',
              message: 'Create a plan to tame your cash flow.',
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: plans.length,
            itemBuilder: (context, index) {
              final plan = plans[index];
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(plan.title),
                  subtitle: Text('${plan.expectedAmount.toStringAsFixed(0)} ₽ · ${formatDate(plan.deadline)}'),
                  trailing: Icon(
                    plan.done ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: plan.done ? AppColors.planBlue : AppColors.unplannedAmber,
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      fab: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('New plan'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
