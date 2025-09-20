import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/app_database.dart';
import 'database_provider.dart';

class CriticalityRepository {
  CriticalityRepository(this._db);

  final AppDatabase _db;

  Stream<List<CriticalityTableData>> watchActive() {
    final query = _db.select(_db.criticalityTable)
      ..where((tbl) => tbl.archived.equals(false));
    query.orderBy([(tbl) => OrderingTerm(expression: tbl.sort)]);
    return query.watch();
  }

  Stream<List<CriticalityTableData>> watchAll() {
    final query = _db.select(_db.criticalityTable);
    query.orderBy([(tbl) => OrderingTerm(expression: tbl.sort)]);
    return query.watch();
  }

  Future<void> createOrUpdate(CriticalityTableCompanion companion) {
    return _db.into(_db.criticalityTable).insert(
          companion,
          mode: InsertMode.insertOrReplace,
        );
  }

  Future<void> archive(String id, {bool archived = true}) {
    return (_db.update(_db.criticalityTable)
          ..where((tbl) => tbl.id.equals(id)))
        .write(CriticalityTableCompanion(archived: Value(archived)));
  }

  Future<void> updateSort(String id, int sort) {
    return (_db.update(_db.criticalityTable)
          ..where((tbl) => tbl.id.equals(id)))
        .write(CriticalityTableCompanion(sort: Value(sort)));
  }

  Future<void> delete(String id) async {
    final planCount = await (_db.select(_db.planItemsTable)
          ..where((tbl) => tbl.criticalityId.equals(id)))
        .get()
        .then((rows) => rows.length);
    final txCount = await (_db.select(_db.transactionsTable)
          ..where((tbl) => tbl.criticalityId.equals(id)))
        .get()
        .then((rows) => rows.length);
    final totalRefs = planCount + txCount;
    if (totalRefs > 0) {
      throw Exception('Нельзя удалить: критичность используется. Архивируйте.');
    }
    await (_db.delete(_db.criticalityTable)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}

final criticalityRepositoryProvider = Provider<CriticalityRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return CriticalityRepository(db);
});
