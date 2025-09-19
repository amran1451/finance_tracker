import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/app_scaffold.dart';
import '../controller/budget_controller.dart';

class BudgetScreen extends ConsumerWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetsAsync = ref.watch(budgetProvider('period_current'));
    return AppScaffold(
      title: 'Budget',
      body: budgetsAsync.when(
        data: (budgets) => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: budgets.length,
          itemBuilder: (context, index) {
            final budget = budgets[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text('Category ${budget.categoryId}'),
                subtitle: Text('Limit: ${budget.limitAmount.toStringAsFixed(0)}'),
                trailing: Text(budget.carryOverRule.name.toUpperCase()),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
