import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/utils/money.dart';
import '../../data/db/app_database.dart';
import '../../data/models/transaction_models.dart';
import '../../data/repositories/transactions_repository.dart';
import '../common/providers.dart';
import '../home/home_providers.dart';

class TransactionsScreen extends HookConsumerWidget {
  const TransactionsScreen({super.key});

  static const routePath = '/transactions';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final periodAsync = ref.watch(activePeriodProvider);
    final accountsAsync = ref.watch(accountsProvider);
    final categoriesAsync = ref.watch(allCategoriesProvider);
    final criticalityAsync = ref.watch(allCriticalityProvider);
    final txRepo = ref.watch(transactionsRepositoryProvider);

    final filterState = useState(const TransactionFilter());
    final transactionsStream = useMemoized(
      () => txRepo.watchTransactions(filterState.value),
      [filterState.value],
    );
    final transactionsSnapshot =
        useStream<List<TransactionWithDetails>>(transactionsStream, initialData: const <TransactionWithDetails>[]);

    useEffect(() {
      final period = periodAsync.value;
      if (period != null) {
        filterState.value = TransactionFilter(
          from: period.startDate,
          to: period.endDate,
          excludeFromBudget: false,
        );
      }
      return null;
    }, [periodAsync.value]);

    Future<void> exportCsv() async {
      final period = periodAsync.value;
      if (period == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Активный период не найден')),
        );
        return;
      }
      final path = await txRepo.exportCsvForPeriod(period);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Экспортирован: $path')),
        );
      }
    }

    final transactions = transactionsSnapshot.data ?? const [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Транзакции'),
        actions: [
          IconButton(
            onPressed: exportCsv,
            icon: const Icon(Icons.download),
            tooltip: 'Экспорт CSV',
          ),
        ],
      ),
      body: Column(
        children: [
          _FilterPanel(
            filter: filterState.value,
            onChanged: (filter) => filterState.value = filter,
            accountsAsync: accountsAsync,
            categoriesAsync: categoriesAsync,
            criticalityAsync: criticalityAsync,
            period: periodAsync.value,
          ),
          const Divider(height: 1),
          Expanded(
            child: transactionsSnapshot.hasError
                ? Center(child: Text('Ошибка: ${transactionsSnapshot.error}'))
                : transactionsSnapshot.connectionState == ConnectionState.waiting
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        itemCount: transactions.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final item = transactions[index];
                          return _TransactionTile(transaction: item);
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

class _FilterPanel extends HookWidget {
  const _FilterPanel({
    required this.filter,
    required this.onChanged,
    required this.accountsAsync,
    required this.categoriesAsync,
    required this.criticalityAsync,
    required this.period,
  });

  final TransactionFilter filter;
  final ValueChanged<TransactionFilter> onChanged;
  final AsyncValue<List<AccountsTableData>> accountsAsync;
  final AsyncValue<List<CategoriesTableData>> categoriesAsync;
  final AsyncValue<List<CriticalityTableData>> criticalityAsync;
  final PaycheckPeriodsTableData? period;

  @override
  Widget build(BuildContext context) {
    final planFilter = useState<String>('all');
    final typeFilter = useState<String>('all');
    final showExcluded = useState<bool>(filter.excludeFromBudget == null);
    final selectedAccount = useState<String?>(filter.accountId);
    final selectedCategory = useState<String?>(filter.categoryId);
    final selectedCriticality = useState<String?>(filter.criticalityId);
    final dateRange = useState<DateTimeRange?>(filter.from != null && filter.to != null
        ? DateTimeRange(start: filter.from!, end: filter.to!)
        : period != null
            ? DateTimeRange(start: period!.startDate, end: period!.endDate)
            : null);

    useEffect(() {
      planFilter.value = filter.planOnly == null
          ? 'all'
          : (filter.planOnly! ? 'plan' : 'unplanned');
      typeFilter.value = filter.type ?? 'all';
      showExcluded.value = filter.excludeFromBudget == null;
      selectedAccount.value = filter.accountId;
      selectedCategory.value = filter.categoryId;
      selectedCriticality.value = filter.criticalityId;
      if (filter.from != null && filter.to != null) {
        dateRange.value = DateTimeRange(start: filter.from!, end: filter.to!);
      }
      return null;
    }, [filter]);

    void applyChanges() {
      onChanged(
        TransactionFilter(
          from: dateRange.value?.start,
          to: dateRange.value?.end,
          accountId: selectedAccount.value,
          categoryId: selectedCategory.value,
          criticalityId: selectedCriticality.value,
          planOnly: planFilter.value == 'all'
              ? null
              : planFilter.value == 'plan'
                  ? true
                  : false,
          type: typeFilter.value == 'all' ? null : typeFilter.value,
          excludeFromBudget: showExcluded.value ? null : false,
        ),
      );
    }

    return ExpansionTile(
      title: const Text('Фильтры'),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Период'),
          subtitle: Text(dateRange.value == null
              ? 'Все время'
              : '${DateFormat('dd.MM.yyyy').format(dateRange.value!.start)} — ${DateFormat('dd.MM.yyyy').format(dateRange.value!.end)}'),
          trailing: const Icon(Icons.calendar_today),
          onTap: () async {
            final now = DateTime.now();
            final picked = await showDateRangePicker(
              context: context,
              initialDateRange: dateRange.value ??
                  DateTimeRange(start: period?.startDate ?? now.subtract(const Duration(days: 30)), end: period?.endDate ?? now),
              firstDate: DateTime(now.year - 2),
              lastDate: DateTime(now.year + 2),
            );
            if (picked != null) {
              dateRange.value = picked;
              applyChanges();
            }
          },
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String?>(
                value: selectedAccount.value,
                decoration: const InputDecoration(labelText: 'Счёт'),
                items: [
                  const DropdownMenuItem<String?>(value: null, child: Text('Все счета')),
                  ...accountsAsync.when(
                    data: (accounts) => accounts
                        .map(
                          (acc) => DropdownMenuItem<String?>(
                            value: acc.id,
                            child: Text(acc.name),
                          ),
                        )
                        .toList(),
                    loading: () => const [],
                    error: (error, stackTrace) => const [],
                  ),
                ],
                onChanged: (value) {
                  selectedAccount.value = value;
                  applyChanges();
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DropdownButtonFormField<String?>(
                value: selectedCategory.value,
                decoration: const InputDecoration(labelText: 'Категория'),
                items: [
                  const DropdownMenuItem<String?>(value: null, child: Text('Все категории')),
                  ...categoriesAsync.when(
                    data: (categories) => categories
                        .map(
                          (cat) => DropdownMenuItem<String?>(
                            value: cat.id,
                            child: Text('${cat.emoji} ${cat.name}'),
                          ),
                        )
                        .toList(),
                    loading: () => const [],
                    error: (error, stackTrace) => const [],
                  ),
                ],
                onChanged: (value) {
                  selectedCategory.value = value;
                  applyChanges();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: planFilter.value,
                decoration: const InputDecoration(labelText: 'Тип плана'),
                items: const [
                  DropdownMenuItem(value: 'all', child: Text('Все')),
                  DropdownMenuItem(value: 'plan', child: Text('Плановые')),
                  DropdownMenuItem(value: 'unplanned', child: Text('Неплановые')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    planFilter.value = value;
                    applyChanges();
                  }
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: typeFilter.value,
                decoration: const InputDecoration(labelText: 'Тип'),
                items: const [
                  DropdownMenuItem(value: 'all', child: Text('Все')), 
                  DropdownMenuItem(value: 'expense', child: Text('Расходы')),
                  DropdownMenuItem(value: 'income', child: Text('Доходы')),
                  DropdownMenuItem(value: 'transfer', child: Text('Переводы')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    typeFilter.value = value;
                    applyChanges();
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String?>(
          value: selectedCriticality.value,
          decoration: const InputDecoration(labelText: 'Критичность'),
          items: [
            const DropdownMenuItem<String?>(value: null, child: Text('Все')), 
            ...criticalityAsync.when(
              data: (items) => items
                  .where((item) => !item.archived)
                  .map(
                    (item) => DropdownMenuItem<String?>(
                      value: item.id,
                      child: Text(item.name),
                    ),
                  )
                  .toList(),
              loading: () => const [],
              error: (error, stackTrace) => const [],
            ),
          ],
          onChanged: (value) {
            selectedCriticality.value = value;
            applyChanges();
          },
        ),
        const SizedBox(height: 12),
        SwitchListTile(
          title: const Text('Показывать исключённые из бюджета'),
          value: showExcluded.value,
          onChanged: (value) {
            showExcluded.value = value;
            applyChanges();
          },
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              dateRange.value = period == null
                  ? null
                  : DateTimeRange(start: period!.startDate, end: period!.endDate);
              selectedAccount.value = null;
              selectedCategory.value = null;
              selectedCriticality.value = null;
              planFilter.value = 'all';
              typeFilter.value = 'all';
              showExcluded.value = false;
              applyChanges();
            },
            child: const Text('Сбросить фильтры'),
          ),
        ),
      ],
    );
  }
}

class _TransactionTile extends HookConsumerWidget {
  const _TransactionTile({required this.transaction});

  final TransactionWithDetails transaction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tx = transaction.transaction;
    final amount = tx.type == 'expense' ? -transaction.transaction.amount : transaction.transaction.amount;
    final subtitle = <String>[
      formatDate(tx.datetime),
      transaction.account.name,
      if (transaction.category != null) transaction.category!.name,
      if (transaction.planItem != null) 'План: ${transaction.planItem!.title}',
      if (transaction.criticality != null) 'Критичность: ${transaction.criticality!.name}',
      if (tx.excludeFromBudget) 'Исключено из бюджета',
    ].join(' · ');

    return ListTile(
      onTap: () => _showTransactionDetails(context, ref, transaction),
      leading: CircleAvatar(
        backgroundColor: tx.type == 'income'
            ? Colors.green.shade100
            : tx.type == 'transfer'
                ? Colors.blue.shade100
                : Colors.red.shade100,
        child: Icon(
          tx.type == 'income'
              ? Icons.trending_up
              : tx.type == 'transfer'
                  ? Icons.sync_alt
                  : Icons.trending_down,
        ),
      ),
      title: Text(
        transaction.category?.name ?? transaction.planItem?.title ?? tx.type,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(subtitle),
      trailing: Text(
        (amount < 0 ? '-' : '+') + formatAmount(amount.abs()),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: amount < 0
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

Future<void> _showTransactionDetails(
  BuildContext context,
  WidgetRef ref,
  TransactionWithDetails transaction,
) async {
  final txRepo = ref.read(transactionsRepositoryProvider);
  final noteController = TextEditingController(text: transaction.transaction.note ?? '');
  final exclude = ValueNotifier<bool>(transaction.transaction.excludeFromBudget);
  final selectedCriticality = ValueNotifier<String?>(transaction.transaction.criticalityId);
  final criticalityAsync = await ref.read(allCriticalityProvider.future);
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Транзакция', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Text(formatAmount(transaction.transaction.amount),
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text('Счёт: ${transaction.account.name}'),
            if (transaction.category != null)
              Text('Категория: ${transaction.category!.name}'),
            if (transaction.planItem != null)
              Text('План: ${transaction.planItem!.title}'),
            const SizedBox(height: 12),
            TextField(
              controller: noteController,
              minLines: 2,
              maxLines: 4,
              decoration: const InputDecoration(labelText: 'Комментарий'),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedCriticality.value,
              decoration: const InputDecoration(labelText: 'Критичность'),
              items: [
                const DropdownMenuItem(value: null, child: Text('Без критичности')),
                ...criticalityAsync
                    .where((item) => !item.archived)
                    .map(
                      (item) => DropdownMenuItem(
                        value: item.id,
                        child: Text(item.name),
                      ),
                    )
                    .toList(),
              ],
              onChanged: (value) => selectedCriticality.value = value,
            ),
            SwitchListTile(
              value: exclude.value,
              onChanged: (value) => exclude.value = value,
              title: const Text('Исключить из бюджета'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Закрыть'),
                ),
                const SizedBox(width: 12),
                FilledButton(
                  onPressed: () async {
                    final updated = transaction.transaction.copyWith(
                      note: Value(noteController.text.trim().isEmpty
                          ? null
                          : noteController.text.trim()),
                      excludeFromBudget: exclude.value,
                      criticalityId: Value(selectedCriticality.value),
                    );
                    await txRepo.updateTransaction(updated);
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Сохранить'),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
