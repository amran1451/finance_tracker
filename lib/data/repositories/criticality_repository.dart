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
    final countColumn = countAll().aliased('count');
    final planRef = await (_db.selectOnly(_db.planItemsTable)
          ..addColumns([countColumn])
          ..where(_db.planItemsTable.criticalityId.equals(id)))
        .getSingle();
    final planCount = planRef.read(countColumn) ?? 0;
    final txRef = await (_db.selectOnly(_db.transactionsTable)
          ..addColumns([countColumn])
          ..where(_db.transactionsTable.criticalityId.equals(id)))
        .getSingle();
    final txCount = txRef.read(countColumn) ?? 0;
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
