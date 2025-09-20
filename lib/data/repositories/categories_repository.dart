import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/app_database.dart';
import 'database_provider.dart';

class CategoriesRepository {
  CategoriesRepository(this._db);

  final AppDatabase _db;

  Stream<List<CategoriesTableData>> watchByKind(String kind) {
    final query = _db.select(_db.categoriesTable)
      ..where((tbl) => tbl.kind.equals(kind) & tbl.hidden.equals(false));
    query.orderBy([(tbl) => OrderingTerm(expression: tbl.sort)]);
    return query.watch();
  }

  Future<List<CategoriesTableData>> fetchAll() {
    final query = _db.select(_db.categoriesTable);
    query.orderBy([
      (tbl) => OrderingTerm(expression: tbl.kind),
      (tbl) => OrderingTerm(expression: tbl.sort),
    ]);
    return query.get();
  }

  Future<void> createOrUpdate(CategoriesTableCompanion companion) {
    return _db.into(_db.categoriesTable).insert(
          companion,
          mode: InsertMode.insertOrReplace,
        );
  }

  Future<void> hideCategory(String id, {bool hidden = true}) {
    return (_db.update(_db.categoriesTable)
          ..where((tbl) => tbl.id.equals(id)))
        .write(CategoriesTableCompanion(hidden: Value(hidden)));
  }
}

final categoriesRepositoryProvider = Provider<CategoriesRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return CategoriesRepository(db);
});
