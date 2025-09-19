import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/drift_database.dart';
import '../models/category.dart';
import 'database_provider.dart';

final categoriesRepositoryProvider = Provider<CategoriesRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return CategoriesRepository(db);
});

class CategoriesRepository {
  CategoriesRepository(this.db);

  final AppDatabase db;

  Future<List<Category>> fetchCategories() async {
    final rows = await db.select(db.categoriesTable).get();
    return rows
        .map(
          (row) => Category(
            id: row.id,
            name: row.name,
            emoji: row.emoji,
            parentId: row.parentId,
            colorHex: row.colorHex,
            hidden: row.hidden,
          ),
        )
        .toList();
  }
}
