import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/app_database.dart';
import 'database_provider.dart';

class PeriodsRepository {
  PeriodsRepository(this._db);

  final AppDatabase _db;

  Stream<PaycheckPeriodsTableData?> watchActivePeriod() {
    final query = _db.select(_db.paycheckPeriodsTable);
    return query.watch().map(_resolveActive);
  }

  Stream<List<PaycheckPeriodsTableData>> watchAll() {
    final query = _db.select(_db.paycheckPeriodsTable);
    query.orderBy([(tbl) => OrderingTerm(expression: tbl.startDate, mode: OrderingMode.desc)]);
    return query.watch();
  }

  Future<List<PaycheckPeriodsTableData>> fetchAll() {
    final query = _db.select(_db.paycheckPeriodsTable);
    query.orderBy([(tbl) => OrderingTerm(expression: tbl.startDate, mode: OrderingMode.desc)]);
    return query.get();
  }

  Future<PaycheckPeriodsTableData?> getActivePeriod() async {
    final all = await _db.select(_db.paycheckPeriodsTable).get();
    return _resolveActive(all);
  }

  PaycheckPeriodsTableData? _resolveActive(
    List<PaycheckPeriodsTableData> periods,
  ) {
    final now = DateTime.now();
    final sorted = [...periods]
      ..sort((a, b) => a.startDate.compareTo(b.startDate));
    for (final period in sorted) {
      if (!period.closed &&
          !period.startDate.isAfter(now) &&
          !period.endDate.isBefore(now)) {
        return period;
      }
    }
    return sorted.isNotEmpty ? sorted.last : null;
  }

  Future<void> createPeriod(PaycheckPeriodsTableCompanion companion) async {
    if (!companion.startDate.present || !companion.endDate.present) {
      throw ArgumentError('Start and end date must be provided');
    }
    final periods = await _db.select(_db.paycheckPeriodsTable).get();
    final newStart = companion.startDate.value;
    final newEnd = companion.endDate.value;
    for (final period in periods) {
      final overlaps = !(newEnd.isBefore(period.startDate) ||
          newStart.isAfter(period.endDate));
      if (overlaps) {
        throw Exception('Новый период пересекается с существующим');
      }
    }
    await _db.into(_db.paycheckPeriodsTable).insert(companion);
  }

  Future<void> updatePeriod(PaycheckPeriodsTableData data) {
    return _db.update(_db.paycheckPeriodsTable).replace(data);
  }

  Future<PaycheckPeriodsTableData?> getById(String id) {
    return (_db.select(_db.paycheckPeriodsTable)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<void> closePeriod(String id) {
    return (_db.update(_db.paycheckPeriodsTable)
          ..where((tbl) => tbl.id.equals(id)))
        .write(const PaycheckPeriodsTableCompanion(closed: Value(true)));
  }

  Future<PaycheckPeriodsTableData?> findNextPeriod(
    PaycheckPeriodsTableData current,
  ) async {
    final all = await _db.select(_db.paycheckPeriodsTable).get();
    final candidates = all
        .where((p) => p.startDate.isAfter(current.endDate))
        .toList()
      ..sort((a, b) => a.startDate.compareTo(b.startDate));
    return candidates.isNotEmpty ? candidates.first : null;
  }
}

final periodsRepositoryProvider = Provider<PeriodsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return PeriodsRepository(db);
});
