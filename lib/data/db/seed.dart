import 'package:drift/drift.dart';

import 'drift_database.dart';

class SeedData {
  SeedData(this.db);

  final AppDatabase db;

  Future<void> insert() async {
    await db.batch((batch) {
      batch.insertAll(db.accountsTable, _accounts);
      batch.insertAll(db.categoriesTable, _categories);
      batch.insertAll(db.tagsTable, _tags);
      batch.insertAll(db.paycheckPeriodsTable, _periods);
      batch.insertAll(db.planItemsTable, _plans);
      batch.insertAll(db.subscriptionsTable, _subscriptions);
      batch.insertAll(db.goalsTable, _goals);
      batch.insertAll(db.transactionsTable, _transactions);
    });
  }
}

final _accounts = [
  AccountsTableCompanion.insert(
    id: 'cash',
    name: 'Наличные',
    type: 'cash',
    currency: 'RUB',
    openingBalance: const Value(5000),
  ),
  AccountsTableCompanion.insert(
    id: 'card',
    name: 'Карта',
    type: 'card',
    currency: 'RUB',
    openingBalance: const Value(12000),
  ),
];

final _categories = [
  CategoriesTableCompanion.insert(
    id: 'groceries',
    name: 'Продукты',
    emoji: '🍎',
    colorHex: '#4CAF50',
  ),
  CategoriesTableCompanion.insert(
    id: 'transport',
    name: 'Транспорт',
    emoji: '🚌',
    colorHex: '#2196F3',
  ),
  CategoriesTableCompanion.insert(
    id: 'subscriptions',
    name: 'Подписки',
    emoji: '🎧',
    colorHex: '#7B3FF2',
  ),
  CategoriesTableCompanion.insert(
    id: 'entertainment',
    name: 'Развлечения',
    emoji: '🎉',
    colorHex: '#FF9800',
  ),
  CategoriesTableCompanion.insert(
    id: 'utilities',
    name: 'Коммуналка',
    emoji: '💡',
    colorHex: '#03A9F4',
  ),
  CategoriesTableCompanion.insert(
    id: 'health',
    name: 'Здоровье',
    emoji: '💊',
    colorHex: '#E91E63',
  ),
];

final _tags = [
  TagsTableCompanion.insert(id: 'need', name: 'Необходимо'),
  TagsTableCompanion.insert(id: 'emotion', name: 'Эмоции'),
  TagsTableCompanion.insert(id: 'forced', name: 'Вынуждено'),
];

final _periods = [
  PaycheckPeriodsTableCompanion.insert(
    id: 'period_prev',
    title: 'Май 2024',
    startDate: Value(DateTime(2024, 5, 1)),
    endDate: Value(DateTime(2024, 5, 31)),
    kind: 'salary',
    closed: const Value(true),
  ),
  PaycheckPeriodsTableCompanion.insert(
    id: 'period_current',
    title: 'Июнь 2024',
    startDate: Value(DateTime(2024, 6, 1)),
    endDate: Value(DateTime(2024, 6, 30)),
    kind: 'salary',
  ),
];

final _plans = [
  PlanItemsTableCompanion.insert(
    id: 'rent',
    title: 'Аренда',
    expectedAmount: 30000,
    periodId: 'period_current',
    deadline: Value(DateTime(2024, 6, 5)),
    flex: 'fixed',
    priority: const Value(2),
    tags: const Value(<String>[]),
  ),
  PlanItemsTableCompanion.insert(
    id: 'phone',
    title: 'Связь',
    expectedAmount: 900,
    categoryId: const Value('utilities'),
    periodId: 'period_current',
    deadline: Value(DateTime(2024, 6, 10)),
    flex: 'fixed',
    priority: const Value(1),
    tags: const Value(<String>[]),
  ),
  PlanItemsTableCompanion.insert(
    id: 'groceries_week',
    title: 'Продукты на неделю',
    expectedAmount: 4500,
    categoryId: const Value('groceries'),
    periodId: 'period_current',
    deadline: Value(DateTime(2024, 6, 7)),
    flex: 'elastic',
    tags: const Value(<String>[]),
  ),
  PlanItemsTableCompanion.insert(
    id: 'gift',
    title: 'Подарок',
    expectedAmount: 5000,
    categoryId: const Value('entertainment'),
    periodId: 'period_current',
    deadline: Value(DateTime(2024, 6, 15)),
    flex: 'elastic',
    tags: const Value(<String>[]),
  ),
];

final _subscriptions = [
  SubscriptionsTableCompanion.insert(
    id: 'spotify',
    provider: 'Spotify',
    amount: 169,
    currency: 'RUB',
    cadence: 'monthly',
    nextCharge: Value(DateTime(2024, 6, 20)),
    categoryId: const Value('subscriptions'),
  ),
  SubscriptionsTableCompanion.insert(
    id: 'youtube',
    provider: 'YouTube Premium',
    amount: 199,
    currency: 'RUB',
    cadence: 'monthly',
    nextCharge: Value(DateTime(2024, 6, 25)),
    categoryId: const Value('subscriptions'),
  ),
];

final _goals = [
  GoalsTableCompanion.insert(
    id: 'cushion',
    title: 'Подушка',
    targetAmount: 30000,
    savedAmount: 7500,
    dueDate: const Value(DateTime(2024, 12, 31)),
    autoTopUpRule: const Value('{"type":"roundup"}'),
  ),
];

List<TransactionsTableCompanion> get _transactions {
  final now = DateTime.now();
  final items = <TransactionsTableCompanion>[];
  for (var i = 0; i < 12; i++) {
    final date = now.subtract(Duration(days: i * 2));
    items.add(TransactionsTableCompanion.insert(
      id: 'tx_$i',
      datetime: Value(date),
      amount: 300 + i * 15,
      currency: 'RUB',
      accountId: i.isEven ? 'cash' : 'card',
      type: 'expense',
      categoryId: const Value('groceries'),
      tags: const Value(<String>[]),
      attachments: const Value(<Map<String, dynamic>>[]),
    ));
  }
  return items;
}
