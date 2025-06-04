import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/limit.dart';

class AddLimitScreen extends StatefulWidget {
  const AddLimitScreen({Key? key}) : super(key: key);
  @override
  State<AddLimitScreen> createState() => _AddLimitScreenState();
}

class _AddLimitScreenState extends State<AddLimitScreen> {
  final _formKey = GlobalKey<FormState>();
  final _categoryCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  late Box<Limit> _box;

  @override
  void initState() {
    super.initState();
    _box = Hive.box<Limit>('limits');
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      final limit = Limit(
        categoryId: _categoryCtrl.text,
        amount: double.parse(_amountCtrl.text.replaceAll(',', '.')),
      );
      _box.add(limit);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить лимит')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _categoryCtrl,
                decoration: const InputDecoration(labelText: 'Категория'),
                validator: (v) => v == null || v.isEmpty ? 'Введите категорию' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _amountCtrl,
                decoration: const InputDecoration(labelText: 'Лимит (₽)'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (v) => v == null || v.isEmpty ? 'Введите сумму' : null,
              ),
              const Spacer(),
              ElevatedButton(onPressed: _save, child: const Text('Сохранить')),
            ],
          ),
        ),
      ),
    );
  }
}