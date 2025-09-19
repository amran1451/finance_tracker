import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/currency_format.dart';
import '../../common/controllers/filters_controller.dart';
import '../../common/widgets/app_scaffold.dart';
import '../../common/widgets/empty_state.dart';
import '../controller/transactions_controller.dart';

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionsProvider);
    return AppScaffold(
      title: 'Transactions',
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () => _openFilters(context, ref),
        )
      ],
      body: transactionsAsync.when(
        data: (transactions) {
          if (transactions.isEmpty) {
            return const EmptyState(
              title: 'Inbox zero',
              message: 'All transactions are categorized. Enjoy the calm!',
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: transactions.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              final color = transaction.planned ? AppColors.planBlue : AppColors.unplannedAmber;
              return ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                tileColor: Theme.of(context).colorScheme.surface,
                leading: CircleAvatar(backgroundColor: color.withOpacity(0.2), child: Icon(Icons.receipt_long, color: color)),
                title: Text(formatCurrency(transaction.amount)),
                subtitle: Text(formatTransactionDate(transaction.datetime)),
                trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.outline),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Future<void> _openFilters(BuildContext context, WidgetRef ref) async {
    final notifier = ref.read(filtersNotifierProvider.notifier);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        bool plannedOnly = ref.read(filtersNotifierProvider).planned ?? false;
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SwitchListTile(
                title: const Text('Planned only'),
                value: plannedOnly,
                onChanged: (value) {
                  plannedOnly = value;
                  notifier.setPlanned(value);
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Search note'),
                onChanged: notifier.setQuery,
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Apply'),
              )
            ],
          ),
        );
      },
    );
  }
}
