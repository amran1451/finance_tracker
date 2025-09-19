import 'package:flutter_test/flutter_test.dart';

import 'package:finance_tracker/features/quick_add/controller/quick_add_controller.dart';
import 'package:finance_tracker/data/models/transaction.dart';
import 'package:finance_tracker/data/repositories/transactions_repo.dart';

class _FakeRepo implements TransactionsRepositoryBase {
  _FakeRepo();

  final List<FinanceTransaction> inserted = [];

  @override
  Future<void> add(FinanceTransaction transaction) async {
    inserted.add(transaction);
  }

  @override
  Future<List<FinanceTransaction>> fetchTransactions() async => inserted;
}

void main() {
  test('QuickAddNotifier builds amount correctly', () async {
    final repo = _FakeRepo();
    final notifier = QuickAddNotifier(repo);
    notifier.appendAmount('1');
    notifier.appendAmount('0');
    notifier.togglePlanned(true);
    await notifier.submit();

    expect(repo.inserted, hasLength(1));
    expect(repo.inserted.first.planned, true);
    expect(repo.inserted.first.amount, lessThan(0));
  });
}
