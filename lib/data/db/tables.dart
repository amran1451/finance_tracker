import 'dart:convert';

import 'package:drift/drift.dart';

part 'tables.g.dart';

class AccountsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  TextColumn get currency =>
      text().withDefault(const Constant('RUB'))();
  IntColumn get openingBalance =>
      integer().withDefault(const Constant(0))();
  BoolColumn get archived =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class CategoriesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get kind => text()();
  TextColumn get emoji => text()();
  TextColumn get parentId =>
      text().nullable().references(CategoriesTable, #id)();
  TextColumn get colorHex => text().nullable()();
  BoolColumn get hidden => boolean().withDefault(const Constant(false))();
  IntColumn get sort => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [
        Index(
          'idx_categories_kind_sort',
          'CREATE INDEX IF NOT EXISTS idx_categories_kind_sort ON categories (kind, sort)',
        ),
      ];
}

class PaycheckPeriodsTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get kind => text()();
  BoolColumn get closed =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class PlanItemsTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get expectedAmount => integer()();
  TextColumn get categoryId =>
      text().nullable().references(CategoriesTable, #id)();
  TextColumn get periodId =>
      text().references(PaycheckPeriodsTable, #id)();
  DateTimeColumn get deadline => dateTime().nullable()();
  IntColumn get priority => integer().withDefault(const Constant(0))();
  TextColumn get flex => text().withDefault(const Constant('fixed'))();
  BoolColumn get done => boolean().withDefault(const Constant(false))();
  TextColumn get criticalityId =>
      text().nullable().references(CriticalityTable, #id)();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [
        Index(
          'idx_plan_period',
          'CREATE INDEX IF NOT EXISTS idx_plan_period ON plan_items (period_id)',
        ),
      ];
}

class CriticalityTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get colorHex => text().nullable()();
  TextColumn get iconEmoji => text().nullable()();
  IntColumn get sort => integer().withDefault(const Constant(0))();
  BoolColumn get archived =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [
        Index(
          'idx_criticality_sort',
          'CREATE INDEX IF NOT EXISTS idx_criticality_sort ON criticality (sort, archived)',
        ),
      ];
}

class TransactionsTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get datetime => dateTime()();
  IntColumn get amount => integer()();
  TextColumn get currency => text()();
  TextColumn get accountId =>
      text().references(AccountsTable, #id)();
  TextColumn get type => text()();
  TextColumn get categoryId =>
      text().nullable().references(CategoriesTable, #id)();
  TextColumn get planItemId =>
      text().nullable().references(PlanItemsTable, #id)();
  TextColumn get criticalityId =>
      text().nullable().references(CriticalityTable, #id)();
  TextColumn get note => text().nullable()();
  TextColumn get attachments =>
      text().map(const StringListConverter())();
  BoolColumn get excludeFromBudget =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [
        Index(
          'idx_tx_datetime_account',
          'CREATE INDEX IF NOT EXISTS idx_tx_datetime_account ON transactions (datetime, account_id)',
        ),
        Index(
          'idx_tx_category_datetime',
          'CREATE INDEX IF NOT EXISTS idx_tx_category_datetime ON transactions (category_id, datetime)',
        ),
        Index(
          'idx_tx_plan',
          'CREATE INDEX IF NOT EXISTS idx_tx_plan ON transactions (plan_item_id)',
        ),
        Index(
          'idx_tx_criticality',
          'CREATE INDEX IF NOT EXISTS idx_tx_criticality ON transactions (criticality_id)',
        ),
      ];
}

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    if (fromDb.isEmpty) {
      return const [];
    }
    final decoded = jsonDecode(fromDb) as List<dynamic>;
    return decoded.map((e) => e.toString()).toList();
  }

  @override
  String toSql(List<String> value) => jsonEncode(value);
}
