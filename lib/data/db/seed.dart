import 'package:drift/drift.dart';
import 'package:intl/intl.dart';

import 'app_database.dart';
import 'tables.dart';

Future<void> seedDatabase(AppDatabase db) async {
  final now = DateTime.now();
  final start = DateTime(now.year, now.month, now.day).subtract(const Duration(days: 7));
  final end = DateTime(now.year, now.month, now.day).add(const Duration(days: 7, hours: 23, minutes: 59));

  const accountCashId = 'acc-cash';
  const accountCardId = 'acc-card';
  const periodId = 'period-active';

  const groceriesCategory = 'cat-groceries';
  const transportCategory = 'cat-transport';
  const utilitiesCategory = 'cat-utilities';
  const subscriptionsCategory = 'cat-subscriptions';
  const funCategory = 'cat-fun';
  const salaryCategory = 'cat-salary';

  const necessityCriticality = 'crit-need';
  const emotionsCriticality = 'crit-emotion';
  const forcedCriticality = 'crit-forced';
  const investCriticality = 'crit-invest';
  const giftCriticality = 'crit-gift';
  const habitCriticality = 'crit-habit';

  const planGroceries = 'plan-groceries';
  const planInternet = 'plan-internet';
  const planBirthday = 'plan-birthday';
  const planFuel = 'plan-fuel';

  await db.batch((batch) {
    batch.insertAll(
      db.accountsTable,
      [
        AccountsTableCompanion.insert(
          id: accountCashId,
          name: 'Наличные',
          type: 'cash',
          currency: 'RUB',
          openingBalance: const Value(125000),
        ),
        AccountsTableCompanion.insert(
          id: accountCardId,
          name: 'Карта RUB',
          type: 'card',
          currency: 'RUB',
          openingBalance: const Value(523500),
        ),
      ],
      mode: InsertMode.insertOrIgnore,
    );

    batch.insertAll(
      db.categoriesTable,
      [
        CategoriesTableCompanion.insert(
          id: groceriesCategory,
          name: 'Продукты',
          kind: 'expense',
          emoji: '🛒',
          colorHex: const Value('#4CAF50'),
          sort: const Value(0),
        ),
        CategoriesTableCompanion.insert(
          id: transportCategory,
          name: 'Транспорт',
          kind: 'expense',
          emoji: '🚌',
          colorHex: const Value('#FF9800'),
          sort: const Value(1),
        ),
        CategoriesTableCompanion.insert(
          id: utilitiesCategory,
          name: 'Коммуналка',
          kind: 'expense',
          emoji: '💡',
          colorHex: const Value('#2196F3'),
          sort: const Value(2),
        ),
        CategoriesTableCompanion.insert(
          id: subscriptionsCategory,
          name: 'Подписки',
          kind: 'expense',
          emoji: '📺',
          colorHex: const Value('#9C27B0'),
          sort: const Value(3),
        ),
        CategoriesTableCompanion.insert(
          id: funCategory,
          name: 'Развлечения',
          kind: 'expense',
          emoji: '🎉',
          colorHex: const Value('#FF5722'),
          sort: const Value(4),
        ),
        CategoriesTableCompanion.insert(
          id: salaryCategory,
          name: 'Зарплата',
          kind: 'income',
          emoji: '💰',
          colorHex: const Value('#4CAF50'),
          sort: const Value(0),
        ),
      ],
      mode: InsertMode.insertOrIgnore,
    );

    batch.insertAll(
      db.criticalityTable,
      [
        CriticalityTableCompanion.insert(
          id: necessityCriticality,
          name: 'Необходимо',
          iconEmoji: const Value('✅'),
          sort: const Value(0),
        ),
        CriticalityTableCompanion.insert(
          id: emotionsCriticality,
          name: 'Эмоции',
          iconEmoji: const Value('🎭'),
          sort: const Value(1),
        ),
        CriticalityTableCompanion.insert(
          id: forcedCriticality,
          name: 'Вынуждено',
          iconEmoji: const Value('⚠️'),
          sort: const Value(2),
        ),
        CriticalityTableCompanion.insert(
          id: investCriticality,
          name: 'Инвестиция',
          iconEmoji: const Value('📈'),
          sort: const Value(3),
        ),
        CriticalityTableCompanion.insert(
          id: giftCriticality,
          name: 'Подарок/забота',
          iconEmoji: const Value('🎁'),
          sort: const Value(4),
        ),
        CriticalityTableCompanion.insert(
          id: habitCriticality,
          name: 'Привычка',
          iconEmoji: const Value('♻️'),
          sort: const Value(5),
        ),
      ],
      mode: InsertMode.insertOrIgnore,
    );

    batch.insert(
      db.paycheckPeriodsTable,
      PaycheckPeriodsTableCompanion.insert(
        id: periodId,
        title: 'Текущий период',
        kind: 'custom',
        startDate: start,
        endDate: end,
      ),
      mode: InsertMode.insertOrIgnore,
    );

    batch.insertAll(
      db.planItemsTable,
      [
        PlanItemsTableCompanion.insert(
          id: planGroceries,
          title: 'Плановые продукты',
          expectedAmount: 180000,
          categoryId: Value(groceriesCategory),
          periodId: periodId,
          priority: const Value(1),
          flex: const Value('elastic'),
          note: const Value('Поездка в супермаркет дважды в неделю'),
          deadline: Value(start.add(const Duration(days: 5))),
          criticalityId: const Value(necessityCriticality),
        ),
        PlanItemsTableCompanion.insert(
          id: planInternet,
          title: 'Интернет и мобильная связь',
          expectedAmount: 120000,
          categoryId: Value(utilitiesCategory),
          periodId: periodId,
          priority: const Value(0),
          flex: const Value('fixed'),
          deadline: Value(start.add(const Duration(days: 3))),
          criticalityId: const Value(necessityCriticality),
        ),
        PlanItemsTableCompanion.insert(
          id: planBirthday,
          title: 'Подарок на день рождения',
          expectedAmount: 150000,
          categoryId: Value(funCategory),
          periodId: periodId,
          priority: const Value(2),
          flex: const Value('elastic'),
          deadline: Value(end.subtract(const Duration(days: 4))),
          criticalityId: const Value(giftCriticality),
        ),
        PlanItemsTableCompanion.insert(
          id: planFuel,
          title: 'Заправка автомобиля',
          expectedAmount: 90000,
          categoryId: Value(transportCategory),
          periodId: periodId,
          priority: const Value(1),
          flex: const Value('fixed'),
          deadline: Value(start.add(const Duration(days: 6))),
          criticalityId: const Value(forcedCriticality),
        ),
      ],
      mode: InsertMode.insertOrIgnore,
    );
  });

  Future<void> insertTransaction(
    String id,
    {
      required DateTime date,
      required int amount,
      required String account,
      required String type,
      String? category,
      String? plan,
      String? criticality,
      String? note,
      bool exclude = false,
    }
  ) async {
    await db.into(db.transactionsTable).insert(
          TransactionsTableCompanion.insert(
            id: id,
            datetime: date,
            amount: amount,
            currency: 'RUB',
            accountId: account,
            type: type,
            categoryId: Value(category),
            planItemId: Value(plan),
            criticalityId: Value(criticality),
            note: Value(note),
            attachments: const Value(<String>[]),
            excludeFromBudget: Value(exclude),
          ),
          mode: InsertMode.insertOrIgnore,
        );
  }

  final formatter = DateFormat('yyyy-MM-dd HH:mm');
  final dates = List<DateTime>.generate(
    12,
    (index) => start.add(Duration(days: index, hours: 10 + index)),
  );

  await insertTransaction(
    'tx-salary',
    date: start.add(const Duration(days: 1, hours: 9)),
    amount: 2200000,
    account: accountCardId,
    type: 'income',
    category: salaryCategory,
    note: 'Зарплата за ${formatter.format(start)}',
  );

  await insertTransaction(
    'tx-grocery-1',
    date: dates[1],
    amount: 54000,
    account: accountCardId,
    type: 'expense',
    category: groceriesCategory,
    plan: planGroceries,
    criticality: necessityCriticality,
    note: 'Закупка в супермаркете',
  );

  await insertTransaction(
    'tx-transport-1',
    date: dates[2],
    amount: 32000,
    account: accountCashId,
    type: 'expense',
    category: transportCategory,
    criticality: habitCriticality,
    note: 'Такси до офиса',
  );

  await insertTransaction(
    'tx-internet',
    date: dates[3],
    amount: 110000,
    account: accountCardId,
    type: 'expense',
    category: utilitiesCategory,
    plan: planInternet,
    criticality: necessityCriticality,
    note: 'Оплата провайдера',
  );

  await insertTransaction(
    'tx-gift',
    date: dates[4],
    amount: 80000,
    account: accountCardId,
    type: 'expense',
    category: funCategory,
    plan: planBirthday,
    criticality: giftCriticality,
    note: 'Покупка подарка',
  );

  await insertTransaction(
    'tx-subscription',
    date: dates[5],
    amount: 45000,
    account: accountCardId,
    type: 'expense',
    category: subscriptionsCategory,
    criticality: emotionsCriticality,
    note: 'Стриминговый сервис',
  );

  await insertTransaction(
    'tx-grocery-2',
    date: dates[6],
    amount: 47000,
    account: accountCashId,
    type: 'expense',
    category: groceriesCategory,
    plan: planGroceries,
    criticality: necessityCriticality,
    note: 'Рынок выходного дня',
  );

  await insertTransaction(
    'tx-cafe',
    date: dates[7],
    amount: 26000,
    account: accountCardId,
    type: 'expense',
    category: funCategory,
    criticality: emotionsCriticality,
    note: 'Кофейня',
  );

  await insertTransaction(
    'tx-fuel',
    date: dates[8],
    amount: 87000,
    account: accountCardId,
    type: 'expense',
    category: transportCategory,
    plan: planFuel,
    criticality: forcedCriticality,
    note: 'Полный бак',
  );

  await insertTransaction(
    'tx-gift2',
    date: dates[9],
    amount: 35000,
    account: accountCashId,
    type: 'expense',
    category: funCategory,
    criticality: giftCriticality,
    note: 'Цветы для друзей',
  );

  await insertTransaction(
    'tx-invest',
    date: dates[10],
    amount: 60000,
    account: accountCardId,
    type: 'expense',
    category: funCategory,
    criticality: investCriticality,
    note: 'Покупка ETF',
    exclude: true,
  );

  await insertTransaction(
    'tx-transfer-out',
    date: dates[11],
    amount: 100000,
    account: accountCardId,
    type: 'transfer',
    note: 'transfer:seed-1',
  );

  await insertTransaction(
    'tx-transfer-in',
    date: dates[11].add(const Duration(minutes: 1)),
    amount: 100000,
    account: accountCashId,
    type: 'transfer',
    note: 'transfer:seed-1',
  );
}
