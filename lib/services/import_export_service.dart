import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../data/repositories/transactions_repo.dart';

final importExportServiceProvider = Provider<ImportExportService>((ref) {
  final repo = ref.watch(transactionsRepositoryProvider);
  return ImportExportService(repo);
});

class ImportExportService {
  ImportExportService(this._transactionsRepository);

  final TransactionsRepositoryBase _transactionsRepository;

  Future<File> exportCsv() async {
    final transactions = await _transactionsRepository.fetchTransactions();
    final buffer = StringBuffer('id,datetime,amount,currency\n');
    for (final tx in transactions) {
      buffer.writeln(
          '${tx.id},${tx.datetime.toIso8601String()},${tx.amount},${tx.currency}');
    }
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/finvault_export.csv');
    await file.writeAsString(buffer.toString());
    return file;
  }

  Future<void> importCsv() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['csv']);
    if (result == null) return;
    final file = File(result.files.single.path!);
    final content = await file.readAsString();
    final lines = const LineSplitter().convert(content);
    // Skip header and log rows - a stub for actual import
    for (var i = 1; i < lines.length; i++) {
      // parsing stub
    }
  }
}
