import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils/date_format.dart';
import '../../../data/models/transaction.dart';
import '../../../data/repositories/transactions_repo.dart';
import '../../common/controllers/filters_controller.dart';

final transactionsProvider = FutureProvider<List<FinanceTransaction>>((ref) async {
  final repo = ref.watch(transactionsRepositoryProvider);
  final filters = ref.watch(filtersNotifierProvider);
  final transactions = await repo.fetchTransactions();
  return transactions.where((tx) {
    if (filters.planned != null && tx.planned != filters.planned) {
      return false;
    }
    if (filters.query != null && filters.query!.isNotEmpty) {
      return tx.note?.toLowerCase().contains(filters.query!.toLowerCase()) ?? false;
    }
    return true;
  }).toList();
});

String formatTransactionDate(DateTime date) => formatDate(date);
