import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/app_database.dart';
import '../models/plan_models.dart';
import 'database_provider.dart';
import 'transactions_repository.dart';

class SummaryRepository {
  SummaryRepository(this._db, this._transactionsRepository);

  final AppDatabase _db;
  final TransactionsRepository _transactionsRepository;

  Stream<PeriodSummary> watchSummary(PaycheckPeriodsTableData period) {
    final query = _db.customSelect(
      '''
      SELECT
        (SELECT COALESCE(SUM(expected_amount), 0) FROM plan_items_table WHERE period_id = ?) AS plan_expected,
        (SELECT COALESCE(SUM(amount), 0) FROM transactions_table WHERE type = 'income' AND exclude_from_budget = 0 AND datetime BETWEEN ? AND ?) AS total_income,
        (SELECT COALESCE(SUM(amount), 0) FROM transactions_table WHERE type = 'expense' AND exclude_from_budget = 0 AND datetime BETWEEN ? AND ?) AS total_expense,
        (SELECT COALESCE(SUM(amount), 0) FROM transactions_table WHERE type = 'expense' AND plan_item_id IS NOT NULL AND exclude_from_budget = 0 AND datetime BETWEEN ? AND ?) AS planned_expense,
        (SELECT COALESCE(SUM(amount), 0) FROM transactions_table WHERE type = 'expense' AND plan_item_id IS NULL AND exclude_from_budget = 0 AND datetime BETWEEN ? AND ?) AS unplanned_expense
      ''',
      variables: [
        Variable(period.id),
        Variable(period.startDate),
        Variable(period.endDate),
        Variable(period.startDate),
        Variable(period.endDate),
        Variable(period.startDate),
        Variable(period.endDate),
        Variable(period.startDate),
        Variable(period.endDate),
      ],
      readsFrom: {
        _db.planItemsTable,
        _db.transactionsTable,
      },
    );

    return query.watchSingle().asyncMap((row) async {
      final planExpected = row.read<int>('plan_expected') ?? 0;
      final income = row.read<int>('total_income') ?? 0;
      final expense = row.read<int>('total_expense') ?? 0;
      final plannedExpense = row.read<int>('planned_expense') ?? 0;
      final unplannedExpense = row.read<int>('unplanned_expense') ?? 0;
      final planRemaining = planExpected - plannedExpense;
      final safeToSpend = income - expense - (planRemaining > 0 ? planRemaining : 0);
      final criticalityMap =
          await _transactionsRepository.amountsByCriticality(period);
      final criticalities = <CriticalitySlice>[];
      final totalCriticality = criticalityMap.values.fold<int>(0, (a, b) => a + b);
      for (final entry in criticalityMap.entries) {
        final criticality = await (_db.select(_db.criticalityTable)
              ..where((tbl) => tbl.id.equals(entry.key)))
            .getSingleOrNull();
        if (criticality != null) {
          final share = totalCriticality == 0
              ? 0
              : entry.value / totalCriticality;
          criticalities.add(
            CriticalitySlice(
              criticality: criticality,
              totalAmount: entry.value,
              share: share,
            ),
          );
        }
      }
      criticalities.sort(
        (a, b) => b.totalAmount.compareTo(a.totalAmount),
      );
      return PeriodSummary(
        period: period,
        safeToSpend: safeToSpend,
        totalIncome: income,
        totalExpenses: expense,
        plannedExpenses: plannedExpense,
        unplannedExpenses: unplannedExpense,
        planExpected: planExpected,
        criticalitySlices: criticalities,
      );
    });
  }
}

final summaryRepositoryProvider = Provider<SummaryRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final txRepo = ref.watch(transactionsRepositoryProvider);
  return SummaryRepository(db, txRepo);
});
