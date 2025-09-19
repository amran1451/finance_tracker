import 'package:finance_tracker/data/models/transaction.dart';
import 'package:finance_tracker/data/repositories/transactions_repo.dart';
import 'package:finance_tracker/features/quick_add/controller/quick_add_controller.dart';
import 'package:finance_tracker/features/quick_add/view/quick_add_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _FakeTransactionsRepository implements TransactionsRepositoryBase {
  final List<FinanceTransaction> saved = [];

  @override
  Future<void> add(FinanceTransaction transaction) async {
    saved.add(transaction);
  }

  @override
  Future<List<FinanceTransaction>> fetchTransactions() async => saved;
}

void main() {
  testWidgets('Quick add saves amount', (tester) async {
    final fakeRepo = _FakeTransactionsRepository();
    await tester.pumpWidget(ProviderScope(
      overrides: [
        transactionsRepositoryProvider.overrideWithValue(fakeRepo),
      ],
      child: const MaterialApp(home: QuickAddSheet()),
    ));

    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('0'));
    await tester.pump();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(fakeRepo.saved, isNotEmpty);
  });
}
