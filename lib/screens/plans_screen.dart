import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/transaction.dart';
import '../models/limit.dart';
import 'add_limit_screen.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txBox = Hive.box<FinTransaction>('transactions');
    final limitBox = Hive.box<Limit>('limits');

    return Scaffold(
      appBar: AppBar(title: const Text('Планы и лимиты')),
      body: ValueListenableBuilder(
        valueListenable: limitBox.listenable(),
        builder: (context, Box<Limit> box, _) {
          if (box.isEmpty) {
            return const Center(child: Text('Нет лимитов'));
          }
          final limits = box.values.toList();
          return ListView.builder(
            itemCount: limits.length,
            itemBuilder: (context, i) {
              final limit = limits[i];
              // Сумма расходов по категории за текущий месяц
              final now = DateTime.now();
              final spent = txBox.values
                  .where((tx) => tx.categoryId == limit.categoryId)
                  .where((tx) => tx.date.year == now.year && tx.date.month == now.month)
                  .where((tx) => tx.amount < 0)
                  .fold<double>(0, (sum, tx) => sum + tx.amount.abs());
              final ratio = (spent / limit.amount).clamp(0.0, 1.0);
              return Dismissible(
                key: ValueKey(limit.key),
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
                  limit.delete();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Лимит удалён')),
                  );
                },
                child: ListTile(
                  title: Text(limit.categoryId),
                  subtitle: LinearProgressIndicator(value: ratio),
                  trailing: Text('${spent.toStringAsFixed(0)}/${limit.amount.toStringAsFixed(0)} ₽'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddLimitScreen()),
        ),
      ),
    );
  }
}