import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:finance_tracker/data/db/app_database.dart';
import 'package:finance_tracker/data/repositories/plan_repository.dart';
import 'package:finance_tracker/data/repositories/transactions_repository.dart';

void main() {
  group('Plan progress', () {
    late AppDatabase db;
    late PlanRepository planRepository;
    late TransactionsRepository transactionsRepository;

    setUp(() {
      db = AppDatabase(executor: NativeDatabase.memory());
      planRepository = PlanRepository(db);
      transactionsRepository = TransactionsRepository(db);
    });

    tearDown(() async {
      await db.close();
    });

    test('updates paid amount and done state with new transactions', () async {
      const periodId = 'period-test';
      const planId = 'plan-test';
      const accountId = 'account-test';
      const categoryId = 'category-test';

      await db.into(db.paycheckPeriodsTable).insert(
            PaycheckPeriodsTableCompanion.insert(
              id: periodId,
              title: 'Тестовый период',
              kind: 'custom',
              startDate: DateTime(2024, 1, 1),
              endDate: DateTime(2024, 1, 31, 23, 59),
            ),
          );
      await db.into(db.accountsTable).insert(
            AccountsTableCompanion.insert(
              id: accountId,
              name: 'Карта',
              type: 'card',
            ),
          );
      await db.into(db.categoriesTable).insert(
            CategoriesTableCompanion.insert(
              id: categoryId,
              name: 'Продукты',
              kind: 'expense',
              emoji: '🛒',
            ),
          );
      await db.into(db.planItemsTable).insert(
            PlanItemsTableCompanion.insert(
              id: planId,
              title: 'Покупка',
              expectedAmount: 100000,
              periodId: periodId,
              categoryId: const Value(categoryId),
            ),
          );

      final stream = planRepository.watchPlanForPeriod(periodId);
      final initial = await stream.first;
      expect(initial.single.paidAmount, 0);
      expect(initial.single.remaining, 100000);
      expect(initial.single.isDone, isFalse);

      await transactionsRepository.createExpense(
        id: 'tx-1',
        datetime: DateTime(2024, 1, 5, 12),
        amount: 60000,
        accountId: accountId,
        categoryId: categoryId,
        planItemId: planId,
      );

      final updated = await stream.skip(1).first;
      expect(updated.single.paidAmount, 60000);
      expect(updated.single.remaining, 40000);
      expect(updated.single.isDone, isFalse);

      await transactionsRepository.createExpense(
        id: 'tx-2',
        datetime: DateTime(2024, 1, 10, 12),
        amount: 50000,
        accountId: accountId,
        categoryId: categoryId,
        planItemId: planId,
      );

      final completed = await stream.skip(2).first;
      expect(completed.single.paidAmount, 110000);
      expect(completed.single.remaining, 0);
      expect(completed.single.isDone, isTrue);
    });
  });
}
