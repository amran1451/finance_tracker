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
              return Dismissible(
                key: ValueKey(tx.key),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 16),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) {
                  tx.delete();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Транзакция удалена')),
                  );
                },
                child: ListTile(
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}