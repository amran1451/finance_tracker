import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:finance_tracker/data/db/app_database.dart';
import 'package:finance_tracker/data/repositories/transactions_repository.dart';

void main() {
  test('Transactions filter by criticality returns correct rows', () async {
    final db = AppDatabase(executor: NativeDatabase.memory());
    addTearDown(db.close);
    final txRepo = TransactionsRepository(db);

    const periodId = 'period-test';
    const accountId = 'account-test';
    const categoryId = 'category-test';
    const critNeed = 'crit-need';
    const critEmotion = 'crit-emotion';

    await db.into(db.paycheckPeriodsTable).insert(
          PaycheckPeriodsTableCompanion.insert(
            id: periodId,
            title: 'Фильтр',
            kind: 'custom',
            startDate: DateTime(2024, 1, 1),
            endDate: DateTime(2024, 1, 31, 23, 59),
          ),
        );
    await db.into(db.accountsTable).insert(
          AccountsTableCompanion.insert(
            id: accountId,
            name: 'Основной',
            type: 'cash',
          ),
        );
    await db.into(db.categoriesTable).insert(
          CategoriesTableCompanion.insert(
            id: categoryId,
            name: 'Расходы',
            kind: 'expense',
            emoji: '🛒',
          ),
        );
    await db.into(db.criticalityTable).insert(
          CriticalityTableCompanion.insert(
            id: critNeed,
            name: 'Необходимо',
          ),
        );
    await db.into(db.criticalityTable).insert(
          CriticalityTableCompanion.insert(
            id: critEmotion,
            name: 'Эмоции',
          ),
        );

    Future<void> addExpense(String id, String? criticality) {
      return txRepo.createExpense(
        id: id,
        datetime: DateTime(2024, 1, 10),
        amount: 5000,
        accountId: accountId,
        categoryId: categoryId,
        criticalityId: criticality,
      );
    }

    await addExpense('tx-need', critNeed);
    await addExpense('tx-emotion', critEmotion);
    await addExpense('tx-null', null);

    final filteredStream =
        txRepo.watchTransactions(const TransactionFilter(criticalityId: critNeed));
    final result = await filteredStream.first;
    expect(result.map((e) => e.transaction.id), ['tx-need']);
  });
}
