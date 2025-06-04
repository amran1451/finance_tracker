import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/transaction.dart';

class TransactionsListScreen extends StatelessWidget {
  const TransactionsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<FinTransaction>('transactions');
    return Scaffold(
      appBar: AppBar(title: const Text('Список транзакций')),
      body: ValueListenableBuilder<Box<FinTransaction>>(
        valueListenable: box.listenable(),
        builder: (context, box, _) {
          final transactions = box.values.toList()
            ..sort((a, b) => b.date.compareTo(a.date));
          if (transactions.isEmpty) {
            return const Center(child: Text('Нет транзакций'));
          }
          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final tx = transactions[index];
              return ListTile(
                leading: Text(
                  '${tx.date.day.toString().padLeft(2, '0')}.${tx.date.month.toString().padLeft(2, '0')}.${tx.date.year}',
                  style: const TextStyle(fontSize: 16),
                ),
                title: Text(
                  tx.amount >= 0
                    ? '+${tx.amount.toStringAsFixed(2)} ₽'
                    : '${tx.amount.toStringAsFixed(2)} ₽',
                  style: TextStyle(
                    color: tx.amount >= 0 ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(tx.comment ?? tx.categoryId),
              );
            },
          );
        },
      ),
    );
  }
}