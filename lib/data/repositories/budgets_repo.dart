import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/drift_database.dart';
import '../models/budget.dart';
import 'database_provider.dart';

final budgetsRepositoryProvider = Provider<BudgetsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return BudgetsRepository(db);
});

class BudgetsRepository {
  BudgetsRepository(this.db);

  final AppDatabase db;

  Future<List<Budget>> fetchBudgets(String periodId) async {
    final rows = await (db.select(db.budgetsTable)
          ..where((tbl) => tbl.periodId.equals(periodId)))
        .get();
    return rows
        .map(
          (row) => Budget(
            id: row.id,
            periodId: row.periodId,
            categoryId: row.categoryId,
            limitAmount: row.limitAmount,
            carryOverRule: CarryOverRule.values.firstWhere(
              (e) => e.name == row.carryOverRule,
              orElse: () => CarryOverRule.none,
            ),
            carryOverPct: row.carryOverPct,
          ),
        )
        .toList();
  }
}
