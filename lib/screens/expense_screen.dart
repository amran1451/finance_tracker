import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Expense {
  final String id;
  final String description;
  final double amount;
  final DateTime plannedDate;
  DateTime? completedDate;
  bool isCompleted;

  Expense({
    required this.id,
    required this.description,
    required this.amount,
    required this.plannedDate,
    this.completedDate,
    this.isCompleted = false,
  });
}

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenses = [];
  String _filter = 'all'; // all, completed, pending

  List<Expense> get expenses {
    if (_filter == 'completed') return _expenses.where((e) => e.isCompleted).toList();
    if (_filter == 'pending') return _expenses.where((e) => !e.isCompleted).toList();
    return _expenses;
  }

  double get totalPlanned => _expenses.fold(0, (sum, e) => sum + e.amount);
  double get totalCompleted => _expenses.where((e) => e.isCompleted).fold(0, (sum, e) => sum + e.amount);
  int get pendingCount => _expenses.where((e) => !e.isCompleted).length;

  void addExpense(Expense expense) {
    _expenses.insert(0, expense);
    notifyListeners();
  }

  void toggleCompleted(String id) {
    final expense = _expenses.firstWhere((e) => e.id == id);
    expense.isCompleted = !expense.isCompleted;
    expense.completedDate = expense.isCompleted ? DateTime.now() : null;
    notifyListeners();
  }

  void setFilter(String filter) {
    _filter = filter;
    notifyListeners();
  }
}

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _addExpense(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<ExpenseProvider>(context, listen: false);
      provider.addExpense(Expense(
        id: DateTime.now().toString(),
        description: _descriptionController.text,
        amount: double.parse(_amountController.text),
        plannedDate: _selectedDate,
      ));
      _amountController.clear();
      _descriptionController.clear();
      setState(() => _selectedDate = DateTime.now());
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExpenseProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Finance Tracker'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) => Provider.of<ExpenseProvider>(context, listen: false).setFilter(value),
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'all', child: Text('All')),
                const PopupMenuItem(value: 'completed', child: Text('Completed')),
                const PopupMenuItem(value: 'pending', child: Text('Pending')),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _amountController,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) => value!.isEmpty || double.tryParse(value) == null ? 'Enter valid amount' : null,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value!.isEmpty ? 'Enter description' : null,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Date: ${DateFormat.yMMMd().format(_selectedDate)}',
                          ),
                        ),
                        TextButton(
                          onPressed: () => _selectDate(context),
                          child: const Text('Select Date'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => _addExpense(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                      child: const Text('Add Expense'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Consumer<ExpenseProvider>(
                builder: (context, provider, _) => ListView.builder(
                  itemCount: provider.expenses.length,
                  itemBuilder: (context, index) {
                    final expense = provider.expenses[index];
                    return AnimatedOpacity(
                      opacity: 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          title: Text(expense.description),
                          subtitle: Text(
                            '${expense.amount.toStringAsFixed(2)} | ${DateFormat.yMMMd().format(expense.plannedDate)}' +
                                (expense.isCompleted ? ' | Done: ${DateFormat.yMMMd().format(expense.completedDate!)}' : ''),
                          ),
                          trailing: Checkbox(
                            value: expense.isCompleted,
                            onChanged: (_) => provider.toggleCompleted(expense.id),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.surfaceContainer,
              child: Consumer<ExpenseProvider>(
                builder: (context, provider, _) => Column(
                  children: [
                    Text('Planned: ${provider.totalPlanned.toStringAsFixed(2)}'),
                    Text('Completed: ${provider.totalCompleted.toStringAsFixed(2)}'),
                    Text('Pending: ${provider.pendingCount}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}