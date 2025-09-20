import 'package:drift/drift.dart';

import 'app_database.dart';

Future<void> runMigrations(AppDatabase db, Migrator m) async {
  await m.createAll();
}
