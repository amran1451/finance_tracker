import 'package:drift/drift.dart';

import 'drift_database.dart';
import 'seed.dart';

MigrationStrategy createMigrationStrategy(AppDatabase db) {
  return MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Future migrations handled here
    },
    beforeOpen: (details) async {
      if (details.wasCreated) {
        await SeedData(db).insert();
      }
    },
  );
}
