import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/drift_database.dart';
import '../models/paycheck_period.dart';
import 'database_provider.dart';

final periodsRepositoryProvider = Provider<PeriodsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return PeriodsRepository(db);
});

class PeriodsRepository {
  PeriodsRepository(this.db);

  final AppDatabase db;

  Future<List<PaycheckPeriod>> fetchPeriods() async {
    final rows = await db.select(db.paycheckPeriodsTable).get();
    return rows
        .map(
          (row) => PaycheckPeriod(
            id: row.id,
            title: row.title,
            startDate: row.startDate,
            endDate: row.endDate,
            kind: PaycheckPeriodKind.values
                .firstWhere((e) => e.name == row.kind, orElse: () => PaycheckPeriodKind.custom),
            closed: row.closed,
          ),
        )
        .toList();
  }
}
