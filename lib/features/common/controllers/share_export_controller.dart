import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../data/repositories/transactions_repo.dart';

final shareExportControllerProvider = Provider<ShareExportController>((ref) {
  final transactionsRepo = ref.watch(transactionsRepositoryProvider);
  return ShareExportController(transactionsRepo);
});

class ShareExportController {
  ShareExportController(this._transactionsRepository);

  final TransactionsRepositoryBase _transactionsRepository;

  Future<void> exportTransactions() async {
    final transactions = await _transactionsRepository.fetchTransactions();
    final csv = StringBuffer('id,datetime,amount,currency\n');
    for (final transaction in transactions) {
      csv.writeln(
          '${transaction.id},${transaction.datetime.toIso8601String()},${transaction.amount},${transaction.currency}');
    }
    final data = csv.toString();
    await Share.shareXFiles([
      XFile.fromData(utf8.encode(data), mimeType: 'text/csv', name: 'finvault.csv'),
    ]);
  }
}
