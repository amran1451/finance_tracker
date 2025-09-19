import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/amount_keyboard.dart';
import '../controller/quick_add_controller.dart';

class QuickAddSheet extends ConsumerWidget {
  const QuickAddSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quickAddNotifierProvider);
    final notifier = ref.read(quickAddNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Quick add')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Amount', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(state.amount, style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 16),
            SegmentedButton<TransactionType>(
              segments: const [
                ButtonSegment(value: TransactionType.expense, label: Text('Expense'), icon: Icon(Icons.remove_circle)),
                ButtonSegment(value: TransactionType.income, label: Text('Income'), icon: Icon(Icons.add_circle)),
                ButtonSegment(value: TransactionType.transfer, label: Text('Transfer'), icon: Icon(Icons.swap_horiz)),
              ],
              selected: {state.type},
              onSelectionChanged: (value) => notifier.setType(value.first),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: state.note,
              decoration: const InputDecoration(labelText: 'Note or merchant'),
              onChanged: notifier.setNote,
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Mark as planned'),
              subtitle: const Text('Planned expenses are tracked against goals.'),
              value: state.planned,
              onChanged: notifier.togglePlanned,
            ),
            const Spacer(),
            AmountKeyboard(onInput: notifier.appendAmount),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      notifier.submit();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Save'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: () async {
                      await notifier.submit();
                    },
                    child: const Text('Save & add more'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
