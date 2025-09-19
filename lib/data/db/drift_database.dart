import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'migrations.dart';
import 'tables.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    AccountsTable,
    PaycheckPeriodsTable,
    CategoriesTable,
    TagsTable,
    MerchantsTable,
    TransactionsTable,
    PlanItemsTable,
    BudgetsTable,
    GoalsTable,
    SubscriptionsTable,
    RulesTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => createMigrationStrategy(this);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'finvault.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
