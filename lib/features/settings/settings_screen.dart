import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../core/utils/money.dart';
import '../../data/db/app_database.dart';
import '../../data/repositories/accounts_repository.dart';
import '../../data/repositories/categories_repository.dart';
import '../../data/repositories/criticality_repository.dart';
import '../../data/repositories/periods_repository.dart';
import '../common/providers.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  static const routePath = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 5);
    useListenable(tabController);
    final accountsAsync = ref.watch(accountsProvider);
    final expenseCategoriesAsync = ref.watch(expenseCategoriesProvider);
    final incomeCategoriesAsync = ref.watch(incomeCategoriesProvider);
    final criticalityStream = ref.watch(allCriticalityProvider);

    FloatingActionButton? buildFab() {
      final index = tabController.index;
      switch (index) {
        case 0:
          return FloatingActionButton(
            onPressed: () => _showAccountDialog(context, ref),
            child: const Icon(Icons.add),
          );
        case 1:
          return FloatingActionButton(
            onPressed: () => _showCategoryDialog(context, ref),
            child: const Icon(Icons.add),
          );
        case 2:
          return FloatingActionButton(
            onPressed: () => _showPeriodDialog(context, ref),
            child: const Icon(Icons.add),
          );
        case 3:
          return FloatingActionButton(
            onPressed: () => _showCriticalityDialog(context, ref),
            child: const Icon(Icons.add),
          );
        default:
          return null;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        bottom: TabBar(
          controller: tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Счета'),
            Tab(text: 'Категории'),
            Tab(text: 'Периоды'),
            Tab(text: 'Критичность'),
            Tab(text: 'Параметры'),
          ],
        ),
      ),
      floatingActionButton: buildFab(),
      body: TabBarView(
        controller: tabController,
        children: [
          _AccountsTab(accountsAsync: accountsAsync),
          _CategoriesTab(
            expenseCategoriesAsync: expenseCategoriesAsync,
            incomeCategoriesAsync: incomeCategoriesAsync,
          ),
          _PeriodsTab(),
          _CriticalityTab(criticalityAsync: criticalityStream),
          const _ParametersTab(),
        ],
      ),
    );
  }
}

class _AccountsTab extends ConsumerWidget {
  const _AccountsTab({required this.accountsAsync});

  final AsyncValue<List<AccountsTableData>> accountsAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return accountsAsync.when(
      data: (accounts) => ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: accounts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final account = accounts[index];
          return Card(
            child: ListTile(
              title: Text(account.name),
              subtitle: Text('Тип: ${account.type} • Баланс: ${formatAmount(account.openingBalance)}'),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _showAccountDialog(context, ref, account: account),
              ),
            ),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Ошибка: $error')),
    );
  }
}

class _CategoriesTab extends ConsumerWidget {
  const _CategoriesTab({
    required this.expenseCategoriesAsync,
    required this.incomeCategoriesAsync,
  });

  final AsyncValue<List<CategoriesTableData>> expenseCategoriesAsync;
  final AsyncValue<List<CategoriesTableData>> incomeCategoriesAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Расходы', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        expenseCategoriesAsync.when(
          data: (categories) => Column(
            children: [
              for (final category in categories)
                Card(
                  child: ListTile(
                    title: Text('${category.emoji} ${category.name}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showCategoryDialog(context, ref, category: category),
                    ),
                  ),
                ),
            ],
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Ошибка: $error'),
        ),
        const SizedBox(height: 16),
        Text('Доходы', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        incomeCategoriesAsync.when(
          data: (categories) => Column(
            children: [
              for (final category in categories)
                Card(
                  child: ListTile(
                    title: Text('${category.emoji} ${category.name}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showCategoryDialog(context, ref, category: category),
                    ),
                  ),
                ),
            ],
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Ошибка: $error'),
        ),
      ],
    );
  }
}

class _PeriodsTab extends ConsumerWidget {
  const _PeriodsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(periodsRepositoryProvider);
    final periodsStream = useMemoized(() => repo.watchAll(), [repo]);
    final snapshot = useStream<List<PaycheckPeriodsTableData>>(periodsStream, initialData: const <PaycheckPeriodsTableData>[]);
    if (snapshot.hasError) {
      return Center(child: Text('Ошибка: ${snapshot.error}'));
    }
    final periods = snapshot.data ?? <PaycheckPeriodsTableData>[];
    if (snapshot.connectionState == ConnectionState.waiting && periods.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: periods.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final period = periods[index];
        return Card(
          child: ListTile(
            title: Text(period.title),
            subtitle: Text(
              '${formatDate(period.startDate)} — ${formatDate(period.endDate)}\n${period.kind}',
            ),
            trailing: IconButton(
              icon: Icon(period.closed ? Icons.lock : Icons.lock_open),
              onPressed: () async {
                if (period.closed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Период уже закрыт')),
                  );
                } else {
                  await repo.closePeriod(period.id);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Период ${period.title} закрыт')),
                    );
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class _CriticalityTab extends HookConsumerWidget {
  const _CriticalityTab({required this.criticalityAsync});

  final AsyncValue<List<CriticalityTableData>> criticalityAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return criticalityAsync.when(
      data: (items) {
        final active = items.where((item) => !item.archived).toList()
          ..sort((a, b) => a.sort.compareTo(b.sort));
        final archived = items.where((item) => item.archived).toList();
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Активные', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            ReorderableListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              onReorder: (oldIndex, newIndex) {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }
                final item = active.removeAt(oldIndex);
                active.insert(newIndex, item);
                Future.microtask(() async {
                  for (var i = 0; i < active.length; i++) {
                    await ref.read(criticalityRepositoryProvider).updateSort(active[i].id, i);
                  }
                });
              },
              children: [
                for (final item in active)
                  Card(
                    key: ValueKey(item.id),
                    child: ListTile(
                      title: Text('${item.iconEmoji ?? ''} ${item.name}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.archive),
                            onPressed: () => ref
                                .read(criticalityRepositoryProvider)
                                .archive(item.id, archived: true),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _showCriticalityDialog(context, ref, item: item),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            if (archived.isNotEmpty)
              Text('Архив', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            for (final item in archived)
              Card(
                child: ListTile(
                  title: Text('${item.iconEmoji ?? ''} ${item.name}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.unarchive),
                    onPressed: () => ref
                        .read(criticalityRepositoryProvider)
                        .archive(item.id, archived: false),
                  ),
                ),
              ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Ошибка: $error')),
    );
  }
}

class _ParametersTab extends StatelessWidget {
  const _ParametersTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ListTile(
            title: Text('Базовая валюта'),
            subtitle: Text('RUB'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Хранение данных'),
            subtitle: Text('База данных хранится локально и синхронизируется при запуске.'),
          ),
        ),
      ],
    );
  }
}

Future<void> _showAccountDialog(
  BuildContext context,
  WidgetRef ref, {
  AccountsTableData? account,
}) async {
  final nameController = TextEditingController(text: account?.name ?? '');
  final openingController = TextEditingController(
    text: account != null ? (account.openingBalance / 100).toStringAsFixed(2) : '',
  );
  final type = ValueNotifier<String>(account?.type ?? 'cash');
  await showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(account == null ? 'Новый счёт' : 'Редактирование счёта'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Название'),
          ),
          const SizedBox(height: 12),
          DropdownButton<String>(
            value: type.value,
            items: const [
              DropdownMenuItem(value: 'cash', child: Text('Наличные')),
              DropdownMenuItem(value: 'card', child: Text('Карта')),
              DropdownMenuItem(value: 'bank', child: Text('Банк')),
              DropdownMenuItem(value: 'wallet', child: Text('Кошелёк')),
            ],
            onChanged: (value) => type.value = value ?? 'cash',
          ),
          const SizedBox(height: 12),
          TextField(
            controller: openingController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Начальный баланс (₽)'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        FilledButton(
          onPressed: () async {
            final repo = ref.read(accountsRepositoryProvider);
            final balance = parseAmountInput(openingController.text);
            if (account == null) {
              await repo.createAccount(
                id: 'acc-${const Uuid().v4()}',
                name: nameController.text,
                type: type.value,
                openingBalance: balance,
              );
            } else {
              await repo.updateAccount(account.copyWith(
                name: nameController.text,
                type: type.value,
                openingBalance: balance,
              ));
            }
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          child: const Text('Сохранить'),
        ),
      ],
    ),
  );
}

Future<void> _showCategoryDialog(
  BuildContext context,
  WidgetRef ref, {
  CategoriesTableData? category,
}) async {
  final nameController = TextEditingController(text: category?.name ?? '');
  final emojiController = TextEditingController(text: category?.emoji ?? '');
  final kind = ValueNotifier<String>(category?.kind ?? 'expense');
  final colorController = TextEditingController(text: category?.colorHex ?? '');
  await showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(category == null ? 'Новая категория' : 'Редактирование категории'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Название'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: emojiController,
            decoration: const InputDecoration(labelText: 'Emoji'),
          ),
          const SizedBox(height: 12),
          DropdownButton<String>(
            value: kind.value,
            items: const [
              DropdownMenuItem(value: 'expense', child: Text('Расход')),
              DropdownMenuItem(value: 'income', child: Text('Доход')),
            ],
            onChanged: (value) => kind.value = value ?? 'expense',
          ),
          const SizedBox(height: 12),
          TextField(
            controller: colorController,
            decoration: const InputDecoration(labelText: 'Цвет (hex)'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        FilledButton(
          onPressed: () async {
            final repo = ref.read(categoriesRepositoryProvider);
            final id = category?.id ?? 'cat-${const Uuid().v4()}';
            await repo.createOrUpdate(
              CategoriesTableCompanion(
                id: Value(id),
                name: Value(nameController.text),
                emoji: Value(emojiController.text),
                kind: Value(kind.value),
                colorHex: Value(colorController.text.isEmpty ? null : colorController.text),
              ),
            );
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          child: const Text('Сохранить'),
        ),
      ],
    ),
  );
}

Future<void> _showPeriodDialog(BuildContext context, WidgetRef ref) async {
  final titleController = TextEditingController();
  final kind = ValueNotifier<String>('custom');
  final startDate = ValueNotifier<DateTime>(DateTime.now());
  final endDate = ValueNotifier<DateTime>(DateTime.now().add(const Duration(days: 14)));
  await showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Новый период'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Название'),
          ),
          const SizedBox(height: 12),
          DropdownButton<String>(
            value: kind.value,
            items: const [
              DropdownMenuItem(value: 'advance', child: Text('Аванс')),
              DropdownMenuItem(value: 'salary', child: Text('Зарплата')),
              DropdownMenuItem(value: 'custom', child: Text('Custom')),
            ],
            onChanged: (value) => kind.value = value ?? 'custom',
          ),
          const SizedBox(height: 12),
          ListTile(
            title: const Text('Начало'),
            subtitle: Text(formatDate(startDate.value)),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: startDate.value,
                firstDate: DateTime(2020),
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                startDate.value = picked;
              }
            },
          ),
          ListTile(
            title: const Text('Конец'),
            subtitle: Text(formatDate(endDate.value)),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: endDate.value,
                firstDate: startDate.value,
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                endDate.value = picked;
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        FilledButton(
          onPressed: () async {
            final repo = ref.read(periodsRepositoryProvider);
            await repo.createPeriod(
              PaycheckPeriodsTableCompanion.insert(
                id: 'period-${const Uuid().v4()}',
                title: titleController.text.isEmpty
                    ? 'Период ${startDate.value.month}.${startDate.value.year}'
                    : titleController.text,
                kind: kind.value,
                startDate: DateTime(startDate.value.year, startDate.value.month, startDate.value.day),
                endDate: DateTime(endDate.value.year, endDate.value.month, endDate.value.day, 23, 59),
              ),
            );
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          child: const Text('Сохранить'),
        ),
      ],
    ),
  );
}

Future<void> _showCriticalityDialog(
  BuildContext context,
  WidgetRef ref, {
  CriticalityTableData? item,
}) async {
  final nameController = TextEditingController(text: item?.name ?? '');
  final emojiController = TextEditingController(text: item?.iconEmoji ?? '');
  final colorController = TextEditingController(text: item?.colorHex ?? '');
  await showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(item == null ? 'Новая критичность' : 'Редактирование'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Название'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: emojiController,
            decoration: const InputDecoration(labelText: 'Emoji'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: colorController,
            decoration: const InputDecoration(labelText: 'Цвет (hex)'),
          ),
        ],
      ),
      actions: [
        if (item != null)
          TextButton(
            onPressed: () async {
              try {
                await ref
                    .read(criticalityRepositoryProvider)
                    .delete(item.id);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$e')), 
                );
              }
            },
            child: const Text('Удалить'),
          ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        FilledButton(
          onPressed: () async {
            final repo = ref.read(criticalityRepositoryProvider);
            final id = item?.id ?? 'crit-${const Uuid().v4()}';
            await repo.createOrUpdate(
              CriticalityTableCompanion(
                id: Value(id),
                name: Value(nameController.text),
                iconEmoji: Value(emojiController.text.isEmpty ? null : emojiController.text),
                colorHex: Value(colorController.text.isEmpty ? null : colorController.text),
              ),
            );
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          child: const Text('Сохранить'),
        ),
      ],
    ),
  );
}
