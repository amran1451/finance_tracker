import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import '../models/transaction.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({Key? key}) : super(key: key);

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountCtrl = TextEditingController();
  late TextEditingController _categoryCtrl;
  late TextEditingController _accountCtrl;
  late TextEditingController _commentCtrl;
  DateTime _selectedDate = DateTime.now();
  bool _isIncome = true;
  final _uuid = const Uuid();
  late Box<FinTransaction> _box;

  @override
  void initState() {
    super.initState();
    _box = Hive.box<FinTransaction>('transactions');
  }

  List<String> _getSuggestions(String field) {
    final values = _box.values.map((tx) {
      switch (field) {
        case 'category': return tx.categoryId;
        case 'account': return tx.accountId;
        case 'comment': return tx.comment ?? '';
        default: return '';
      }
    }).toSet().where((s) => s.isNotEmpty).toList();
    return values;
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (date != null) setState(() => _selectedDate = date);
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      final value = double.parse(_amountCtrl.text.replaceAll(',', '.'));
      final signed = _isIncome ? value : -value;
      final tx = FinTransaction(
        id: _uuid.v4(),
        date: _selectedDate,
        amount: signed,
        categoryId: _categoryCtrl.text,
        accountId: _accountCtrl.text,
        comment: _commentCtrl.text.isNotEmpty ? _commentCtrl.text : null,
      );
      _box.add(tx);
      Navigator.pop(context);
    }
  }

  void _cancel() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить транзакцию')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => setState(() => _isIncome = true),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: _isIncome ? Colors.green.withOpacity(0.2) : null,
                            ),
                            child: const Text('Доход'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => setState(() => _isIncome = false),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: !_isIncome ? Colors.red.withOpacity(0.2) : null,
                            ),
                            child: const Text('Расход'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _amountCtrl,
                      decoration: const InputDecoration(labelText: 'Сумма (₽)'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      validator: (v) => v == null || v.isEmpty ? 'Введите сумму' : null,
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      title: Text('Дата: '
                          '${_selectedDate.day.toString().padLeft(2, '0')}.'
                          '${_selectedDate.month.toString().padLeft(2, '0')}.'
                          '${_selectedDate.year}'),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: _pickDate,
                    ),
                    const SizedBox(height: 12),
                    Autocomplete<String>(
                      optionsBuilder: (t) => _getSuggestions('category')
                          .where((e) => e.toLowerCase().contains(t.text.toLowerCase())),
                      fieldViewBuilder: (context, ctrl, focus, submit) {
                        _categoryCtrl = ctrl;
                        return TextFormField(
                          controller: ctrl,
                          decoration: const InputDecoration(labelText: 'Категория'),
                          validator: (v) => v == null || v.isEmpty ? 'Введите категорию' : null,
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    Autocomplete<String>(
                      optionsBuilder: (t) => _getSuggestions('account')
                          .where((e) => e.toLowerCase().contains(t.text.toLowerCase())),
                      fieldViewBuilder: (context, ctrl, focus, submit) {
                        _accountCtrl = ctrl;
                        return TextFormField(
                          controller: ctrl,
                          decoration: const InputDecoration(labelText: 'Счёт'),
                          validator: (v) => v == null || v.isEmpty ? 'Введите счёт' : null,
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    Autocomplete<String>(
                      optionsBuilder: (t) => _getSuggestions('comment')
                          .where((e) => e.toLowerCase().contains(t.text.toLowerCase())),
                      fieldViewBuilder: (context, ctrl, focus, submit) {
                        _commentCtrl = ctrl;
                        return TextFormField(
                          controller: ctrl,
                          decoration: const InputDecoration(labelText: 'Комментарий'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: _save, child: const Text('Сохранить')),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(onPressed: _cancel, child: const Text('Отмена')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}