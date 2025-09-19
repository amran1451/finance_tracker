import 'dart:convert';

import 'package:drift/drift.dart';

class AccountsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  TextColumn get currency => text()();
  RealColumn get openingBalance => real().withDefault(const Constant(0))();
  BoolColumn get archived => boolean().withDefault(const Constant(false))();
  @override
  Set<Column> get primaryKey => {id};
}

class PaycheckPeriodsTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get kind => text()();
  BoolColumn get closed => boolean().withDefault(const Constant(false))();
  @override
  Set<Column> get primaryKey => {id};
}

class CategoriesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get emoji => text()();
  TextColumn get parentId => text().nullable().references(CategoriesTable, #id)();
  TextColumn get colorHex => text()();
  BoolColumn get hidden => boolean().withDefault(const Constant(false))();
  @override
  Set<Column> get primaryKey => {id};
}

class TagsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get colorHex => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class MerchantsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get location => text().nullable()();
  TextColumn get ruleHint => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class TransactionsTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get datetime => dateTime()();
  RealColumn get amount => real()();
  TextColumn get currency => text()();
  TextColumn get accountId => text().references(AccountsTable, #id)();
  TextColumn get type => text()();
  TextColumn get categoryId => text().nullable().references(CategoriesTable, #id)();
  TextColumn get tags => text().map(const StringListConverter())();
  TextColumn get merchantId => text().nullable().references(MerchantsTable, #id)();
  TextColumn get note => text().nullable()();
  TextColumn get attachments => text().map(const AttachmentListConverter())();
  BoolColumn get planned => boolean().withDefault(const Constant(false))();
  TextColumn get planItemId => text().nullable().references(PlanItemsTable, #id)();
  BoolColumn get excludeFromBudget => boolean().withDefault(const Constant(false))();
  @override
  Set<Column> get primaryKey => {id};
}

class PlanItemsTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  RealColumn get expectedAmount => real()();
  TextColumn get categoryId => text().nullable().references(CategoriesTable, #id)();
  TextColumn get tags => text().map(const StringListConverter())();
  DateTimeColumn get deadline => dateTime()();
  TextColumn get periodId => text().references(PaycheckPeriodsTable, #id)();
  IntColumn get priority => integer().withDefault(const Constant(0))();
  TextColumn get flex => text()();
  BoolColumn get done => boolean().withDefault(const Constant(false))();
  @override
  Set<Column> get primaryKey => {id};
}

class BudgetsTable extends Table {
  TextColumn get id => text()();
  TextColumn get periodId => text().references(PaycheckPeriodsTable, #id)();
  TextColumn get categoryId => text().references(CategoriesTable, #id)();
  RealColumn get limitAmount => real()();
  TextColumn get carryOverRule => text()();
  RealColumn get carryOverPct => real().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class GoalsTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  RealColumn get targetAmount => real()();
  RealColumn get savedAmount => real()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  TextColumn get autoTopUpRule => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class SubscriptionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get provider => text()();
  RealColumn get amount => real()();
  TextColumn get currency => text()();
  TextColumn get cadence => text()();
  DateTimeColumn get nextCharge => dateTime()();
  TextColumn get categoryId => text().nullable().references(CategoriesTable, #id)();
  TextColumn get tags => text().map(const StringListConverter())();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  BoolColumn get pause => boolean().withDefault(const Constant(false))();
  @override
  Set<Column> get primaryKey => {id};
}

class RulesTable extends Table {
  TextColumn get id => text()();
  TextColumn get condition => text()();
  TextColumn get action => text()();
  IntColumn get priority => integer().withDefault(const Constant(0))();
  @override
  Set<Column> get primaryKey => {id};
}

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    if (fromDb.isEmpty) return const [];
    return List<String>.from(const JsonDecoder().convert(fromDb) as List);
  }

  @override
  String toSql(List<String> value) => const JsonEncoder().convert(value);
}

class AttachmentListConverter
    extends TypeConverter<List<Map<String, dynamic>>, String> {
  const AttachmentListConverter();

  @override
  List<Map<String, dynamic>> fromSql(String fromDb) {
    if (fromDb.isEmpty) return const [];
    final raw = const JsonDecoder().convert(fromDb) as List;
    return raw
        .map((e) => Map<String, dynamic>.from(e as Map<String, dynamic>))
        .toList();
  }

  @override
  String toSql(List<Map<String, dynamic>> value) =>
      const JsonEncoder().convert(value);
}
