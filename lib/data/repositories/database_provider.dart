import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/drift_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});
