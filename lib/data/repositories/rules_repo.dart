import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/drift_database.dart';
import '../models/rule.dart';
import 'database_provider.dart';

final rulesRepositoryProvider = Provider<RulesRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return RulesRepository(db);
});

class RulesRepository {
  RulesRepository(this.db);

  final AppDatabase db;

  Future<List<Rule>> fetchRules() async {
    final rows = await db.select(db.rulesTable).get();
    return rows
        .map(
          (row) => Rule(
            id: row.id,
            condition: RuleCondition.fromJson(jsonDecode(row.condition) as Map<String, dynamic>),
            action: RuleAction.fromJson(jsonDecode(row.action) as Map<String, dynamic>),
            priority: row.priority,
          ),
        )
        .toList();
  }
}
