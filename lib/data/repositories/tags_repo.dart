import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/drift_database.dart';
import '../models/tag.dart';
import 'database_provider.dart';

final tagsRepositoryProvider = Provider<TagsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return TagsRepository(db);
});

class TagsRepository {
  TagsRepository(this.db);

  final AppDatabase db;

  Future<List<Tag>> fetchTags() async {
    final rows = await db.select(db.tagsTable).get();
    return rows
        .map((row) => Tag(id: row.id, name: row.name, colorHex: row.colorHex))
        .toList();
  }
}
