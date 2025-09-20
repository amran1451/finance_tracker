import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:finance_tracker/data/db/app_database.dart';
import 'package:finance_tracker/data/models/plan_models.dart';
import 'package:finance_tracker/data/repositories/summary_repository.dart';
import 'package:finance_tracker/data/repositories/transactions_repository.dart';

void main() {
  test('Summary counts only transactions inside period', () async {
    final db = AppDatabase(executor: NativeDatabase.memory());
    addTearDown(db.close);
    final txRepo = TransactionsRepository(db);
    final summaryRepo = SummaryRepository(db, txRepo);

    const periodId = 'period-test';
    const accountId = 'account-test';
    const categoryExpense = 'category-expense';
    const categoryIncome = 'category-income';

    await db.into(db.paycheckPeriodsTable).insert(
          PaycheckPeriodsTableCompanion.insert(
            id: periodId,
            title: 'Актуальный',
            kind: 'custom',
            startDate: DateTime(2024, 2, 1),
            endDate: DateTime(2024, 2, 28, 23, 59),
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
            id: categoryExpense,
            name: 'Расход',
            kind: 'expense',
            emoji: '💸',
          ),
        );
    await db.into(db.categoriesTable).insert(
          CategoriesTableCompanion.insert(
            id: categoryIncome,
            name: 'Доход',
            kind: 'income',
            emoji: '💰',
          ),
        );

    await txRepo.createIncome(
      id: 'income-inside',
      datetime: DateTime(2024, 2, 5),
      amount: 200000,
      accountId: accountId,
      categoryId: categoryIncome,
    );
    await txRepo.createExpense(
      id: 'expense-inside',
      datetime: DateTime(2024, 2, 10),
      amount: 80000,
      accountId: accountId,
      categoryId: categoryExpense,
    );
    await txRepo.createExpense(
      id: 'expense-outside',
      datetime: DateTime(2024, 3, 1),
      amount: 50000,
      accountId: accountId,
      categoryId: categoryExpense,
    );

    final period = await db
        .select(db.paycheckPeriodsTable)
        .where((tbl) => tbl.id.equals(periodId))
        .getSingle();

    final summary = await summaryRepo.watchSummary(period).first;
    expect(summary.totalIncome, 200000);
    expect(summary.totalExpenses, 80000);
    expect(summary.safeToSpend, 120000);
  });
}
