import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
