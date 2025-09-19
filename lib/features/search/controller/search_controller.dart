import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/transaction.dart';
import '../../../data/repositories/transactions_repo.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider<List<FinanceTransaction>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  final repo = ref.watch(transactionsRepositoryProvider);
  final transactions = await repo.fetchTransactions();
  if (query.isEmpty) return transactions;
  return transactions
      .where((tx) => tx.note?.toLowerCase().contains(query.toLowerCase()) ?? false)
      .toList();
});
