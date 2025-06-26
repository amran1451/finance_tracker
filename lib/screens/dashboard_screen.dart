import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/transaction.dart';
import '../theme_notifier.dart';

// 1) Настройте цвета для ваших категорий здесь:
const Map<String, Color> categoryColors = {
  'Еда': Colors.orange,
  'Транспорт': Colors.blue,
  'Развлечения': Colors.purple,
  'Зарплата': Colors.green,
  // … добавьте остальные категории
};

// 2) Цвета-подстановки для прочих категорий:
const List<Color> fallbackColors = [
  Colors.red,
  Colors.teal,
  Colors.amber,
  Colors.indigo,
  Colors.cyan,
];

class DashboardScreen extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  const DashboardScreen({Key? key, required this.themeNotifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<FinTransaction>('transactions');
    final allTx = box.values.toList();
    final now = DateTime.now();

    // Транзакции текущего месяца
    final monthTx = allTx.where((tx) =>
        tx.date.year == now.year && tx.date.month == now.month).toList();

    // Суммарные доход и расход
    final income = monthTx
        .where((tx) => tx.amount > 0)
        .fold<double>(0, (sum, tx) => sum + tx.amount);
    final expense = monthTx
        .where((tx) => tx.amount < 0)
        .fold<double>(0, (sum, tx) => sum + tx.amount.abs());

    // 1) Расходы по категориям
    final Map<String, double> expenseSums = {};
    for (var tx in monthTx.where((tx) => tx.amount < 0)) {
      expenseSums[tx.categoryId] = (expenseSums[tx.categoryId] ?? 0) + tx.amount.abs();
    }
    final expenseEntries = expenseSums.entries.toList();
    final expenseSections = <PieChartSectionData>[];
    for (var i = 0; i < expenseEntries.length; i++) {
      final e = expenseEntries[i];
      final color = categoryColors[e.key] ?? fallbackColors[i % fallbackColors.length];
      expenseSections.add(
        PieChartSectionData(
          value: e.value,
          title: '${(e.value / (expense == 0 ? 1 : expense) * 100).toStringAsFixed(1)}%',
          radius: 50,
          titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          color: color, // здесь цвет
        ),
      );
    }

    // 2) Доходы по категориям
    final Map<String, double> incomeSums = {};
    for (var tx in monthTx.where((tx) => tx.amount > 0)) {
      incomeSums[tx.categoryId] = (incomeSums[tx.categoryId] ?? 0) + tx.amount;
    }
    final incomeEntries = incomeSums.entries.toList();
    final incomeSections = <PieChartSectionData>[];
    for (var i = 0; i < incomeEntries.length; i++) {
      final e = incomeEntries[i];
      final color = categoryColors[e.key] ?? fallbackColors[i % fallbackColors.length];
      incomeSections.add(
        PieChartSectionData(
          value: e.value,
          title: '${(e.value / (income == 0 ? 1 : income) * 100).toStringAsFixed(1)}%',
          radius: 50,
          titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          color: color, // и здесь
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(themeNotifier.value == ThemeMode.dark
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () {
              final newMode = themeNotifier.value == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark;
              themeNotifier.updateTheme(newMode);
            },
          ),
          PopupMenuButton<String>(
            onSelected: (v) {
              if (v == 'plans') Navigator.pushNamed(context, '/plans');
              if (v == 'reports') Navigator.pushNamed(context, '/reports');
            },
            itemBuilder: (_) => const [
              PopupMenuItem(value: 'plans', child: Text('Планы и лимиты')),
              PopupMenuItem(value: 'reports', child: Text('Отчёты')),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Карточки доход/расход
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCard('Доход', income, Colors.green),
                  _buildCard('Расход', expense, Colors.red),
                ],
              ),
              const SizedBox(height: 24),

              // Расходы
              const Text('Расходы по категориям',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              if (expenseSections.isNotEmpty)
                AspectRatio(
                  aspectRatio: 1.3,
                  child: PieChart(PieChartData(
                    sections: expenseSections,
                    centerSpaceRadius: 40,
                    sectionsSpace: 2,
                  )),
                )
              else
                const Center(child: Text('Нет расходов за этот месяц')),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: expenseSums.entries
                    .map((e) => Chip(label: Text('${e.key}: ${e.value.toStringAsFixed(2)} ₽')))
                    .toList(),
              ),

              const SizedBox(height: 24),

              // Доходы
              const Text('Доходы по категориям',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              if (incomeSections.isNotEmpty)
                AspectRatio(
                  aspectRatio: 1.3,
                  child: PieChart(PieChartData(
                    sections: incomeSections,
                    centerSpaceRadius: 40,
                    sectionsSpace: 2,
                  )),
                )
              else
                const Center(child: Text('Нет доходов за этот месяц')),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: incomeSums.entries
                    .map((e) => Chip(label: Text('${e.key}: ${e.value.toStringAsFixed(2)} ₽')))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, double amount, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 8),
            Text(
              '${amount.toStringAsFixed(2)} ₽',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
