import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/drift_database.dart';
import '../models/merchant.dart';
import 'database_provider.dart';

final merchantsRepositoryProvider = Provider<MerchantsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return MerchantsRepository(db);
});

class MerchantsRepository {
  MerchantsRepository(this.db);

  final AppDatabase db;

  Future<List<Merchant>> fetchMerchants() async {
    final rows = await db.select(db.merchantsTable).get();
    return rows
        .map((row) => Merchant(
              id: row.id,
              name: row.name,
              location: row.location,
              ruleHint: row.ruleHint,
            ))
        .toList();
  }
}
