import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/app_database.dart';
import '../models/plan_models.dart';
import 'database_provider.dart';

class PlanRepository {
  PlanRepository(this._db);

  final AppDatabase _db;

  Stream<List<PlanItemProgress>> watchPlanForPeriod(String periodId) {
    final query = _db.customSelect(
      '''
      SELECT p.*, 
        COALESCE(SUM(CASE WHEN t.type = 'expense' THEN t.amount ELSE 0 END), 0) AS paid_amount
      FROM plan_items_table AS p
      LEFT JOIN transactions_table AS t ON t.plan_item_id = p.id
      WHERE p.period_id = ?
      GROUP BY p.id
      ORDER BY p.priority DESC, p.deadline IS NULL, p.deadline
      ''',
      variables: [Variable(periodId)],
      readsFrom: {_db.planItemsTable, _db.transactionsTable},
    );

    return query.watch().map((rows) {
      return rows.map((row) {
        final data = _db.planItemsTable.map(row.data);
        final paid = row.read<int>('paid_amount');
        final remaining = (data.expectedAmount - paid);
        final remainingClamped = remaining < 0 ? 0 : remaining;
        final done = paid >= data.expectedAmount;
        return PlanItemProgress(
          item: data.copyWith(done: done),
          paidAmount: paid,
          remaining: remainingClamped,
          isDone: done,
        );
      }).toList();
    });
  }

  Future<void> createPlanItem(PlanItemsTableCompanion companion) {
    return _db.into(_db.planItemsTable).insert(companion);
  }

  Future<void> updatePlanItem(PlanItemsTableData data) {
    return _db.update(_db.planItemsTable).replace(data);
  }

  Future<void> markDone(String planId, bool done) {
    return (_db.update(_db.planItemsTable)
          ..where((tbl) => tbl.id.equals(planId)))
        .write(PlanItemsTableCompanion(done: Value(done)));
  }

  Future<void> movePlanToPeriod(String planId, String newPeriodId) {
    return (_db.update(_db.planItemsTable)
          ..where((tbl) => tbl.id.equals(planId)))
        .write(PlanItemsTableCompanion(periodId: Value(newPeriodId)));
  }

  Future<void> deletePlan(String planId) {
    return (_db.delete(_db.planItemsTable)
          ..where((tbl) => tbl.id.equals(planId)))
        .go();
  }
}

final planRepositoryProvider = Provider<PlanRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return PlanRepository(db);
});
