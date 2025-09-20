import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../core/utils/money.dart';
import '../../data/db/app_database.dart';
import '../../data/models/plan_models.dart';
import '../../data/repositories/transactions_repository.dart';
import '../common/providers.dart';
import '../home/home_providers.dart';

enum QuickEntryTab { expense, plannedExpense, income, transfer }

Future<void> showQuickEntrySheet(
  BuildContext context,
  WidgetRef ref, {
  QuickEntryTab initialTab = QuickEntryTab.expense,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => QuickEntrySheet(initialTab: initialTab),
  );
}

class QuickEntrySheet extends HookConsumerWidget {
  const QuickEntrySheet({required this.initialTab, super.key});

  final QuickEntryTab initialTab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: QuickEntryTab.values.length,
      initialIndex: initialTab.index,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 48,
                height: 5,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 12),
              TabBar(
                labelColor: Theme.of(context).colorScheme.primary,
                tabs: const [
                  Tab(text: 'Трата'),
                  Tab(text: 'Плановая'),
                  Tab(text: 'Доход'),
                  Tab(text: 'Перевод'),
                ],
              ),
              Flexible(
                child: TabBarView(
                  children: [
                    ExpenseForm(planned: false),
                    ExpenseForm(planned: true),
                    const IncomeForm(),
                    const TransferForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpenseForm extends HookConsumerWidget {
  const ExpenseForm({required this.planned, super.key});

  final bool planned;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(expenseCategoriesProvider);
    final accountsAsync = ref.watch(accountsProvider);
    final periodAsync = ref.watch(activePeriodProvider);
    final planItemsAsync = ref.watch(planItemsProvider);
    final recentCriticality = ref.watch(recentCriticalityProvider);
    final criticalityStream = ref.watch(criticalityProvider);
    final txRepo = ref.read(transactionsRepositoryProvider);

    final amount = useState<int>(0);
    final noteController = useTextEditingController();
    final attachmentController = useTextEditingController();
    final excludeFromBudget = useState<bool>(false);
    final selectedDate = useState<DateTime>(DateTime.now());
    final selectedCategory = useState<String?>(null);
    final selectedAccount = useState<String?>(null);
    final selectedPlan = useState<String?>(null);
    final selectedCriticalityId = useState<String?>(null);

    ref.listen<AsyncValue<List<CategoriesTableData>>>(
      expenseCategoriesProvider,
      (_, next) {
        if (next.hasValue && selectedCategory.value == null) {
          final categories = next.value!;
          if (categories.isNotEmpty) {
            selectedCategory.value = categories.first.id;
          }
        }
      },
    );

    ref.listen<AsyncValue<List<AccountsTableData>>>(
      accountsProvider,
      (_, next) {
        if (next.hasValue && selectedAccount.value == null) {
          final accounts = next.value!;
          if (accounts.isNotEmpty) {
            selectedAccount.value = accounts.first.id;
          }
        }
      },
    );

    ref.listen<AsyncValue<List<PlanItemProgress>>>(
      planItemsProvider,
      (_, next) {
        if (planned && next.hasValue && selectedPlan.value == null) {
          final plans = next.value!;
          if (plans.isNotEmpty) {
            selectedPlan.value = plans.first.item.id;
          }
        }
      },
    );

    Future<void> submit() async {
      if (amount.value <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Введите сумму')), 
        );
        return;
      }
      if (selectedAccount.value == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Выберите счёт')));
        return;
      }
      if (selectedCategory.value == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Выберите категорию')));
        return;
      }
      if (planned && selectedPlan.value == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Выберите план')));
        return;
      }
      final attachments = attachmentController.text.trim().isEmpty
          ? <String>[]
          : [attachmentController.text.trim()];
      await txRepo.createExpense(
        id: 'tx-${const Uuid().v4()}',
        datetime: selectedDate.value,
        amount: amount.value,
        accountId: selectedAccount.value!,
        categoryId: selectedCategory.value,
        planItemId: planned ? selectedPlan.value : null,
        criticalityId: selectedCriticalityId.value,
        note: noteController.text.trim().isEmpty
            ? null
            : noteController.text.trim(),
        attachments: attachments,
        excludeFromBudget: excludeFromBudget.value,
      );
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              planned
                  ? 'Плановая трата добавлена'
                  : 'Расход добавлен',
            ),
          ),
        );
      }
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, controller) {
        return SingleChildScrollView(
          controller: controller,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                planned ? 'Плановая трата' : 'Трата',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              AmountInput(
                onChanged: (value) => amount.value = value,
              ),
              const SizedBox(height: 16),
              _DateTimePicker(
                label: 'Дата и время',
                value: selectedDate.value,
                onChanged: (value) => selectedDate.value = value,
              ),
              const SizedBox(height: 16),
              Text('Категория',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              categoriesAsync.when(
                data: (categories) => Wrap(
                  spacing: 8,
                  children: [
                    for (final category in categories)
                      ChoiceChip(
                        label: Text('${category.emoji} ${category.name}'),
                        selected: selectedCategory.value == category.id,
                        onSelected: (_) => selectedCategory.value = category.id,
                      ),
                  ],
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => Text('Ошибка категорий: $error'),
              ),
              const SizedBox(height: 16),
              Text('Счёт', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              accountsAsync.when(
                data: (accounts) => DropdownButton<String>(
                  value: selectedAccount.value,
                  items: [
                    for (final account in accounts)
                      DropdownMenuItem(
                        value: account.id,
                        child: Text(account.name),
                      ),
                  ],
                  onChanged: (value) => selectedAccount.value = value,
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => Text('Ошибка счетов: $error'),
              ),
              if (planned) ...[
                const SizedBox(height: 16),
                Text('План', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
               planItemsAsync.when(
                  data: (items) {
                    final available =
                        items.where((element) => !element.isDone).toList();
                    if (available.isEmpty) {
                      return const Text('Нет активных планов для этого периода');
                    }
                    return Wrap(
                      spacing: 8,
                      children: [
                        for (final plan in available)
                          FilterChip(
                            label: Text(plan.item.title),
                            selected: selectedPlan.value == plan.item.id,
                            onSelected: (_) => selectedPlan.value = plan.item.id,
                          ),
                      ],
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stackTrace) => Text('Ошибка планов: $error'),
                ),
              ],
              const SizedBox(height: 16),
              Text('Критичность',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              recentCriticality.when(
                data: (items) => Wrap(
                  spacing: 8,
                  children: [
                    for (final crit in items)
                      ChoiceChip(
                        label: Text(crit.name),
                        selected: selectedCriticalityId.value == crit.id,
                        onSelected: (_) => selectedCriticalityId.value = crit.id,
                      ),
                    ActionChip(
                      label: const Text('Ещё…'),
                      onPressed: () => _showCriticalityPicker(
                        context,
                        ref,
                        selectedCriticalityId,
                      ),
                    ),
                  ],
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => Text('Ошибка критичности: $error'),
              ),
              criticalityStream.when(
                data: (items) {
                  if (items.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Wrap(
                    spacing: 8,
                    children: [
                      for (final crit in items)
                        if (!recentCriticality.maybeWhen(
                          data: (recent) =>
                              recent.any((element) => element.id == crit.id),
                          orElse: () => false,
                        ))
                          FilterChip(
                            label: Text(crit.name),
                            selected: selectedCriticalityId.value == crit.id,
                            onSelected: (_) =>
                                selectedCriticalityId.value = crit.id,
                          ),
                    ],
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (error, stackTrace) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: noteController,
                minLines: 2,
                maxLines: 4,
                decoration: const InputDecoration(labelText: 'Комментарий'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: attachmentController,
                decoration: const InputDecoration(
                  labelText: 'Путь к чеку (опционально)',
                ),
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                title: const Text('Исключить из бюджета'),
                value: excludeFromBudget.value,
                onChanged: (value) => excludeFromBudget.value = value,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: submit,
                  child: const Text('Сохранить'),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class IncomeForm extends HookConsumerWidget {
  const IncomeForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(incomeCategoriesProvider);
    final accountsAsync = ref.watch(accountsProvider);
    final txRepo = ref.read(transactionsRepositoryProvider);
    final amount = useState<int>(0);
    final selectedDate = useState<DateTime>(DateTime.now());
    final selectedCategory = useState<String?>(null);
    final selectedAccount = useState<String?>(null);
    final noteController = useTextEditingController();
    final attachmentController = useTextEditingController();
    final criticality = useState<String?>(null);
    final recentCriticality = ref.watch(recentCriticalityProvider);
    final criticalityStream = ref.watch(criticalityProvider);

    ref.listen<AsyncValue<List<CategoriesTableData>>>(
      incomeCategoriesProvider,
      (_, next) {
        if (next.hasValue && selectedCategory.value == null) {
          final categories = next.value!;
          if (categories.isNotEmpty) {
            selectedCategory.value = categories.first.id;
          }
        }
      },
    );

    ref.listen<AsyncValue<List<AccountsTableData>>>(
      accountsProvider,
      (_, next) {
        if (next.hasValue && selectedAccount.value == null) {
          final accounts = next.value!;
          if (accounts.isNotEmpty) {
            selectedAccount.value = accounts.first.id;
          }
        }
      },
    );

    Future<void> submit() async {
      if (amount.value <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Введите сумму')),
        );
        return;
      }
      if (selectedAccount.value == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Выберите счёт')));
        return;
      }
      final attachments = attachmentController.text.trim().isEmpty
          ? <String>[]
          : [attachmentController.text.trim()];
      await txRepo.createIncome(
        id: 'tx-${const Uuid().v4()}',
        datetime: selectedDate.value,
        amount: amount.value,
        accountId: selectedAccount.value!,
        categoryId: selectedCategory.value,
        criticalityId: criticality.value,
        note: noteController.text.trim().isEmpty
            ? null
            : noteController.text.trim(),
        attachments: attachments,
      );
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Доход добавлен')), 
        );
      }
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, controller) {
        return SingleChildScrollView(
          controller: controller,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Доход', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              AmountInput(onChanged: (value) => amount.value = value),
              const SizedBox(height: 16),
              _DateTimePicker(
                label: 'Дата и время',
                value: selectedDate.value,
                onChanged: (value) => selectedDate.value = value,
              ),
              const SizedBox(height: 16),
              Text('Категория',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              categoriesAsync.when(
                data: (categories) => Wrap(
                  spacing: 8,
                  children: [
                    for (final category in categories)
                      ChoiceChip(
                        label: Text('${category.emoji} ${category.name}'),
                        selected: selectedCategory.value == category.id,
                        onSelected: (_) => selectedCategory.value = category.id,
                      ),
                  ],
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => Text('Ошибка категорий: $error'),
              ),
              const SizedBox(height: 16),
              Text('Счёт', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              accountsAsync.when(
                data: (accounts) => DropdownButton<String>(
                  value: selectedAccount.value,
                  items: [
                    for (final account in accounts)
                      DropdownMenuItem(
                        value: account.id,
                        child: Text(account.name),
                      ),
                  ],
                  onChanged: (value) => selectedAccount.value = value,
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => Text('Ошибка счетов: $error'),
              ),
              const SizedBox(height: 16),
              Text('Критичность',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              recentCriticality.when(
                data: (items) => Wrap(
                  spacing: 8,
                  children: [
                    for (final crit in items)
                      ChoiceChip(
                        label: Text(crit.name),
                        selected: criticality.value == crit.id,
                        onSelected: (_) => criticality.value = crit.id,
                      ),
                    ActionChip(
                      label: const Text('Ещё…'),
                      onPressed: () => _showCriticalityPicker(
                        context,
                        ref,
                        criticality,
                      ),
                    ),
                  ],
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => Text('Ошибка критичности: $error'),
              ),
              criticalityStream.when(
                data: (items) {
                  if (items.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Wrap(
                    spacing: 8,
                    children: [
                      for (final crit in items)
                        if (!recentCriticality.maybeWhen(
                          data: (recent) =>
                              recent.any((element) => element.id == crit.id),
                          orElse: () => false,
                        ))
                          FilterChip(
                            label: Text(crit.name),
                            selected: criticality.value == crit.id,
                            onSelected: (_) => criticality.value = crit.id,
                          ),
                    ],
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (error, stackTrace) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: noteController,
                minLines: 2,
                maxLines: 4,
                decoration: const InputDecoration(labelText: 'Комментарий'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: attachmentController,
                decoration: const InputDecoration(
                  labelText: 'Путь к документу (опционально)',
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: submit,
                  child: const Text('Сохранить'),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class TransferForm extends HookConsumerWidget {
  const TransferForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(accountsProvider);
    final txRepo = ref.read(transactionsRepositoryProvider);
    final amount = useState<int>(0);
    final selectedDate = useState<DateTime>(DateTime.now());
    final fromAccount = useState<String?>(null);
    final toAccount = useState<String?>(null);
    final noteController = useTextEditingController(text: 'transfer:${const Uuid().v4()}');

    ref.listen<AsyncValue<List<AccountsTableData>>>(
      accountsProvider,
      (_, next) {
        if (next.hasValue) {
          final accounts = next.value!;
          if (accounts.isNotEmpty) {
            fromAccount.value ??= accounts.first.id;
            if (accounts.length > 1) {
              toAccount.value ??= accounts[1].id;
            } else {
              toAccount.value ??= accounts.first.id;
            }
          }
        }
      },
    );

    Future<void> submit() async {
      if (amount.value <= 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Введите сумму')));
        return;
      }
      if (fromAccount.value == null || toAccount.value == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Выберите счета')), 
        );
        return;
      }
      if (fromAccount.value == toAccount.value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Счета должны отличаться')), 
        );
        return;
      }
      await txRepo.createTransfer(
        datetime: selectedDate.value,
        amount: amount.value,
        fromAccountId: fromAccount.value!,
        toAccountId: toAccount.value!,
        note: noteController.text.trim().isEmpty
            ? null
            : noteController.text.trim(),
      );
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Перевод создан')), 
        );
      }
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, controller) {
        return SingleChildScrollView(
          controller: controller,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Перевод', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              AmountInput(onChanged: (value) => amount.value = value),
              const SizedBox(height: 16),
              _DateTimePicker(
                label: 'Дата и время',
                value: selectedDate.value,
                onChanged: (value) => selectedDate.value = value,
              ),
              const SizedBox(height: 16),
              Text('Со счёта', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              accountsAsync.when(
                data: (accounts) => DropdownButton<String>(
                  value: fromAccount.value,
                  items: [
                    for (final account in accounts)
                      DropdownMenuItem(
                        value: account.id,
                        child: Text(account.name),
                      ),
                  ],
                  onChanged: (value) => fromAccount.value = value,
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => Text('Ошибка счетов: $error'),
              ),
              const SizedBox(height: 12),
              Text('На счёт', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              accountsAsync.when(
                data: (accounts) => DropdownButton<String>(
                  value: toAccount.value,
                  items: [
                    for (final account in accounts)
                      DropdownMenuItem(
                        value: account.id,
                        child: Text(account.name),
                      ),
                  ],
                  onChanged: (value) => toAccount.value = value,
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => Text('Ошибка счетов: $error'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: noteController,
                decoration: const InputDecoration(labelText: 'Пометка'),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: submit,
                  child: const Text('Сохранить'),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class AmountInput extends HookWidget {
  const AmountInput({required this.onChanged, this.initialAmount = 0, super.key});

  final ValueChanged<int> onChanged;
  final int initialAmount;

  @override
  Widget build(BuildContext context) {
    final buffer = useState<String>(
      initialAmount == 0 ? '' : _normalizeAmount(initialAmount),
    );

    void notify() {
      final parsed = parseAmountInput(buffer.value.isEmpty ? '0' : buffer.value);
      onChanged(parsed.abs());
    }

    useEffect(() {
      notify();
      return null;
    }, const []);

    void append(String value) {
      buffer.value = buffer.value + value;
      notify();
    }

    void backspace() {
      if (buffer.value.isEmpty) return;
      buffer.value = buffer.value.substring(0, buffer.value.length - 1);
      notify();
    }

    void applyMultiplier() {
      final base = buffer.value.isEmpty ? '1' : buffer.value;
      final multiplied = parseAmountInput('${base}k');
      buffer.value = _normalizeAmount(multiplied);
      notify();
    }

    void addQuick(int rubles) {
      final parsed = parseAmountInput(buffer.value.isEmpty ? '0' : buffer.value);
      final updated = parsed + rubles * 100;
      buffer.value = _normalizeAmount(updated);
      notify();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Сумма', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Center(
              child: Text(
                formatAmount(parseAmountInput(buffer.value.isEmpty ? '0' : buffer.value)),
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                for (final quick in [100, 500, 1000])
                  ActionChip(
                    label: Text('+${quick.toString()}'),
                    onPressed: () => addQuick(quick),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              childAspectRatio: 1.7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (final value in ['1', '2', '3', '4', '5', '6', '7', '8', '9'])
                  _KeyButton(
                    label: value,
                    onTap: () => append(value),
                  ),
                _KeyButton(label: '.', onTap: () {
                  if (!buffer.value.contains('.')) {
                    append('.');
                  }
                }),
                _KeyButton(label: '0', onTap: () => append('0')),
                _KeyButton(label: 'k', onTap: applyMultiplier),
                _KeyButton(label: '←', onTap: backspace),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _KeyButton extends StatelessWidget {
  const _KeyButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: Text(label, style: const TextStyle(fontSize: 18)),
    );
  }
}

class _DateTimePicker extends StatelessWidget {
  const _DateTimePicker({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final DateTime value;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label),
      subtitle: Text(formatDate(value)),
      trailing: const Icon(Icons.edit_calendar),
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: value,
          firstDate: DateTime(value.year - 1),
          lastDate: DateTime(value.year + 2),
        );
        if (date != null) {
          final timeOfDay = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(value),
          );
          if (timeOfDay != null) {
            onChanged(DateTime(
              date.year,
              date.month,
              date.day,
              timeOfDay.hour,
              timeOfDay.minute,
            ));
          }
        }
      },
    );
  }
}

Future<void> _showCriticalityPicker(
  BuildContext context,
  WidgetRef ref,
  ValueNotifier<String?> target,
) async {
  final criticalities = await ref.read(allCriticalityProvider.stream).first;
  final active = criticalities.where((element) => !element.archived).toList();
  if (!context.mounted) return;
  await showModalBottomSheet<void>(
    context: context,
    builder: (context) => ListView(
      children: [
        for (final item in active)
          ListTile(
            title: Text(item.name),
            onTap: () {
              target.value = item.id;
              Navigator.pop(context);
            },
          ),
        ListTile(
          title: const Text('Без критичности'),
          onTap: () {
            target.value = null;
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

String _normalizeAmount(int amount) {
  final rubles = amount ~/ 100;
  final cents = amount % 100;
  if (cents == 0) {
    return rubles.toString();
  }
  return (amount / 100).toStringAsFixed(2);
}
