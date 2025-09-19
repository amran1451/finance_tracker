import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/repositories/transactions_repo.dart';

final analyticsOverviewProvider = FutureProvider<AnalyticsOverview>((ref) async {
  final repo = ref.watch(transactionsRepositoryProvider);
  final transactions = await repo.fetchTransactions();
  final byDate = <DateTime, double>{};
  for (final transaction in transactions) {
    final key = DateTime(transaction.datetime.year, transaction.datetime.month, transaction.datetime.day);
    byDate.update(key, (value) => value + transaction.amount.abs(), ifAbsent: () => transaction.amount.abs());
  }
  final planned = transactions.where((tx) => tx.planned).fold<double>(0, (sum, tx) => sum + tx.amount.abs());
  final unplanned = transactions.where((tx) => !tx.planned).fold<double>(0, (sum, tx) => sum + tx.amount.abs());
  return AnalyticsOverview(planned: planned, unplanned: unplanned, heatmap: byDate);
});

class AnalyticsOverview {
  AnalyticsOverview({required this.planned, required this.unplanned, required this.heatmap});

  final double planned;
  final double unplanned;
  final Map<DateTime, double> heatmap;
}
