import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/drift_database.dart';
import '../models/plan_item.dart';
import 'database_provider.dart';

final plansRepositoryProvider = Provider<PlansRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return PlansRepository(db);
});

class PlansRepository {
  PlansRepository(this.db);

  final AppDatabase db;

  Future<List<PlanItem>> fetchPlans({String? periodId}) async {
    final query = db.select(db.planItemsTable);
    if (periodId != null) {
      query.where((tbl) => tbl.periodId.equals(periodId));
    }
    final rows = await query.get();
    return rows
        .map(
          (row) => PlanItem(
            id: row.id,
            title: row.title,
            expectedAmount: row.expectedAmount,
            categoryId: row.categoryId,
            tags: (jsonDecode(row.tags) as List).cast<String>(),
            deadline: row.deadline,
            periodId: row.periodId,
            priority: row.priority,
            flex: PlanFlex.values
                .firstWhere((e) => e.name == row.flex, orElse: () => PlanFlex.fixed),
            done: row.done,
          ),
        )
        .toList();
  }
}
