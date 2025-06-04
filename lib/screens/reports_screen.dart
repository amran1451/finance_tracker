import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:csv/csv.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/transaction.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  List<List<String>> _toCsv(List<FinTransaction> txs) {
    final rows = <List<String>>[
      ['Дата', 'Категория', 'Счёт', 'Сумма', 'Комментарий']
    ];
    for (var tx in txs) {
      rows.add([
        '${tx.date.toIso8601String()}',
        tx.categoryId,
        tx.accountId,
        tx.amount.toStringAsFixed(2),
        tx.comment ?? '',
      ]);
    }
    return rows;
  }

  Future<void> _exportCsv(BuildContext context) async {
    final box = Hive.box<FinTransaction>('transactions');
    final txs = box.values.toList();
    final csv = const ListToCsvConverter().convert(_toCsv(txs));
    final doc = pw.Document()..addPage(pw.Page(build: (_) => pw.Text(csv)));
    await Printing.layoutPdf(onLayout: (_) async => doc.save());
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<FinTransaction>('transactions');
    final txs = box.values.toList()
      ..sort((a, b) => b.date.compareTo(a.date));
    return Scaffold(
      appBar: AppBar(title: const Text('Отчёты')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => _exportCsv(context),
            child: const Text('Экспорт CSV/PDF'),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: txs.length,
              itemBuilder: (ctx, i) {
                final tx = txs[i];
                return ListTile(
                  title: Text(tx.categoryId),
                  subtitle: Text('${tx.amount.toStringAsFixed(2)} ₽'),
                  trailing: Text(
                    '${tx.date.day}.${tx.date.month}.${tx.date.year}',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}