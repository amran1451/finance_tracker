import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/drift_database.dart';
import '../models/goal.dart';
import 'database_provider.dart';

final goalsRepositoryProvider = Provider<GoalsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return GoalsRepository(db);
});

class GoalsRepository {
  GoalsRepository(this.db);

  final AppDatabase db;

  Future<List<Goal>> fetchGoals() async {
    final rows = await db.select(db.goalsTable).get();
    return rows
        .map(
          (row) => Goal(
            id: row.id,
            title: row.title,
            targetAmount: row.targetAmount,
            savedAmount: row.savedAmount,
            dueDate: row.dueDate,
            autoTopUpRule:
                row.autoTopUpRule != null ? jsonDecode(row.autoTopUpRule!) as Map<String, dynamic> : null,
          ),
        )
        .toList();
  }
}
