import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/drift_database.dart';
import '../models/subscription.dart';
import 'database_provider.dart';

final subscriptionsRepositoryProvider = Provider<SubscriptionsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return SubscriptionsRepository(db);
});

class SubscriptionsRepository {
  SubscriptionsRepository(this.db);

  final AppDatabase db;

  Future<List<Subscription>> fetchSubscriptions() async {
    final rows = await db.select(db.subscriptionsTable).get();
    return rows
        .map(
          (row) => Subscription(
            id: row.id,
            provider: row.provider,
            amount: row.amount,
            currency: row.currency,
            cadence: SubscriptionCadence.values
                .firstWhere((e) => e.name == row.cadence, orElse: () => SubscriptionCadence.monthly),
            nextCharge: row.nextCharge,
            categoryId: row.categoryId,
            tags: (jsonDecode(row.tags) as List).cast<String>(),
            active: row.active,
            pause: row.pause,
          ),
        )
        .toList();
  }
}
