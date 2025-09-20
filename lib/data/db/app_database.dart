import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables.dart';
import 'seed.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(p.join(directory.path, 'finvault.sqlite'));
    return NativeDatabase(file, logStatements: false);
  });
}

@DriftDatabase(
  tables: [
    AccountsTable,
    CategoriesTable,
    PaycheckPeriodsTable,
    PlanItemsTable,
    CriticalityTable,
    TransactionsTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase({QueryExecutor? executor})
      : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        beforeOpen: (details) async {
          if (details.wasCreated) {
            await seedDatabase(this);
          }
        },
      );
}
