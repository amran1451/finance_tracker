import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../core/utils/money.dart';
import '../../data/db/app_database.dart';
import '../../data/models/plan_models.dart';
import '../../data/repositories/periods_repository.dart';
import '../../data/repositories/plan_repository.dart';
import '../common/providers.dart';
import '../home/home_providers.dart';

class PlanScreen extends HookConsumerWidget {
  const PlanScreen({super.key});

  static const routePath = '/plan';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planItems = ref.watch(planItemsProvider);
    final period = ref.watch(activePeriodProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('План периода'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openPlanItemDialog(context, ref, period.value),
        icon: const Icon(Icons.add),
        label: const Text('Новый план'),
      ),
      body: planItems.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Text('Планов пока нет. Создайте первый!'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final progress = items[index];
              return _PlanCard(
                progress: progress,
                onAction: (action) => _handleAction(
                  context,
                  ref,
                  action,
                  progress,
                  period.value,
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Ошибка: $error')),
      ),
    );
  }

  Future<void> _handleAction(
    BuildContext context,
    WidgetRef ref,
    _PlanAction action,
    PlanItemProgress progress,
    PaycheckPeriodsTableData? period,
  ) async {
    final planRepo = ref.read(planRepositoryProvider);
    switch (action) {
      case _PlanAction.complete:
        await planRepo.markDone(progress.item.id, !progress.isDone);
        break;
      case _PlanAction.edit:
        await _openPlanItemDialog(context, ref, period, item: progress.item);
        break;
      case _PlanAction.delete:
        final confirmed = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Удалить план?'),
                content: Text('Удалить «${progress.item.title}»?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Отмена'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Удалить'),
                  ),
                ],
              ),
            ) ??
            false;
        if (confirmed) {
          await planRepo.deletePlan(progress.item.id);
        }
        break;
      case _PlanAction.move:
        if (period == null) return;
        await _moveToNextPeriod(context, ref, progress.item, period);
        break;
    }
  }

  Future<void> _moveToNextPeriod(
    BuildContext context,
    WidgetRef ref,
    PlanItemsTableData plan,
    PaycheckPeriodsTableData period,
  ) async {
    final periodsRepo = ref.read(periodsRepositoryProvider);
    final next = await periodsRepo.findNextPeriod(period);
    PaycheckPeriodsTableData target;
    if (next == null) {
      final duration = period.endDate.difference(period.startDate);
      final newStart = period.endDate.add(const Duration(days: 1));
      final newEnd = newStart.add(duration);
      final newId = 'period-${const Uuid().v4()}';
      final newPeriod = PaycheckPeriodsTableCompanion.insert(
        id: newId,
        title: 'Период ${newStart.month}.${newStart.year}',
        kind: 'custom',
        startDate: newStart,
        endDate: newEnd,
      );
      await periodsRepo.createPeriod(newPeriod);
      target = (await periodsRepo.getById(newId)) ?? period;
    } else {
      target = next;
    }
    await ref.read(planRepositoryProvider).movePlanToPeriod(plan.id, target.id);
    // Reset done flag and note retention
    await ref.read(planRepositoryProvider).markDone(plan.id, false);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Перенесено в ${target.title}')),
      );
    }
  }

  Future<void> _openPlanItemDialog(
    BuildContext context,
    WidgetRef ref,
    PaycheckPeriodsTableData? period, {
    PlanItemsTableData? item,
  }) async {
    if (period == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Создайте активный период прежде чем планировать.')),
        );
      }
      return;
    }
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: PlanItemForm(
          period: period,
          initial: item,
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({
    required this.progress,
    required this.onAction,
  });

  final PlanItemProgress progress;
  final void Function(_PlanAction action) onAction;

  @override
  Widget build(BuildContext context) {
    final paid = progress.paidAmount;
    final expected = progress.item.expectedAmount;
    final remaining = progress.remaining;
    final progressValue = expected == 0 ? 0.0 : (paid / expected).clamp(0.0, 1.0);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    progress.item.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                PopupMenuButton<_PlanAction>(
                  onSelected: onAction,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: _PlanAction.complete,
                      child:
                          Text(progress.isDone ? 'Пометить как не выполнено' : 'Пометить выполнено'),
                    ),
                    const PopupMenuItem(
                      value: _PlanAction.edit,
                      child: Text('Редактировать'),
                    ),
                    const PopupMenuItem(
                      value: _PlanAction.move,
                      child: Text('Перенести в следующий'),
                    ),
                    const PopupMenuItem(
                      value: _PlanAction.delete,
                      child: Text('Удалить'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: progressValue),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              children: [
                Chip(
                  avatar: const Icon(Icons.check_circle, size: 18),
                  label: Text('Оплачено ${formatAmount(paid)}'),
                ),
                Chip(
                  avatar: const Icon(Icons.timelapse, size: 18),
                  label: Text('Осталось ${formatAmount(remaining)}'),
                ),
                Chip(
                  avatar: const Icon(Icons.priority_high, size: 18),
                  label: Text('Приоритет ${progress.item.priority}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum _PlanAction { complete, edit, move, delete }

class PlanItemForm extends HookConsumerWidget {
  const PlanItemForm({
    required this.period,
    this.initial,
    super.key,
  });

  final PaycheckPeriodsTableData period;
  final PlanItemsTableData? initial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController(text: initial?.title ?? '');
    final amountController = useTextEditingController(
      text: initial != null
          ? (initial!.expectedAmount / 100).toStringAsFixed(2)
          : '',
    );
    final noteController = useTextEditingController(text: initial?.note ?? '');
    final priority = useState<int>(initial?.priority ?? 1);
    final flexValue = useState<String>(initial?.flex ?? 'fixed');
    final selectedCategory = useState<String?>(initial?.categoryId);
    final selectedCriticality = useState<String?>(initial?.criticalityId);
    final deadline = useState<DateTime?>(initial?.deadline);
    final planRepo = ref.read(planRepositoryProvider);
    final categoriesAsync = ref.watch(expenseCategoriesProvider);
    final criticalityAsync = ref.watch(criticalityProvider);

    Future<void> save() async {
      final title = titleController.text.trim();
      if (title.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Введите название')));
        return;
      }
      final amount = parseAmountInput(amountController.text);
      if (amount <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Укажите ожидаемую сумму')),
        );
        return;
      }
      final companion = PlanItemsTableCompanion(
        id: initial == null ? Value('plan-${const Uuid().v4()}') : Value(initial!.id),
        title: Value(title),
        expectedAmount: Value(amount.abs()),
        categoryId: Value(selectedCategory.value),
        periodId: Value(period.id),
        deadline: Value(deadline.value),
        priority: Value(priority.value),
        flex: Value(flexValue.value),
        note: Value(noteController.text.trim().isEmpty
            ? null
            : noteController.text.trim()),
        criticalityId: Value(selectedCriticality.value),
      );
      if (initial == null) {
        await planRepo.createPlanItem(companion);
      } else {
        await planRepo.updatePlanItem(initial!.copyWith(
          title: title,
          expectedAmount: amount.abs(),
          categoryId: selectedCategory.value,
          periodId: period.id,
          deadline: deadline.value,
          priority: priority.value,
          flex: flexValue.value,
          note: noteController.text.trim().isEmpty
              ? null
              : noteController.text.trim(),
          criticalityId: selectedCriticality.value,
        ));
      }
      if (context.mounted) {
        Navigator.pop(context);
      }
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(initial == null ? 'Новая плановая трата' : 'Редактирование плана',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Название'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Ожидаемая сумма (₽)'),
            ),
            const SizedBox(height: 12),
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
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: deadline.value ?? period.endDate,
                  firstDate: period.startDate,
                  lastDate: period.endDate.add(const Duration(days: 365)),
                );
                if (picked != null) {
                  deadline.value = picked;
                }
              },
              icon: const Icon(Icons.calendar_today),
              label: Text(
                deadline.value == null
                    ? 'Выбрать дедлайн'
                    : 'Дедлайн: ${deadline.value!.day}.${deadline.value!.month}.${deadline.value!.year}',
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: SegmentedButton<int>(
                    segments: const [
                      ButtonSegment(value: 0, label: Text('0')),
                      ButtonSegment(value: 1, label: Text('1')),
                      ButtonSegment(value: 2, label: Text('2')),
                    ],
                    selected: {priority.value},
                    onSelectionChanged: (value) => priority.value = value.first,
                  ),
                ),
                const SizedBox(width: 12),
                DropdownButton<String>(
                  value: flexValue.value,
                  items: const [
                    DropdownMenuItem(value: 'fixed', child: Text('Фикс')),
                    DropdownMenuItem(value: 'elastic', child: Text('Гибкий')),
                  ],
                  onChanged: (value) {
                    if (value != null) flexValue.value = value;
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            criticalityAsync.when(
              data: (items) => Wrap(
                spacing: 8,
                children: [
                  for (final item in items)
                    FilterChip(
                      label: Text(item.name),
                      selected: selectedCriticality.value == item.id,
                      onSelected: (_) =>
                          selectedCriticality.value = item.id,
                    ),
                  FilterChip(
                    label: const Text('Без критичности'),
                    selected: selectedCriticality.value == null,
                    onSelected: (_) => selectedCriticality.value = null,
                  ),
                ],
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Ошибка критичности: $error'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: noteController,
              minLines: 2,
              maxLines: 4,
              decoration: const InputDecoration(labelText: 'Комментарий'),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Отмена'),
                ),
                const SizedBox(width: 12),
                FilledButton(
                  onPressed: save,
                  child: const Text('Сохранить'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
