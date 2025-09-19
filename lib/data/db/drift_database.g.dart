// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint, unnecessary_null_comparison, unnecessary_non_null_assertion
class $AccountsTableTable extends AccountsTable
    with TableInfo<$AccountsTableTable, AccountsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _openingBalanceMeta =
      const VerificationMeta('openingBalance');
  @override
  late final GeneratedColumn<double> openingBalance = GeneratedColumn<double>(
      'opening_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _archivedMeta =
      const VerificationMeta('archived');
  @override
  late final GeneratedColumn<bool> archived = GeneratedColumn<bool>(
      'archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, type, currency, openingBalance, archived];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts_table';
  @override
  VerificationContext validateIntegrity(Insertable<AccountsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
          _openingBalanceMeta,
          openingBalance.isAcceptableOrUnknown(
              data['opening_balance']!, _openingBalanceMeta));
    }
    if (data.containsKey('archived')) {
      context.handle(_archivedMeta,
          archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      openingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}opening_balance'])!,
      archived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}archived'])!,
    );
  }

  @override
  $AccountsTableTable createAlias(String alias) {
    return $AccountsTableTable(attachedDatabase, alias);
  }
}

class AccountsTableData extends DataClass
    implements Insertable<AccountsTableData> {
  final String id;
  final String name;
  final String type;
  final String currency;
  final double openingBalance;
  final bool archived;
  const AccountsTableData(
      {required this.id,
      required this.name,
      required this.type,
      required this.currency,
      required this.openingBalance,
      required this.archived});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['currency'] = Variable<String>(currency);
    map['opening_balance'] = Variable<double>(openingBalance);
    map['archived'] = Variable<bool>(archived);
    return map;
  }

  AccountsTableCompanion toCompanion(bool nullToAbsent) {
    return AccountsTableCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      currency: Value(currency),
      openingBalance: Value(openingBalance),
      archived: Value(archived),
    );
  }

  factory AccountsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountsTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      currency: serializer.fromJson<String>(json['currency']),
      openingBalance: serializer.fromJson<double>(json['openingBalance']),
      archived: serializer.fromJson<bool>(json['archived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'currency': serializer.toJson<String>(currency),
      'openingBalance': serializer.toJson<double>(openingBalance),
      'archived': serializer.toJson<bool>(archived),
    };
  }

  AccountsTableData copyWith(
          {String? id,
          String? name,
          String? type,
          String? currency,
          double? openingBalance,
          bool? archived}) =>
      AccountsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        currency: currency ?? this.currency,
        openingBalance: openingBalance ?? this.openingBalance,
        archived: archived ?? this.archived,
      );
  AccountsTableData copyWithCompanion(AccountsTableCompanion data) {
    return AccountsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      currency: data.currency.present ? data.currency.value : this.currency,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      archived: data.archived.present ? data.archived.value : this.archived,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('currency: $currency, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('archived: $archived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, type, currency, openingBalance, archived);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.currency == this.currency &&
          other.openingBalance == this.openingBalance &&
          other.archived == this.archived);
}

class AccountsTableCompanion extends UpdateCompanion<AccountsTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<String> currency;
  final Value<double> openingBalance;
  final Value<bool> archived;
  final Value<int> rowid;
  const AccountsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.currency = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.archived = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountsTableCompanion.insert({
    required String id,
    required String name,
    required String type,
    required String currency,
    this.openingBalance = const Value.absent(),
    this.archived = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        type = Value(type),
        currency = Value(currency);
  static Insertable<AccountsTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? currency,
    Expression<double>? openingBalance,
    Expression<bool>? archived,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (currency != null) 'currency': currency,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (archived != null) 'archived': archived,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? type,
      Value<String>? currency,
      Value<double>? openingBalance,
      Value<bool>? archived,
      Value<int>? rowid}) {
    return AccountsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      currency: currency ?? this.currency,
      openingBalance: openingBalance ?? this.openingBalance,
      archived: archived ?? this.archived,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<double>(openingBalance.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('currency: $currency, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('archived: $archived, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PaycheckPeriodsTableTable extends PaycheckPeriodsTable
    with TableInfo<$PaycheckPeriodsTableTable, PaycheckPeriodsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaycheckPeriodsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
      'kind', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _closedMeta = const VerificationMeta('closed');
  @override
  late final GeneratedColumn<bool> closed = GeneratedColumn<bool>(
      'closed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("closed" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, startDate, endDate, kind, closed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'paycheck_periods_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PaycheckPeriodsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
          _kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('closed')) {
      context.handle(_closedMeta,
          closed.isAcceptableOrUnknown(data['closed']!, _closedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaycheckPeriodsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaycheckPeriodsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
      kind: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kind'])!,
      closed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}closed'])!,
    );
  }

  @override
  $PaycheckPeriodsTableTable createAlias(String alias) {
    return $PaycheckPeriodsTableTable(attachedDatabase, alias);
  }
}

class PaycheckPeriodsTableData extends DataClass
    implements Insertable<PaycheckPeriodsTableData> {
  final String id;
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final String kind;
  final bool closed;
  const PaycheckPeriodsTableData(
      {required this.id,
      required this.title,
      required this.startDate,
      required this.endDate,
      required this.kind,
      required this.closed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['kind'] = Variable<String>(kind);
    map['closed'] = Variable<bool>(closed);
    return map;
  }

  PaycheckPeriodsTableCompanion toCompanion(bool nullToAbsent) {
    return PaycheckPeriodsTableCompanion(
      id: Value(id),
      title: Value(title),
      startDate: Value(startDate),
      endDate: Value(endDate),
      kind: Value(kind),
      closed: Value(closed),
    );
  }

  factory PaycheckPeriodsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaycheckPeriodsTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      kind: serializer.fromJson<String>(json['kind']),
      closed: serializer.fromJson<bool>(json['closed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'kind': serializer.toJson<String>(kind),
      'closed': serializer.toJson<bool>(closed),
    };
  }

  PaycheckPeriodsTableData copyWith(
          {String? id,
          String? title,
          DateTime? startDate,
          DateTime? endDate,
          String? kind,
          bool? closed}) =>
      PaycheckPeriodsTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        kind: kind ?? this.kind,
        closed: closed ?? this.closed,
      );
  PaycheckPeriodsTableData copyWithCompanion(
      PaycheckPeriodsTableCompanion data) {
    return PaycheckPeriodsTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      kind: data.kind.present ? data.kind.value : this.kind,
      closed: data.closed.present ? data.closed.value : this.closed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaycheckPeriodsTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('kind: $kind, ')
          ..write('closed: $closed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, startDate, endDate, kind, closed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaycheckPeriodsTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.kind == this.kind &&
          other.closed == this.closed);
}

class PaycheckPeriodsTableCompanion
    extends UpdateCompanion<PaycheckPeriodsTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<String> kind;
  final Value<bool> closed;
  final Value<int> rowid;
  const PaycheckPeriodsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.kind = const Value.absent(),
    this.closed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaycheckPeriodsTableCompanion.insert({
    required String id,
    required String title,
    required DateTime startDate,
    required DateTime endDate,
    required String kind,
    this.closed = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        startDate = Value(startDate),
        endDate = Value(endDate),
        kind = Value(kind);
  static Insertable<PaycheckPeriodsTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? kind,
    Expression<bool>? closed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (kind != null) 'kind': kind,
      if (closed != null) 'closed': closed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaycheckPeriodsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<String>? kind,
      Value<bool>? closed,
      Value<int>? rowid}) {
    return PaycheckPeriodsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      kind: kind ?? this.kind,
      closed: closed ?? this.closed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (closed.present) {
      map['closed'] = Variable<bool>(closed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaycheckPeriodsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('kind: $kind, ')
          ..write('closed: $closed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTableTable extends CategoriesTable
    with TableInfo<$CategoriesTableTable, CategoriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emojiMeta = const VerificationMeta('emoji');
  @override
  late final GeneratedColumn<String> emoji = GeneratedColumn<String>(
      'emoji', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
      'parent_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories_table (id)'));
  static const VerificationMeta _colorHexMeta =
      const VerificationMeta('colorHex');
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
      'color_hex', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hiddenMeta = const VerificationMeta('hidden');
  @override
  late final GeneratedColumn<bool> hidden = GeneratedColumn<bool>(
      'hidden', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("hidden" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, emoji, parentId, colorHex, hidden];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CategoriesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('emoji')) {
      context.handle(
          _emojiMeta, emoji.isAcceptableOrUnknown(data['emoji']!, _emojiMeta));
    } else if (isInserting) {
      context.missing(_emojiMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    if (data.containsKey('color_hex')) {
      context.handle(_colorHexMeta,
          colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta));
    } else if (isInserting) {
      context.missing(_colorHexMeta);
    }
    if (data.containsKey('hidden')) {
      context.handle(_hiddenMeta,
          hidden.isAcceptableOrUnknown(data['hidden']!, _hiddenMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoriesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoriesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      emoji: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}emoji'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_id']),
      colorHex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_hex'])!,
      hidden: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}hidden'])!,
    );
  }

  @override
  $CategoriesTableTable createAlias(String alias) {
    return $CategoriesTableTable(attachedDatabase, alias);
  }
}

class CategoriesTableData extends DataClass
    implements Insertable<CategoriesTableData> {
  final String id;
  final String name;
  final String emoji;
  final String? parentId;
  final String colorHex;
  final bool hidden;
  const CategoriesTableData(
      {required this.id,
      required this.name,
      required this.emoji,
      this.parentId,
      required this.colorHex,
      required this.hidden});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['emoji'] = Variable<String>(emoji);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    map['color_hex'] = Variable<String>(colorHex);
    map['hidden'] = Variable<bool>(hidden);
    return map;
  }

  CategoriesTableCompanion toCompanion(bool nullToAbsent) {
    return CategoriesTableCompanion(
      id: Value(id),
      name: Value(name),
      emoji: Value(emoji),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      colorHex: Value(colorHex),
      hidden: Value(hidden),
    );
  }

  factory CategoriesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoriesTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      emoji: serializer.fromJson<String>(json['emoji']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      colorHex: serializer.fromJson<String>(json['colorHex']),
      hidden: serializer.fromJson<bool>(json['hidden']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'emoji': serializer.toJson<String>(emoji),
      'parentId': serializer.toJson<String?>(parentId),
      'colorHex': serializer.toJson<String>(colorHex),
      'hidden': serializer.toJson<bool>(hidden),
    };
  }

  CategoriesTableData copyWith(
          {String? id,
          String? name,
          String? emoji,
          Value<String?> parentId = const Value.absent(),
          String? colorHex,
          bool? hidden}) =>
      CategoriesTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        emoji: emoji ?? this.emoji,
        parentId: parentId.present ? parentId.value : this.parentId,
        colorHex: colorHex ?? this.colorHex,
        hidden: hidden ?? this.hidden,
      );
  CategoriesTableData copyWithCompanion(CategoriesTableCompanion data) {
    return CategoriesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      emoji: data.emoji.present ? data.emoji.value : this.emoji,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      hidden: data.hidden.present ? data.hidden.value : this.hidden,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('emoji: $emoji, ')
          ..write('parentId: $parentId, ')
          ..write('colorHex: $colorHex, ')
          ..write('hidden: $hidden')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, emoji, parentId, colorHex, hidden);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoriesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.emoji == this.emoji &&
          other.parentId == this.parentId &&
          other.colorHex == this.colorHex &&
          other.hidden == this.hidden);
}

class CategoriesTableCompanion extends UpdateCompanion<CategoriesTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> emoji;
  final Value<String?> parentId;
  final Value<String> colorHex;
  final Value<bool> hidden;
  final Value<int> rowid;
  const CategoriesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.emoji = const Value.absent(),
    this.parentId = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.hidden = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesTableCompanion.insert({
    required String id,
    required String name,
    required String emoji,
    this.parentId = const Value.absent(),
    required String colorHex,
    this.hidden = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        emoji = Value(emoji),
        colorHex = Value(colorHex);
  static Insertable<CategoriesTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? emoji,
    Expression<String>? parentId,
    Expression<String>? colorHex,
    Expression<bool>? hidden,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (emoji != null) 'emoji': emoji,
      if (parentId != null) 'parent_id': parentId,
      if (colorHex != null) 'color_hex': colorHex,
      if (hidden != null) 'hidden': hidden,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? emoji,
      Value<String?>? parentId,
      Value<String>? colorHex,
      Value<bool>? hidden,
      Value<int>? rowid}) {
    return CategoriesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      parentId: parentId ?? this.parentId,
      colorHex: colorHex ?? this.colorHex,
      hidden: hidden ?? this.hidden,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (emoji.present) {
      map['emoji'] = Variable<String>(emoji.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (hidden.present) {
      map['hidden'] = Variable<bool>(hidden.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('emoji: $emoji, ')
          ..write('parentId: $parentId, ')
          ..write('colorHex: $colorHex, ')
          ..write('hidden: $hidden, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagsTableTable extends TagsTable
    with TableInfo<$TagsTableTable, TagsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorHexMeta =
      const VerificationMeta('colorHex');
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
      'color_hex', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, colorHex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags_table';
  @override
  VerificationContext validateIntegrity(Insertable<TagsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color_hex')) {
      context.handle(_colorHexMeta,
          colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      colorHex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_hex']),
    );
  }

  @override
  $TagsTableTable createAlias(String alias) {
    return $TagsTableTable(attachedDatabase, alias);
  }
}

class TagsTableData extends DataClass implements Insertable<TagsTableData> {
  final String id;
  final String name;
  final String? colorHex;
  const TagsTableData({required this.id, required this.name, this.colorHex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || colorHex != null) {
      map['color_hex'] = Variable<String>(colorHex);
    }
    return map;
  }

  TagsTableCompanion toCompanion(bool nullToAbsent) {
    return TagsTableCompanion(
      id: Value(id),
      name: Value(name),
      colorHex: colorHex == null && nullToAbsent
          ? const Value.absent()
          : Value(colorHex),
    );
  }

  factory TagsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagsTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      colorHex: serializer.fromJson<String?>(json['colorHex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'colorHex': serializer.toJson<String?>(colorHex),
    };
  }

  TagsTableData copyWith(
          {String? id,
          String? name,
          Value<String?> colorHex = const Value.absent()}) =>
      TagsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        colorHex: colorHex.present ? colorHex.value : this.colorHex,
      );
  TagsTableData copyWithCompanion(TagsTableCompanion data) {
    return TagsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, colorHex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.colorHex == this.colorHex);
}

class TagsTableCompanion extends UpdateCompanion<TagsTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> colorHex;
  final Value<int> rowid;
  const TagsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagsTableCompanion.insert({
    required String id,
    required String name,
    this.colorHex = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<TagsTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? colorHex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (colorHex != null) 'color_hex': colorHex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? colorHex,
      Value<int>? rowid}) {
    return TagsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MerchantsTableTable extends MerchantsTable
    with TableInfo<$MerchantsTableTable, MerchantsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MerchantsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ruleHintMeta =
      const VerificationMeta('ruleHint');
  @override
  late final GeneratedColumn<String> ruleHint = GeneratedColumn<String>(
      'rule_hint', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, location, ruleHint];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'merchants_table';
  @override
  VerificationContext validateIntegrity(Insertable<MerchantsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('rule_hint')) {
      context.handle(_ruleHintMeta,
          ruleHint.isAcceptableOrUnknown(data['rule_hint']!, _ruleHintMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MerchantsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MerchantsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      ruleHint: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rule_hint']),
    );
  }

  @override
  $MerchantsTableTable createAlias(String alias) {
    return $MerchantsTableTable(attachedDatabase, alias);
  }
}

class MerchantsTableData extends DataClass
    implements Insertable<MerchantsTableData> {
  final String id;
  final String name;
  final String? location;
  final String? ruleHint;
  const MerchantsTableData(
      {required this.id, required this.name, this.location, this.ruleHint});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || ruleHint != null) {
      map['rule_hint'] = Variable<String>(ruleHint);
    }
    return map;
  }

  MerchantsTableCompanion toCompanion(bool nullToAbsent) {
    return MerchantsTableCompanion(
      id: Value(id),
      name: Value(name),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      ruleHint: ruleHint == null && nullToAbsent
          ? const Value.absent()
          : Value(ruleHint),
    );
  }

  factory MerchantsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MerchantsTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      location: serializer.fromJson<String?>(json['location']),
      ruleHint: serializer.fromJson<String?>(json['ruleHint']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'location': serializer.toJson<String?>(location),
      'ruleHint': serializer.toJson<String?>(ruleHint),
    };
  }

  MerchantsTableData copyWith(
          {String? id,
          String? name,
          Value<String?> location = const Value.absent(),
          Value<String?> ruleHint = const Value.absent()}) =>
      MerchantsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        location: location.present ? location.value : this.location,
        ruleHint: ruleHint.present ? ruleHint.value : this.ruleHint,
      );
  MerchantsTableData copyWithCompanion(MerchantsTableCompanion data) {
    return MerchantsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      location: data.location.present ? data.location.value : this.location,
      ruleHint: data.ruleHint.present ? data.ruleHint.value : this.ruleHint,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MerchantsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('location: $location, ')
          ..write('ruleHint: $ruleHint')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, location, ruleHint);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MerchantsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.location == this.location &&
          other.ruleHint == this.ruleHint);
}

class MerchantsTableCompanion extends UpdateCompanion<MerchantsTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> location;
  final Value<String?> ruleHint;
  final Value<int> rowid;
  const MerchantsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.location = const Value.absent(),
    this.ruleHint = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MerchantsTableCompanion.insert({
    required String id,
    required String name,
    this.location = const Value.absent(),
    this.ruleHint = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<MerchantsTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? location,
    Expression<String>? ruleHint,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (location != null) 'location': location,
      if (ruleHint != null) 'rule_hint': ruleHint,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MerchantsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? location,
      Value<String?>? ruleHint,
      Value<int>? rowid}) {
    return MerchantsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      ruleHint: ruleHint ?? this.ruleHint,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (ruleHint.present) {
      map['rule_hint'] = Variable<String>(ruleHint.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MerchantsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('location: $location, ')
          ..write('ruleHint: $ruleHint, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlanItemsTableTable extends PlanItemsTable
    with TableInfo<$PlanItemsTableTable, PlanItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _expectedAmountMeta =
      const VerificationMeta('expectedAmount');
  @override
  late final GeneratedColumn<double> expectedAmount = GeneratedColumn<double>(
      'expected_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories_table (id)'));
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($PlanItemsTableTable.$convertertags);
  static const VerificationMeta _deadlineMeta =
      const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
      'deadline', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _periodIdMeta =
      const VerificationMeta('periodId');
  @override
  late final GeneratedColumn<String> periodId = GeneratedColumn<String>(
      'period_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES paycheck_periods_table (id)'));
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
      'priority', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _flexMeta = const VerificationMeta('flex');
  @override
  late final GeneratedColumn<String> flex = GeneratedColumn<String>(
      'flex', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
      'done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("done" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        expectedAmount,
        categoryId,
        tags,
        deadline,
        periodId,
        priority,
        flex,
        done
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plan_items_table';
  @override
  VerificationContext validateIntegrity(Insertable<PlanItemsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('expected_amount')) {
      context.handle(
          _expectedAmountMeta,
          expectedAmount.isAcceptableOrUnknown(
              data['expected_amount']!, _expectedAmountMeta));
    } else if (isInserting) {
      context.missing(_expectedAmountMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    context.handle(_tagsMeta, const VerificationResult.success());
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    } else if (isInserting) {
      context.missing(_deadlineMeta);
    }
    if (data.containsKey('period_id')) {
      context.handle(_periodIdMeta,
          periodId.isAcceptableOrUnknown(data['period_id']!, _periodIdMeta));
    } else if (isInserting) {
      context.missing(_periodIdMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('flex')) {
      context.handle(
          _flexMeta, flex.isAcceptableOrUnknown(data['flex']!, _flexMeta));
    } else if (isInserting) {
      context.missing(_flexMeta);
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlanItemsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanItemsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      expectedAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}expected_amount'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id']),
      tags: $PlanItemsTableTable.$convertertags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      deadline: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline'])!,
      periodId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}period_id'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!,
      flex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}flex'])!,
      done: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}done'])!,
    );
  }

  @override
  $PlanItemsTableTable createAlias(String alias) {
    return $PlanItemsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertertags =
      const StringListConverter();
}

class PlanItemsTableData extends DataClass
    implements Insertable<PlanItemsTableData> {
  final String id;
  final String title;
  final double expectedAmount;
  final String? categoryId;
  final List<String> tags;
  final DateTime deadline;
  final String periodId;
  final int priority;
  final String flex;
  final bool done;
  const PlanItemsTableData(
      {required this.id,
      required this.title,
      required this.expectedAmount,
      this.categoryId,
      required this.tags,
      required this.deadline,
      required this.periodId,
      required this.priority,
      required this.flex,
      required this.done});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['expected_amount'] = Variable<double>(expectedAmount);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    {
      map['tags'] =
          Variable<String>($PlanItemsTableTable.$convertertags.toSql(tags));
    }
    map['deadline'] = Variable<DateTime>(deadline);
    map['period_id'] = Variable<String>(periodId);
    map['priority'] = Variable<int>(priority);
    map['flex'] = Variable<String>(flex);
    map['done'] = Variable<bool>(done);
    return map;
  }

  PlanItemsTableCompanion toCompanion(bool nullToAbsent) {
    return PlanItemsTableCompanion(
      id: Value(id),
      title: Value(title),
      expectedAmount: Value(expectedAmount),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      tags: Value(tags),
      deadline: Value(deadline),
      periodId: Value(periodId),
      priority: Value(priority),
      flex: Value(flex),
      done: Value(done),
    );
  }

  factory PlanItemsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanItemsTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      expectedAmount: serializer.fromJson<double>(json['expectedAmount']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      tags: serializer.fromJson<List<String>>(json['tags']),
      deadline: serializer.fromJson<DateTime>(json['deadline']),
      periodId: serializer.fromJson<String>(json['periodId']),
      priority: serializer.fromJson<int>(json['priority']),
      flex: serializer.fromJson<String>(json['flex']),
      done: serializer.fromJson<bool>(json['done']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'expectedAmount': serializer.toJson<double>(expectedAmount),
      'categoryId': serializer.toJson<String?>(categoryId),
      'tags': serializer.toJson<List<String>>(tags),
      'deadline': serializer.toJson<DateTime>(deadline),
      'periodId': serializer.toJson<String>(periodId),
      'priority': serializer.toJson<int>(priority),
      'flex': serializer.toJson<String>(flex),
      'done': serializer.toJson<bool>(done),
    };
  }

  PlanItemsTableData copyWith(
          {String? id,
          String? title,
          double? expectedAmount,
          Value<String?> categoryId = const Value.absent(),
          List<String>? tags,
          DateTime? deadline,
          String? periodId,
          int? priority,
          String? flex,
          bool? done}) =>
      PlanItemsTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        expectedAmount: expectedAmount ?? this.expectedAmount,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        tags: tags ?? this.tags,
        deadline: deadline ?? this.deadline,
        periodId: periodId ?? this.periodId,
        priority: priority ?? this.priority,
        flex: flex ?? this.flex,
        done: done ?? this.done,
      );
  PlanItemsTableData copyWithCompanion(PlanItemsTableCompanion data) {
    return PlanItemsTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      expectedAmount: data.expectedAmount.present
          ? data.expectedAmount.value
          : this.expectedAmount,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      tags: data.tags.present ? data.tags.value : this.tags,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      periodId: data.periodId.present ? data.periodId.value : this.periodId,
      priority: data.priority.present ? data.priority.value : this.priority,
      flex: data.flex.present ? data.flex.value : this.flex,
      done: data.done.present ? data.done.value : this.done,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanItemsTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('expectedAmount: $expectedAmount, ')
          ..write('categoryId: $categoryId, ')
          ..write('tags: $tags, ')
          ..write('deadline: $deadline, ')
          ..write('periodId: $periodId, ')
          ..write('priority: $priority, ')
          ..write('flex: $flex, ')
          ..write('done: $done')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, expectedAmount, categoryId, tags,
      deadline, periodId, priority, flex, done);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanItemsTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.expectedAmount == this.expectedAmount &&
          other.categoryId == this.categoryId &&
          other.tags == this.tags &&
          other.deadline == this.deadline &&
          other.periodId == this.periodId &&
          other.priority == this.priority &&
          other.flex == this.flex &&
          other.done == this.done);
}

class PlanItemsTableCompanion extends UpdateCompanion<PlanItemsTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<double> expectedAmount;
  final Value<String?> categoryId;
  final Value<List<String>> tags;
  final Value<DateTime> deadline;
  final Value<String> periodId;
  final Value<int> priority;
  final Value<String> flex;
  final Value<bool> done;
  final Value<int> rowid;
  const PlanItemsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.expectedAmount = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.tags = const Value.absent(),
    this.deadline = const Value.absent(),
    this.periodId = const Value.absent(),
    this.priority = const Value.absent(),
    this.flex = const Value.absent(),
    this.done = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlanItemsTableCompanion.insert({
    required String id,
    required String title,
    required double expectedAmount,
    this.categoryId = const Value.absent(),
    required List<String> tags,
    required DateTime deadline,
    required String periodId,
    this.priority = const Value.absent(),
    required String flex,
    this.done = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        expectedAmount = Value(expectedAmount),
        tags = Value(tags),
        deadline = Value(deadline),
        periodId = Value(periodId),
        flex = Value(flex);
  static Insertable<PlanItemsTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<double>? expectedAmount,
    Expression<String>? categoryId,
    Expression<String>? tags,
    Expression<DateTime>? deadline,
    Expression<String>? periodId,
    Expression<int>? priority,
    Expression<String>? flex,
    Expression<bool>? done,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (expectedAmount != null) 'expected_amount': expectedAmount,
      if (categoryId != null) 'category_id': categoryId,
      if (tags != null) 'tags': tags,
      if (deadline != null) 'deadline': deadline,
      if (periodId != null) 'period_id': periodId,
      if (priority != null) 'priority': priority,
      if (flex != null) 'flex': flex,
      if (done != null) 'done': done,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlanItemsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<double>? expectedAmount,
      Value<String?>? categoryId,
      Value<List<String>>? tags,
      Value<DateTime>? deadline,
      Value<String>? periodId,
      Value<int>? priority,
      Value<String>? flex,
      Value<bool>? done,
      Value<int>? rowid}) {
    return PlanItemsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      expectedAmount: expectedAmount ?? this.expectedAmount,
      categoryId: categoryId ?? this.categoryId,
      tags: tags ?? this.tags,
      deadline: deadline ?? this.deadline,
      periodId: periodId ?? this.periodId,
      priority: priority ?? this.priority,
      flex: flex ?? this.flex,
      done: done ?? this.done,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (expectedAmount.present) {
      map['expected_amount'] = Variable<double>(expectedAmount.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(
          $PlanItemsTableTable.$convertertags.toSql(tags.value));
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (periodId.present) {
      map['period_id'] = Variable<String>(periodId.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (flex.present) {
      map['flex'] = Variable<String>(flex.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('expectedAmount: $expectedAmount, ')
          ..write('categoryId: $categoryId, ')
          ..write('tags: $tags, ')
          ..write('deadline: $deadline, ')
          ..write('periodId: $periodId, ')
          ..write('priority: $priority, ')
          ..write('flex: $flex, ')
          ..write('done: $done, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTableTable extends TransactionsTable
    with TableInfo<$TransactionsTableTable, TransactionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _datetimeMeta =
      const VerificationMeta('datetime');
  @override
  late final GeneratedColumn<DateTime> datetime = GeneratedColumn<DateTime>(
      'datetime', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
      'account_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES accounts_table (id)'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories_table (id)'));
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($TransactionsTableTable.$convertertags);
  static const VerificationMeta _merchantIdMeta =
      const VerificationMeta('merchantId');
  @override
  late final GeneratedColumn<String> merchantId = GeneratedColumn<String>(
      'merchant_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES merchants_table (id)'));
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _attachmentsMeta =
      const VerificationMeta('attachments');
  @override
  late final GeneratedColumnWithTypeConverter<List<Map<String, dynamic>>,
      String> attachments = GeneratedColumn<String>(
          'attachments', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<List<Map<String, dynamic>>>(
          $TransactionsTableTable.$converterattachments);
  static const VerificationMeta _plannedMeta =
      const VerificationMeta('planned');
  @override
  late final GeneratedColumn<bool> planned = GeneratedColumn<bool>(
      'planned', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("planned" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _planItemIdMeta =
      const VerificationMeta('planItemId');
  @override
  late final GeneratedColumn<String> planItemId = GeneratedColumn<String>(
      'plan_item_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES plan_items_table (id)'));
  static const VerificationMeta _excludeFromBudgetMeta =
      const VerificationMeta('excludeFromBudget');
  @override
  late final GeneratedColumn<bool> excludeFromBudget = GeneratedColumn<bool>(
      'exclude_from_budget', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("exclude_from_budget" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        datetime,
        amount,
        currency,
        accountId,
        type,
        categoryId,
        tags,
        merchantId,
        note,
        attachments,
        planned,
        planItemId,
        excludeFromBudget
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransactionsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('datetime')) {
      context.handle(_datetimeMeta,
          datetime.isAcceptableOrUnknown(data['datetime']!, _datetimeMeta));
    } else if (isInserting) {
      context.missing(_datetimeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    context.handle(_tagsMeta, const VerificationResult.success());
    if (data.containsKey('merchant_id')) {
      context.handle(
          _merchantIdMeta,
          merchantId.isAcceptableOrUnknown(
              data['merchant_id']!, _merchantIdMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    context.handle(_attachmentsMeta, const VerificationResult.success());
    if (data.containsKey('planned')) {
      context.handle(_plannedMeta,
          planned.isAcceptableOrUnknown(data['planned']!, _plannedMeta));
    }
    if (data.containsKey('plan_item_id')) {
      context.handle(
          _planItemIdMeta,
          planItemId.isAcceptableOrUnknown(
              data['plan_item_id']!, _planItemIdMeta));
    }
    if (data.containsKey('exclude_from_budget')) {
      context.handle(
          _excludeFromBudgetMeta,
          excludeFromBudget.isAcceptableOrUnknown(
              data['exclude_from_budget']!, _excludeFromBudgetMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      datetime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}datetime'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id']),
      tags: $TransactionsTableTable.$convertertags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      merchantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}merchant_id']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      attachments: $TransactionsTableTable.$converterattachments.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}attachments'])!),
      planned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}planned'])!,
      planItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_item_id']),
      excludeFromBudget: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}exclude_from_budget'])!,
    );
  }

  @override
  $TransactionsTableTable createAlias(String alias) {
    return $TransactionsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertertags =
      const StringListConverter();
  static TypeConverter<List<Map<String, dynamic>>, String>
      $converterattachments = const AttachmentListConverter();
}

class TransactionsTableData extends DataClass
    implements Insertable<TransactionsTableData> {
  final String id;
  final DateTime datetime;
  final double amount;
  final String currency;
  final String accountId;
  final String type;
  final String? categoryId;
  final List<String> tags;
  final String? merchantId;
  final String? note;
  final List<Map<String, dynamic>> attachments;
  final bool planned;
  final String? planItemId;
  final bool excludeFromBudget;
  const TransactionsTableData(
      {required this.id,
      required this.datetime,
      required this.amount,
      required this.currency,
      required this.accountId,
      required this.type,
      this.categoryId,
      required this.tags,
      this.merchantId,
      this.note,
      required this.attachments,
      required this.planned,
      this.planItemId,
      required this.excludeFromBudget});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['datetime'] = Variable<DateTime>(datetime);
    map['amount'] = Variable<double>(amount);
    map['currency'] = Variable<String>(currency);
    map['account_id'] = Variable<String>(accountId);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    {
      map['tags'] =
          Variable<String>($TransactionsTableTable.$convertertags.toSql(tags));
    }
    if (!nullToAbsent || merchantId != null) {
      map['merchant_id'] = Variable<String>(merchantId);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    {
      map['attachments'] = Variable<String>(
          $TransactionsTableTable.$converterattachments.toSql(attachments));
    }
    map['planned'] = Variable<bool>(planned);
    if (!nullToAbsent || planItemId != null) {
      map['plan_item_id'] = Variable<String>(planItemId);
    }
    map['exclude_from_budget'] = Variable<bool>(excludeFromBudget);
    return map;
  }

  TransactionsTableCompanion toCompanion(bool nullToAbsent) {
    return TransactionsTableCompanion(
      id: Value(id),
      datetime: Value(datetime),
      amount: Value(amount),
      currency: Value(currency),
      accountId: Value(accountId),
      type: Value(type),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      tags: Value(tags),
      merchantId: merchantId == null && nullToAbsent
          ? const Value.absent()
          : Value(merchantId),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      attachments: Value(attachments),
      planned: Value(planned),
      planItemId: planItemId == null && nullToAbsent
          ? const Value.absent()
          : Value(planItemId),
      excludeFromBudget: Value(excludeFromBudget),
    );
  }

  factory TransactionsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionsTableData(
      id: serializer.fromJson<String>(json['id']),
      datetime: serializer.fromJson<DateTime>(json['datetime']),
      amount: serializer.fromJson<double>(json['amount']),
      currency: serializer.fromJson<String>(json['currency']),
      accountId: serializer.fromJson<String>(json['accountId']),
      type: serializer.fromJson<String>(json['type']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      tags: serializer.fromJson<List<String>>(json['tags']),
      merchantId: serializer.fromJson<String?>(json['merchantId']),
      note: serializer.fromJson<String?>(json['note']),
      attachments:
          serializer.fromJson<List<Map<String, dynamic>>>(json['attachments']),
      planned: serializer.fromJson<bool>(json['planned']),
      planItemId: serializer.fromJson<String?>(json['planItemId']),
      excludeFromBudget: serializer.fromJson<bool>(json['excludeFromBudget']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'datetime': serializer.toJson<DateTime>(datetime),
      'amount': serializer.toJson<double>(amount),
      'currency': serializer.toJson<String>(currency),
      'accountId': serializer.toJson<String>(accountId),
      'type': serializer.toJson<String>(type),
      'categoryId': serializer.toJson<String?>(categoryId),
      'tags': serializer.toJson<List<String>>(tags),
      'merchantId': serializer.toJson<String?>(merchantId),
      'note': serializer.toJson<String?>(note),
      'attachments': serializer.toJson<List<Map<String, dynamic>>>(attachments),
      'planned': serializer.toJson<bool>(planned),
      'planItemId': serializer.toJson<String?>(planItemId),
      'excludeFromBudget': serializer.toJson<bool>(excludeFromBudget),
    };
  }

  TransactionsTableData copyWith(
          {String? id,
          DateTime? datetime,
          double? amount,
          String? currency,
          String? accountId,
          String? type,
          Value<String?> categoryId = const Value.absent(),
          List<String>? tags,
          Value<String?> merchantId = const Value.absent(),
          Value<String?> note = const Value.absent(),
          List<Map<String, dynamic>>? attachments,
          bool? planned,
          Value<String?> planItemId = const Value.absent(),
          bool? excludeFromBudget}) =>
      TransactionsTableData(
        id: id ?? this.id,
        datetime: datetime ?? this.datetime,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        accountId: accountId ?? this.accountId,
        type: type ?? this.type,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        tags: tags ?? this.tags,
        merchantId: merchantId.present ? merchantId.value : this.merchantId,
        note: note.present ? note.value : this.note,
        attachments: attachments ?? this.attachments,
        planned: planned ?? this.planned,
        planItemId: planItemId.present ? planItemId.value : this.planItemId,
        excludeFromBudget: excludeFromBudget ?? this.excludeFromBudget,
      );
  TransactionsTableData copyWithCompanion(TransactionsTableCompanion data) {
    return TransactionsTableData(
      id: data.id.present ? data.id.value : this.id,
      datetime: data.datetime.present ? data.datetime.value : this.datetime,
      amount: data.amount.present ? data.amount.value : this.amount,
      currency: data.currency.present ? data.currency.value : this.currency,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      type: data.type.present ? data.type.value : this.type,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      tags: data.tags.present ? data.tags.value : this.tags,
      merchantId:
          data.merchantId.present ? data.merchantId.value : this.merchantId,
      note: data.note.present ? data.note.value : this.note,
      attachments:
          data.attachments.present ? data.attachments.value : this.attachments,
      planned: data.planned.present ? data.planned.value : this.planned,
      planItemId:
          data.planItemId.present ? data.planItemId.value : this.planItemId,
      excludeFromBudget: data.excludeFromBudget.present
          ? data.excludeFromBudget.value
          : this.excludeFromBudget,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsTableData(')
          ..write('id: $id, ')
          ..write('datetime: $datetime, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('accountId: $accountId, ')
          ..write('type: $type, ')
          ..write('categoryId: $categoryId, ')
          ..write('tags: $tags, ')
          ..write('merchantId: $merchantId, ')
          ..write('note: $note, ')
          ..write('attachments: $attachments, ')
          ..write('planned: $planned, ')
          ..write('planItemId: $planItemId, ')
          ..write('excludeFromBudget: $excludeFromBudget')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      datetime,
      amount,
      currency,
      accountId,
      type,
      categoryId,
      tags,
      merchantId,
      note,
      attachments,
      planned,
      planItemId,
      excludeFromBudget);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionsTableData &&
          other.id == this.id &&
          other.datetime == this.datetime &&
          other.amount == this.amount &&
          other.currency == this.currency &&
          other.accountId == this.accountId &&
          other.type == this.type &&
          other.categoryId == this.categoryId &&
          other.tags == this.tags &&
          other.merchantId == this.merchantId &&
          other.note == this.note &&
          other.attachments == this.attachments &&
          other.planned == this.planned &&
          other.planItemId == this.planItemId &&
          other.excludeFromBudget == this.excludeFromBudget);
}

class TransactionsTableCompanion
    extends UpdateCompanion<TransactionsTableData> {
  final Value<String> id;
  final Value<DateTime> datetime;
  final Value<double> amount;
  final Value<String> currency;
  final Value<String> accountId;
  final Value<String> type;
  final Value<String?> categoryId;
  final Value<List<String>> tags;
  final Value<String?> merchantId;
  final Value<String?> note;
  final Value<List<Map<String, dynamic>>> attachments;
  final Value<bool> planned;
  final Value<String?> planItemId;
  final Value<bool> excludeFromBudget;
  final Value<int> rowid;
  const TransactionsTableCompanion({
    this.id = const Value.absent(),
    this.datetime = const Value.absent(),
    this.amount = const Value.absent(),
    this.currency = const Value.absent(),
    this.accountId = const Value.absent(),
    this.type = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.tags = const Value.absent(),
    this.merchantId = const Value.absent(),
    this.note = const Value.absent(),
    this.attachments = const Value.absent(),
    this.planned = const Value.absent(),
    this.planItemId = const Value.absent(),
    this.excludeFromBudget = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsTableCompanion.insert({
    required String id,
    required DateTime datetime,
    required double amount,
    required String currency,
    required String accountId,
    required String type,
    this.categoryId = const Value.absent(),
    required List<String> tags,
    this.merchantId = const Value.absent(),
    this.note = const Value.absent(),
    required List<Map<String, dynamic>> attachments,
    this.planned = const Value.absent(),
    this.planItemId = const Value.absent(),
    this.excludeFromBudget = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        datetime = Value(datetime),
        amount = Value(amount),
        currency = Value(currency),
        accountId = Value(accountId),
        type = Value(type),
        tags = Value(tags),
        attachments = Value(attachments);
  static Insertable<TransactionsTableData> custom({
    Expression<String>? id,
    Expression<DateTime>? datetime,
    Expression<double>? amount,
    Expression<String>? currency,
    Expression<String>? accountId,
    Expression<String>? type,
    Expression<String>? categoryId,
    Expression<String>? tags,
    Expression<String>? merchantId,
    Expression<String>? note,
    Expression<String>? attachments,
    Expression<bool>? planned,
    Expression<String>? planItemId,
    Expression<bool>? excludeFromBudget,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (datetime != null) 'datetime': datetime,
      if (amount != null) 'amount': amount,
      if (currency != null) 'currency': currency,
      if (accountId != null) 'account_id': accountId,
      if (type != null) 'type': type,
      if (categoryId != null) 'category_id': categoryId,
      if (tags != null) 'tags': tags,
      if (merchantId != null) 'merchant_id': merchantId,
      if (note != null) 'note': note,
      if (attachments != null) 'attachments': attachments,
      if (planned != null) 'planned': planned,
      if (planItemId != null) 'plan_item_id': planItemId,
      if (excludeFromBudget != null) 'exclude_from_budget': excludeFromBudget,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? datetime,
      Value<double>? amount,
      Value<String>? currency,
      Value<String>? accountId,
      Value<String>? type,
      Value<String?>? categoryId,
      Value<List<String>>? tags,
      Value<String?>? merchantId,
      Value<String?>? note,
      Value<List<Map<String, dynamic>>>? attachments,
      Value<bool>? planned,
      Value<String?>? planItemId,
      Value<bool>? excludeFromBudget,
      Value<int>? rowid}) {
    return TransactionsTableCompanion(
      id: id ?? this.id,
      datetime: datetime ?? this.datetime,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      accountId: accountId ?? this.accountId,
      type: type ?? this.type,
      categoryId: categoryId ?? this.categoryId,
      tags: tags ?? this.tags,
      merchantId: merchantId ?? this.merchantId,
      note: note ?? this.note,
      attachments: attachments ?? this.attachments,
      planned: planned ?? this.planned,
      planItemId: planItemId ?? this.planItemId,
      excludeFromBudget: excludeFromBudget ?? this.excludeFromBudget,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (datetime.present) {
      map['datetime'] = Variable<DateTime>(datetime.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(
          $TransactionsTableTable.$convertertags.toSql(tags.value));
    }
    if (merchantId.present) {
      map['merchant_id'] = Variable<String>(merchantId.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (attachments.present) {
      map['attachments'] = Variable<String>($TransactionsTableTable
          .$converterattachments
          .toSql(attachments.value));
    }
    if (planned.present) {
      map['planned'] = Variable<bool>(planned.value);
    }
    if (planItemId.present) {
      map['plan_item_id'] = Variable<String>(planItemId.value);
    }
    if (excludeFromBudget.present) {
      map['exclude_from_budget'] = Variable<bool>(excludeFromBudget.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsTableCompanion(')
          ..write('id: $id, ')
          ..write('datetime: $datetime, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('accountId: $accountId, ')
          ..write('type: $type, ')
          ..write('categoryId: $categoryId, ')
          ..write('tags: $tags, ')
          ..write('merchantId: $merchantId, ')
          ..write('note: $note, ')
          ..write('attachments: $attachments, ')
          ..write('planned: $planned, ')
          ..write('planItemId: $planItemId, ')
          ..write('excludeFromBudget: $excludeFromBudget, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BudgetsTableTable extends BudgetsTable
    with TableInfo<$BudgetsTableTable, BudgetsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _periodIdMeta =
      const VerificationMeta('periodId');
  @override
  late final GeneratedColumn<String> periodId = GeneratedColumn<String>(
      'period_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES paycheck_periods_table (id)'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories_table (id)'));
  static const VerificationMeta _limitAmountMeta =
      const VerificationMeta('limitAmount');
  @override
  late final GeneratedColumn<double> limitAmount = GeneratedColumn<double>(
      'limit_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _carryOverRuleMeta =
      const VerificationMeta('carryOverRule');
  @override
  late final GeneratedColumn<String> carryOverRule = GeneratedColumn<String>(
      'carry_over_rule', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _carryOverPctMeta =
      const VerificationMeta('carryOverPct');
  @override
  late final GeneratedColumn<double> carryOverPct = GeneratedColumn<double>(
      'carry_over_pct', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, periodId, categoryId, limitAmount, carryOverRule, carryOverPct];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budgets_table';
  @override
  VerificationContext validateIntegrity(Insertable<BudgetsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('period_id')) {
      context.handle(_periodIdMeta,
          periodId.isAcceptableOrUnknown(data['period_id']!, _periodIdMeta));
    } else if (isInserting) {
      context.missing(_periodIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('limit_amount')) {
      context.handle(
          _limitAmountMeta,
          limitAmount.isAcceptableOrUnknown(
              data['limit_amount']!, _limitAmountMeta));
    } else if (isInserting) {
      context.missing(_limitAmountMeta);
    }
    if (data.containsKey('carry_over_rule')) {
      context.handle(
          _carryOverRuleMeta,
          carryOverRule.isAcceptableOrUnknown(
              data['carry_over_rule']!, _carryOverRuleMeta));
    } else if (isInserting) {
      context.missing(_carryOverRuleMeta);
    }
    if (data.containsKey('carry_over_pct')) {
      context.handle(
          _carryOverPctMeta,
          carryOverPct.isAcceptableOrUnknown(
              data['carry_over_pct']!, _carryOverPctMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BudgetsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BudgetsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      periodId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}period_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
      limitAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}limit_amount'])!,
      carryOverRule: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}carry_over_rule'])!,
      carryOverPct: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}carry_over_pct']),
    );
  }

  @override
  $BudgetsTableTable createAlias(String alias) {
    return $BudgetsTableTable(attachedDatabase, alias);
  }
}

class BudgetsTableData extends DataClass
    implements Insertable<BudgetsTableData> {
  final String id;
  final String periodId;
  final String categoryId;
  final double limitAmount;
  final String carryOverRule;
  final double? carryOverPct;
  const BudgetsTableData(
      {required this.id,
      required this.periodId,
      required this.categoryId,
      required this.limitAmount,
      required this.carryOverRule,
      this.carryOverPct});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['period_id'] = Variable<String>(periodId);
    map['category_id'] = Variable<String>(categoryId);
    map['limit_amount'] = Variable<double>(limitAmount);
    map['carry_over_rule'] = Variable<String>(carryOverRule);
    if (!nullToAbsent || carryOverPct != null) {
      map['carry_over_pct'] = Variable<double>(carryOverPct);
    }
    return map;
  }

  BudgetsTableCompanion toCompanion(bool nullToAbsent) {
    return BudgetsTableCompanion(
      id: Value(id),
      periodId: Value(periodId),
      categoryId: Value(categoryId),
      limitAmount: Value(limitAmount),
      carryOverRule: Value(carryOverRule),
      carryOverPct: carryOverPct == null && nullToAbsent
          ? const Value.absent()
          : Value(carryOverPct),
    );
  }

  factory BudgetsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BudgetsTableData(
      id: serializer.fromJson<String>(json['id']),
      periodId: serializer.fromJson<String>(json['periodId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      limitAmount: serializer.fromJson<double>(json['limitAmount']),
      carryOverRule: serializer.fromJson<String>(json['carryOverRule']),
      carryOverPct: serializer.fromJson<double?>(json['carryOverPct']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'periodId': serializer.toJson<String>(periodId),
      'categoryId': serializer.toJson<String>(categoryId),
      'limitAmount': serializer.toJson<double>(limitAmount),
      'carryOverRule': serializer.toJson<String>(carryOverRule),
      'carryOverPct': serializer.toJson<double?>(carryOverPct),
    };
  }

  BudgetsTableData copyWith(
          {String? id,
          String? periodId,
          String? categoryId,
          double? limitAmount,
          String? carryOverRule,
          Value<double?> carryOverPct = const Value.absent()}) =>
      BudgetsTableData(
        id: id ?? this.id,
        periodId: periodId ?? this.periodId,
        categoryId: categoryId ?? this.categoryId,
        limitAmount: limitAmount ?? this.limitAmount,
        carryOverRule: carryOverRule ?? this.carryOverRule,
        carryOverPct:
            carryOverPct.present ? carryOverPct.value : this.carryOverPct,
      );
  BudgetsTableData copyWithCompanion(BudgetsTableCompanion data) {
    return BudgetsTableData(
      id: data.id.present ? data.id.value : this.id,
      periodId: data.periodId.present ? data.periodId.value : this.periodId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      limitAmount:
          data.limitAmount.present ? data.limitAmount.value : this.limitAmount,
      carryOverRule: data.carryOverRule.present
          ? data.carryOverRule.value
          : this.carryOverRule,
      carryOverPct: data.carryOverPct.present
          ? data.carryOverPct.value
          : this.carryOverPct,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BudgetsTableData(')
          ..write('id: $id, ')
          ..write('periodId: $periodId, ')
          ..write('categoryId: $categoryId, ')
          ..write('limitAmount: $limitAmount, ')
          ..write('carryOverRule: $carryOverRule, ')
          ..write('carryOverPct: $carryOverPct')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, periodId, categoryId, limitAmount, carryOverRule, carryOverPct);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BudgetsTableData &&
          other.id == this.id &&
          other.periodId == this.periodId &&
          other.categoryId == this.categoryId &&
          other.limitAmount == this.limitAmount &&
          other.carryOverRule == this.carryOverRule &&
          other.carryOverPct == this.carryOverPct);
}

class BudgetsTableCompanion extends UpdateCompanion<BudgetsTableData> {
  final Value<String> id;
  final Value<String> periodId;
  final Value<String> categoryId;
  final Value<double> limitAmount;
  final Value<String> carryOverRule;
  final Value<double?> carryOverPct;
  final Value<int> rowid;
  const BudgetsTableCompanion({
    this.id = const Value.absent(),
    this.periodId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.limitAmount = const Value.absent(),
    this.carryOverRule = const Value.absent(),
    this.carryOverPct = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BudgetsTableCompanion.insert({
    required String id,
    required String periodId,
    required String categoryId,
    required double limitAmount,
    required String carryOverRule,
    this.carryOverPct = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        periodId = Value(periodId),
        categoryId = Value(categoryId),
        limitAmount = Value(limitAmount),
        carryOverRule = Value(carryOverRule);
  static Insertable<BudgetsTableData> custom({
    Expression<String>? id,
    Expression<String>? periodId,
    Expression<String>? categoryId,
    Expression<double>? limitAmount,
    Expression<String>? carryOverRule,
    Expression<double>? carryOverPct,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (periodId != null) 'period_id': periodId,
      if (categoryId != null) 'category_id': categoryId,
      if (limitAmount != null) 'limit_amount': limitAmount,
      if (carryOverRule != null) 'carry_over_rule': carryOverRule,
      if (carryOverPct != null) 'carry_over_pct': carryOverPct,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BudgetsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? periodId,
      Value<String>? categoryId,
      Value<double>? limitAmount,
      Value<String>? carryOverRule,
      Value<double?>? carryOverPct,
      Value<int>? rowid}) {
    return BudgetsTableCompanion(
      id: id ?? this.id,
      periodId: periodId ?? this.periodId,
      categoryId: categoryId ?? this.categoryId,
      limitAmount: limitAmount ?? this.limitAmount,
      carryOverRule: carryOverRule ?? this.carryOverRule,
      carryOverPct: carryOverPct ?? this.carryOverPct,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (periodId.present) {
      map['period_id'] = Variable<String>(periodId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (limitAmount.present) {
      map['limit_amount'] = Variable<double>(limitAmount.value);
    }
    if (carryOverRule.present) {
      map['carry_over_rule'] = Variable<String>(carryOverRule.value);
    }
    if (carryOverPct.present) {
      map['carry_over_pct'] = Variable<double>(carryOverPct.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetsTableCompanion(')
          ..write('id: $id, ')
          ..write('periodId: $periodId, ')
          ..write('categoryId: $categoryId, ')
          ..write('limitAmount: $limitAmount, ')
          ..write('carryOverRule: $carryOverRule, ')
          ..write('carryOverPct: $carryOverPct, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalsTableTable extends GoalsTable
    with TableInfo<$GoalsTableTable, GoalsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _targetAmountMeta =
      const VerificationMeta('targetAmount');
  @override
  late final GeneratedColumn<double> targetAmount = GeneratedColumn<double>(
      'target_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _savedAmountMeta =
      const VerificationMeta('savedAmount');
  @override
  late final GeneratedColumn<double> savedAmount = GeneratedColumn<double>(
      'saved_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _autoTopUpRuleMeta =
      const VerificationMeta('autoTopUpRule');
  @override
  late final GeneratedColumn<String> autoTopUpRule = GeneratedColumn<String>(
      'auto_top_up_rule', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, targetAmount, savedAmount, dueDate, autoTopUpRule];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals_table';
  @override
  VerificationContext validateIntegrity(Insertable<GoalsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('target_amount')) {
      context.handle(
          _targetAmountMeta,
          targetAmount.isAcceptableOrUnknown(
              data['target_amount']!, _targetAmountMeta));
    } else if (isInserting) {
      context.missing(_targetAmountMeta);
    }
    if (data.containsKey('saved_amount')) {
      context.handle(
          _savedAmountMeta,
          savedAmount.isAcceptableOrUnknown(
              data['saved_amount']!, _savedAmountMeta));
    } else if (isInserting) {
      context.missing(_savedAmountMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('auto_top_up_rule')) {
      context.handle(
          _autoTopUpRuleMeta,
          autoTopUpRule.isAcceptableOrUnknown(
              data['auto_top_up_rule']!, _autoTopUpRuleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      targetAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}target_amount'])!,
      savedAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}saved_amount'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date']),
      autoTopUpRule: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}auto_top_up_rule']),
    );
  }

  @override
  $GoalsTableTable createAlias(String alias) {
    return $GoalsTableTable(attachedDatabase, alias);
  }
}

class GoalsTableData extends DataClass implements Insertable<GoalsTableData> {
  final String id;
  final String title;
  final double targetAmount;
  final double savedAmount;
  final DateTime? dueDate;
  final String? autoTopUpRule;
  const GoalsTableData(
      {required this.id,
      required this.title,
      required this.targetAmount,
      required this.savedAmount,
      this.dueDate,
      this.autoTopUpRule});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['target_amount'] = Variable<double>(targetAmount);
    map['saved_amount'] = Variable<double>(savedAmount);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || autoTopUpRule != null) {
      map['auto_top_up_rule'] = Variable<String>(autoTopUpRule);
    }
    return map;
  }

  GoalsTableCompanion toCompanion(bool nullToAbsent) {
    return GoalsTableCompanion(
      id: Value(id),
      title: Value(title),
      targetAmount: Value(targetAmount),
      savedAmount: Value(savedAmount),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      autoTopUpRule: autoTopUpRule == null && nullToAbsent
          ? const Value.absent()
          : Value(autoTopUpRule),
    );
  }

  factory GoalsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalsTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      targetAmount: serializer.fromJson<double>(json['targetAmount']),
      savedAmount: serializer.fromJson<double>(json['savedAmount']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      autoTopUpRule: serializer.fromJson<String?>(json['autoTopUpRule']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'targetAmount': serializer.toJson<double>(targetAmount),
      'savedAmount': serializer.toJson<double>(savedAmount),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'autoTopUpRule': serializer.toJson<String?>(autoTopUpRule),
    };
  }

  GoalsTableData copyWith(
          {String? id,
          String? title,
          double? targetAmount,
          double? savedAmount,
          Value<DateTime?> dueDate = const Value.absent(),
          Value<String?> autoTopUpRule = const Value.absent()}) =>
      GoalsTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        targetAmount: targetAmount ?? this.targetAmount,
        savedAmount: savedAmount ?? this.savedAmount,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        autoTopUpRule:
            autoTopUpRule.present ? autoTopUpRule.value : this.autoTopUpRule,
      );
  GoalsTableData copyWithCompanion(GoalsTableCompanion data) {
    return GoalsTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      targetAmount: data.targetAmount.present
          ? data.targetAmount.value
          : this.targetAmount,
      savedAmount:
          data.savedAmount.present ? data.savedAmount.value : this.savedAmount,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      autoTopUpRule: data.autoTopUpRule.present
          ? data.autoTopUpRule.value
          : this.autoTopUpRule,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalsTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('targetAmount: $targetAmount, ')
          ..write('savedAmount: $savedAmount, ')
          ..write('dueDate: $dueDate, ')
          ..write('autoTopUpRule: $autoTopUpRule')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, targetAmount, savedAmount, dueDate, autoTopUpRule);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalsTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.targetAmount == this.targetAmount &&
          other.savedAmount == this.savedAmount &&
          other.dueDate == this.dueDate &&
          other.autoTopUpRule == this.autoTopUpRule);
}

class GoalsTableCompanion extends UpdateCompanion<GoalsTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<double> targetAmount;
  final Value<double> savedAmount;
  final Value<DateTime?> dueDate;
  final Value<String?> autoTopUpRule;
  final Value<int> rowid;
  const GoalsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.targetAmount = const Value.absent(),
    this.savedAmount = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.autoTopUpRule = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalsTableCompanion.insert({
    required String id,
    required String title,
    required double targetAmount,
    required double savedAmount,
    this.dueDate = const Value.absent(),
    this.autoTopUpRule = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        targetAmount = Value(targetAmount),
        savedAmount = Value(savedAmount);
  static Insertable<GoalsTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<double>? targetAmount,
    Expression<double>? savedAmount,
    Expression<DateTime>? dueDate,
    Expression<String>? autoTopUpRule,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (targetAmount != null) 'target_amount': targetAmount,
      if (savedAmount != null) 'saved_amount': savedAmount,
      if (dueDate != null) 'due_date': dueDate,
      if (autoTopUpRule != null) 'auto_top_up_rule': autoTopUpRule,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<double>? targetAmount,
      Value<double>? savedAmount,
      Value<DateTime?>? dueDate,
      Value<String?>? autoTopUpRule,
      Value<int>? rowid}) {
    return GoalsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      targetAmount: targetAmount ?? this.targetAmount,
      savedAmount: savedAmount ?? this.savedAmount,
      dueDate: dueDate ?? this.dueDate,
      autoTopUpRule: autoTopUpRule ?? this.autoTopUpRule,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (targetAmount.present) {
      map['target_amount'] = Variable<double>(targetAmount.value);
    }
    if (savedAmount.present) {
      map['saved_amount'] = Variable<double>(savedAmount.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (autoTopUpRule.present) {
      map['auto_top_up_rule'] = Variable<String>(autoTopUpRule.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('targetAmount: $targetAmount, ')
          ..write('savedAmount: $savedAmount, ')
          ..write('dueDate: $dueDate, ')
          ..write('autoTopUpRule: $autoTopUpRule, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SubscriptionsTableTable extends SubscriptionsTable
    with TableInfo<$SubscriptionsTableTable, SubscriptionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubscriptionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _providerMeta =
      const VerificationMeta('provider');
  @override
  late final GeneratedColumn<String> provider = GeneratedColumn<String>(
      'provider', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cadenceMeta =
      const VerificationMeta('cadence');
  @override
  late final GeneratedColumn<String> cadence = GeneratedColumn<String>(
      'cadence', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nextChargeMeta =
      const VerificationMeta('nextCharge');
  @override
  late final GeneratedColumn<DateTime> nextCharge = GeneratedColumn<DateTime>(
      'next_charge', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories_table (id)'));
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($SubscriptionsTableTable.$convertertags);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _pauseMeta = const VerificationMeta('pause');
  @override
  late final GeneratedColumn<bool> pause = GeneratedColumn<bool>(
      'pause', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("pause" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        provider,
        amount,
        currency,
        cadence,
        nextCharge,
        categoryId,
        tags,
        active,
        pause
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subscriptions_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<SubscriptionsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('provider')) {
      context.handle(_providerMeta,
          provider.isAcceptableOrUnknown(data['provider']!, _providerMeta));
    } else if (isInserting) {
      context.missing(_providerMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('cadence')) {
      context.handle(_cadenceMeta,
          cadence.isAcceptableOrUnknown(data['cadence']!, _cadenceMeta));
    } else if (isInserting) {
      context.missing(_cadenceMeta);
    }
    if (data.containsKey('next_charge')) {
      context.handle(
          _nextChargeMeta,
          nextCharge.isAcceptableOrUnknown(
              data['next_charge']!, _nextChargeMeta));
    } else if (isInserting) {
      context.missing(_nextChargeMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    context.handle(_tagsMeta, const VerificationResult.success());
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('pause')) {
      context.handle(
          _pauseMeta, pause.isAcceptableOrUnknown(data['pause']!, _pauseMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubscriptionsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubscriptionsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      provider: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}provider'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      cadence: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cadence'])!,
      nextCharge: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}next_charge'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id']),
      tags: $SubscriptionsTableTable.$convertertags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      pause: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}pause'])!,
    );
  }

  @override
  $SubscriptionsTableTable createAlias(String alias) {
    return $SubscriptionsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertertags =
      const StringListConverter();
}

class SubscriptionsTableData extends DataClass
    implements Insertable<SubscriptionsTableData> {
  final String id;
  final String provider;
  final double amount;
  final String currency;
  final String cadence;
  final DateTime nextCharge;
  final String? categoryId;
  final List<String> tags;
  final bool active;
  final bool pause;
  const SubscriptionsTableData(
      {required this.id,
      required this.provider,
      required this.amount,
      required this.currency,
      required this.cadence,
      required this.nextCharge,
      this.categoryId,
      required this.tags,
      required this.active,
      required this.pause});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['provider'] = Variable<String>(provider);
    map['amount'] = Variable<double>(amount);
    map['currency'] = Variable<String>(currency);
    map['cadence'] = Variable<String>(cadence);
    map['next_charge'] = Variable<DateTime>(nextCharge);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    {
      map['tags'] =
          Variable<String>($SubscriptionsTableTable.$convertertags.toSql(tags));
    }
    map['active'] = Variable<bool>(active);
    map['pause'] = Variable<bool>(pause);
    return map;
  }

  SubscriptionsTableCompanion toCompanion(bool nullToAbsent) {
    return SubscriptionsTableCompanion(
      id: Value(id),
      provider: Value(provider),
      amount: Value(amount),
      currency: Value(currency),
      cadence: Value(cadence),
      nextCharge: Value(nextCharge),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      tags: Value(tags),
      active: Value(active),
      pause: Value(pause),
    );
  }

  factory SubscriptionsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubscriptionsTableData(
      id: serializer.fromJson<String>(json['id']),
      provider: serializer.fromJson<String>(json['provider']),
      amount: serializer.fromJson<double>(json['amount']),
      currency: serializer.fromJson<String>(json['currency']),
      cadence: serializer.fromJson<String>(json['cadence']),
      nextCharge: serializer.fromJson<DateTime>(json['nextCharge']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      tags: serializer.fromJson<List<String>>(json['tags']),
      active: serializer.fromJson<bool>(json['active']),
      pause: serializer.fromJson<bool>(json['pause']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'provider': serializer.toJson<String>(provider),
      'amount': serializer.toJson<double>(amount),
      'currency': serializer.toJson<String>(currency),
      'cadence': serializer.toJson<String>(cadence),
      'nextCharge': serializer.toJson<DateTime>(nextCharge),
      'categoryId': serializer.toJson<String?>(categoryId),
      'tags': serializer.toJson<List<String>>(tags),
      'active': serializer.toJson<bool>(active),
      'pause': serializer.toJson<bool>(pause),
    };
  }

  SubscriptionsTableData copyWith(
          {String? id,
          String? provider,
          double? amount,
          String? currency,
          String? cadence,
          DateTime? nextCharge,
          Value<String?> categoryId = const Value.absent(),
          List<String>? tags,
          bool? active,
          bool? pause}) =>
      SubscriptionsTableData(
        id: id ?? this.id,
        provider: provider ?? this.provider,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        cadence: cadence ?? this.cadence,
        nextCharge: nextCharge ?? this.nextCharge,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        tags: tags ?? this.tags,
        active: active ?? this.active,
        pause: pause ?? this.pause,
      );
  SubscriptionsTableData copyWithCompanion(SubscriptionsTableCompanion data) {
    return SubscriptionsTableData(
      id: data.id.present ? data.id.value : this.id,
      provider: data.provider.present ? data.provider.value : this.provider,
      amount: data.amount.present ? data.amount.value : this.amount,
      currency: data.currency.present ? data.currency.value : this.currency,
      cadence: data.cadence.present ? data.cadence.value : this.cadence,
      nextCharge:
          data.nextCharge.present ? data.nextCharge.value : this.nextCharge,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      tags: data.tags.present ? data.tags.value : this.tags,
      active: data.active.present ? data.active.value : this.active,
      pause: data.pause.present ? data.pause.value : this.pause,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubscriptionsTableData(')
          ..write('id: $id, ')
          ..write('provider: $provider, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('cadence: $cadence, ')
          ..write('nextCharge: $nextCharge, ')
          ..write('categoryId: $categoryId, ')
          ..write('tags: $tags, ')
          ..write('active: $active, ')
          ..write('pause: $pause')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, provider, amount, currency, cadence,
      nextCharge, categoryId, tags, active, pause);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubscriptionsTableData &&
          other.id == this.id &&
          other.provider == this.provider &&
          other.amount == this.amount &&
          other.currency == this.currency &&
          other.cadence == this.cadence &&
          other.nextCharge == this.nextCharge &&
          other.categoryId == this.categoryId &&
          other.tags == this.tags &&
          other.active == this.active &&
          other.pause == this.pause);
}

class SubscriptionsTableCompanion
    extends UpdateCompanion<SubscriptionsTableData> {
  final Value<String> id;
  final Value<String> provider;
  final Value<double> amount;
  final Value<String> currency;
  final Value<String> cadence;
  final Value<DateTime> nextCharge;
  final Value<String?> categoryId;
  final Value<List<String>> tags;
  final Value<bool> active;
  final Value<bool> pause;
  final Value<int> rowid;
  const SubscriptionsTableCompanion({
    this.id = const Value.absent(),
    this.provider = const Value.absent(),
    this.amount = const Value.absent(),
    this.currency = const Value.absent(),
    this.cadence = const Value.absent(),
    this.nextCharge = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.tags = const Value.absent(),
    this.active = const Value.absent(),
    this.pause = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubscriptionsTableCompanion.insert({
    required String id,
    required String provider,
    required double amount,
    required String currency,
    required String cadence,
    required DateTime nextCharge,
    this.categoryId = const Value.absent(),
    required List<String> tags,
    this.active = const Value.absent(),
    this.pause = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        provider = Value(provider),
        amount = Value(amount),
        currency = Value(currency),
        cadence = Value(cadence),
        nextCharge = Value(nextCharge),
        tags = Value(tags);
  static Insertable<SubscriptionsTableData> custom({
    Expression<String>? id,
    Expression<String>? provider,
    Expression<double>? amount,
    Expression<String>? currency,
    Expression<String>? cadence,
    Expression<DateTime>? nextCharge,
    Expression<String>? categoryId,
    Expression<String>? tags,
    Expression<bool>? active,
    Expression<bool>? pause,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (provider != null) 'provider': provider,
      if (amount != null) 'amount': amount,
      if (currency != null) 'currency': currency,
      if (cadence != null) 'cadence': cadence,
      if (nextCharge != null) 'next_charge': nextCharge,
      if (categoryId != null) 'category_id': categoryId,
      if (tags != null) 'tags': tags,
      if (active != null) 'active': active,
      if (pause != null) 'pause': pause,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubscriptionsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? provider,
      Value<double>? amount,
      Value<String>? currency,
      Value<String>? cadence,
      Value<DateTime>? nextCharge,
      Value<String?>? categoryId,
      Value<List<String>>? tags,
      Value<bool>? active,
      Value<bool>? pause,
      Value<int>? rowid}) {
    return SubscriptionsTableCompanion(
      id: id ?? this.id,
      provider: provider ?? this.provider,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      cadence: cadence ?? this.cadence,
      nextCharge: nextCharge ?? this.nextCharge,
      categoryId: categoryId ?? this.categoryId,
      tags: tags ?? this.tags,
      active: active ?? this.active,
      pause: pause ?? this.pause,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (provider.present) {
      map['provider'] = Variable<String>(provider.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (cadence.present) {
      map['cadence'] = Variable<String>(cadence.value);
    }
    if (nextCharge.present) {
      map['next_charge'] = Variable<DateTime>(nextCharge.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(
          $SubscriptionsTableTable.$convertertags.toSql(tags.value));
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (pause.present) {
      map['pause'] = Variable<bool>(pause.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubscriptionsTableCompanion(')
          ..write('id: $id, ')
          ..write('provider: $provider, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('cadence: $cadence, ')
          ..write('nextCharge: $nextCharge, ')
          ..write('categoryId: $categoryId, ')
          ..write('tags: $tags, ')
          ..write('active: $active, ')
          ..write('pause: $pause, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RulesTableTable extends RulesTable
    with TableInfo<$RulesTableTable, RulesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RulesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _conditionMeta =
      const VerificationMeta('condition');
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
      'condition', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
      'action', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
      'priority', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [id, condition, action, priority];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rules_table';
  @override
  VerificationContext validateIntegrity(Insertable<RulesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(_conditionMeta,
          condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta));
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RulesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RulesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      condition: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}condition'])!,
      action: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!,
    );
  }

  @override
  $RulesTableTable createAlias(String alias) {
    return $RulesTableTable(attachedDatabase, alias);
  }
}

class RulesTableData extends DataClass implements Insertable<RulesTableData> {
  final String id;
  final String condition;
  final String action;
  final int priority;
  const RulesTableData(
      {required this.id,
      required this.condition,
      required this.action,
      required this.priority});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['condition'] = Variable<String>(condition);
    map['action'] = Variable<String>(action);
    map['priority'] = Variable<int>(priority);
    return map;
  }

  RulesTableCompanion toCompanion(bool nullToAbsent) {
    return RulesTableCompanion(
      id: Value(id),
      condition: Value(condition),
      action: Value(action),
      priority: Value(priority),
    );
  }

  factory RulesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RulesTableData(
      id: serializer.fromJson<String>(json['id']),
      condition: serializer.fromJson<String>(json['condition']),
      action: serializer.fromJson<String>(json['action']),
      priority: serializer.fromJson<int>(json['priority']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'condition': serializer.toJson<String>(condition),
      'action': serializer.toJson<String>(action),
      'priority': serializer.toJson<int>(priority),
    };
  }

  RulesTableData copyWith(
          {String? id, String? condition, String? action, int? priority}) =>
      RulesTableData(
        id: id ?? this.id,
        condition: condition ?? this.condition,
        action: action ?? this.action,
        priority: priority ?? this.priority,
      );
  RulesTableData copyWithCompanion(RulesTableCompanion data) {
    return RulesTableData(
      id: data.id.present ? data.id.value : this.id,
      condition: data.condition.present ? data.condition.value : this.condition,
      action: data.action.present ? data.action.value : this.action,
      priority: data.priority.present ? data.priority.value : this.priority,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RulesTableData(')
          ..write('id: $id, ')
          ..write('condition: $condition, ')
          ..write('action: $action, ')
          ..write('priority: $priority')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, condition, action, priority);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RulesTableData &&
          other.id == this.id &&
          other.condition == this.condition &&
          other.action == this.action &&
          other.priority == this.priority);
}

class RulesTableCompanion extends UpdateCompanion<RulesTableData> {
  final Value<String> id;
  final Value<String> condition;
  final Value<String> action;
  final Value<int> priority;
  final Value<int> rowid;
  const RulesTableCompanion({
    this.id = const Value.absent(),
    this.condition = const Value.absent(),
    this.action = const Value.absent(),
    this.priority = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RulesTableCompanion.insert({
    required String id,
    required String condition,
    required String action,
    this.priority = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        condition = Value(condition),
        action = Value(action);
  static Insertable<RulesTableData> custom({
    Expression<String>? id,
    Expression<String>? condition,
    Expression<String>? action,
    Expression<int>? priority,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (condition != null) 'condition': condition,
      if (action != null) 'action': action,
      if (priority != null) 'priority': priority,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RulesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? condition,
      Value<String>? action,
      Value<int>? priority,
      Value<int>? rowid}) {
    return RulesTableCompanion(
      id: id ?? this.id,
      condition: condition ?? this.condition,
      action: action ?? this.action,
      priority: priority ?? this.priority,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RulesTableCompanion(')
          ..write('id: $id, ')
          ..write('condition: $condition, ')
          ..write('action: $action, ')
          ..write('priority: $priority, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AccountsTableTable accountsTable = $AccountsTableTable(this);
  late final $PaycheckPeriodsTableTable paycheckPeriodsTable =
      $PaycheckPeriodsTableTable(this);
  late final $CategoriesTableTable categoriesTable =
      $CategoriesTableTable(this);
  late final $TagsTableTable tagsTable = $TagsTableTable(this);
  late final $MerchantsTableTable merchantsTable = $MerchantsTableTable(this);
  late final $PlanItemsTableTable planItemsTable = $PlanItemsTableTable(this);
  late final $TransactionsTableTable transactionsTable =
      $TransactionsTableTable(this);
  late final $BudgetsTableTable budgetsTable = $BudgetsTableTable(this);
  late final $GoalsTableTable goalsTable = $GoalsTableTable(this);
  late final $SubscriptionsTableTable subscriptionsTable =
      $SubscriptionsTableTable(this);
  late final $RulesTableTable rulesTable = $RulesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        accountsTable,
        paycheckPeriodsTable,
        categoriesTable,
        tagsTable,
        merchantsTable,
        planItemsTable,
        transactionsTable,
        budgetsTable,
        goalsTable,
        subscriptionsTable,
        rulesTable
      ];
}

typedef $$AccountsTableTableCreateCompanionBuilder = AccountsTableCompanion
    Function({
  required String id,
  required String name,
  required String type,
  required String currency,
  Value<double> openingBalance,
  Value<bool> archived,
  Value<int> rowid,
});
typedef $$AccountsTableTableUpdateCompanionBuilder = AccountsTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> type,
  Value<String> currency,
  Value<double> openingBalance,
  Value<bool> archived,
  Value<int> rowid,
});

final class $$AccountsTableTableReferences extends BaseReferences<_$AppDatabase,
    $AccountsTableTable, AccountsTableData> {
  $$AccountsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionsTableTable,
      List<TransactionsTableData>> _transactionsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.transactionsTable,
          aliasName: $_aliasNameGenerator(
              db.accountsTable.id, db.transactionsTable.accountId));

  $$TransactionsTableTableProcessedTableManager get transactionsTableRefs {
    final manager =
        $$TransactionsTableTableTableManager($_db, $_db.transactionsTable)
            .filter((f) => f.accountId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_transactionsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AccountsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AccountsTableTable> {
  $$AccountsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnFilters(column));

  Expression<bool> transactionsTableRefs(
      Expression<bool> Function($$TransactionsTableTableFilterComposer f) f) {
    final $$TransactionsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactionsTable,
        getReferencedColumn: (t) => t.accountId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableTableFilterComposer(
              $db: $db,
              $table: $db.transactionsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AccountsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountsTableTable> {
  $$AccountsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnOrderings(column));
}

class $$AccountsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountsTableTable> {
  $$AccountsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  Expression<T> transactionsTableRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableTableAnnotationComposer a) f) {
    final $$TransactionsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.transactionsTable,
            getReferencedColumn: (t) => t.accountId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TransactionsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.transactionsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$AccountsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountsTableTable,
    AccountsTableData,
    $$AccountsTableTableFilterComposer,
    $$AccountsTableTableOrderingComposer,
    $$AccountsTableTableAnnotationComposer,
    $$AccountsTableTableCreateCompanionBuilder,
    $$AccountsTableTableUpdateCompanionBuilder,
    (AccountsTableData, $$AccountsTableTableReferences),
    AccountsTableData,
    PrefetchHooks Function({bool transactionsTableRefs})> {
  $$AccountsTableTableTableManager(_$AppDatabase db, $AccountsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<double> openingBalance = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountsTableCompanion(
            id: id,
            name: name,
            type: type,
            currency: currency,
            openingBalance: openingBalance,
            archived: archived,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String type,
            required String currency,
            Value<double> openingBalance = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountsTableCompanion.insert(
            id: id,
            name: name,
            type: type,
            currency: currency,
            openingBalance: openingBalance,
            archived: archived,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AccountsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({transactionsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (transactionsTableRefs) db.transactionsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$AccountsTableTableReferences
                            ._transactionsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AccountsTableTableReferences(db, table, p0)
                                .transactionsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.accountId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AccountsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AccountsTableTable,
    AccountsTableData,
    $$AccountsTableTableFilterComposer,
    $$AccountsTableTableOrderingComposer,
    $$AccountsTableTableAnnotationComposer,
    $$AccountsTableTableCreateCompanionBuilder,
    $$AccountsTableTableUpdateCompanionBuilder,
    (AccountsTableData, $$AccountsTableTableReferences),
    AccountsTableData,
    PrefetchHooks Function({bool transactionsTableRefs})>;
typedef $$PaycheckPeriodsTableTableCreateCompanionBuilder
    = PaycheckPeriodsTableCompanion Function({
  required String id,
  required String title,
  required DateTime startDate,
  required DateTime endDate,
  required String kind,
  Value<bool> closed,
  Value<int> rowid,
});
typedef $$PaycheckPeriodsTableTableUpdateCompanionBuilder
    = PaycheckPeriodsTableCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<DateTime> startDate,
  Value<DateTime> endDate,
  Value<String> kind,
  Value<bool> closed,
  Value<int> rowid,
});

final class $$PaycheckPeriodsTableTableReferences extends BaseReferences<
    _$AppDatabase, $PaycheckPeriodsTableTable, PaycheckPeriodsTableData> {
  $$PaycheckPeriodsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlanItemsTableTable, List<PlanItemsTableData>>
      _planItemsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.planItemsTable,
              aliasName: $_aliasNameGenerator(
                  db.paycheckPeriodsTable.id, db.planItemsTable.periodId));

  $$PlanItemsTableTableProcessedTableManager get planItemsTableRefs {
    final manager = $$PlanItemsTableTableTableManager($_db, $_db.planItemsTable)
        .filter((f) => f.periodId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_planItemsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$BudgetsTableTable, List<BudgetsTableData>>
      _budgetsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.budgetsTable,
              aliasName: $_aliasNameGenerator(
                  db.paycheckPeriodsTable.id, db.budgetsTable.periodId));

  $$BudgetsTableTableProcessedTableManager get budgetsTableRefs {
    final manager = $$BudgetsTableTableTableManager($_db, $_db.budgetsTable)
        .filter((f) => f.periodId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_budgetsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PaycheckPeriodsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PaycheckPeriodsTableTable> {
  $$PaycheckPeriodsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get closed => $composableBuilder(
      column: $table.closed, builder: (column) => ColumnFilters(column));

  Expression<bool> planItemsTableRefs(
      Expression<bool> Function($$PlanItemsTableTableFilterComposer f) f) {
    final $$PlanItemsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.planItemsTable,
        getReferencedColumn: (t) => t.periodId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlanItemsTableTableFilterComposer(
              $db: $db,
              $table: $db.planItemsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> budgetsTableRefs(
      Expression<bool> Function($$BudgetsTableTableFilterComposer f) f) {
    final $$BudgetsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.budgetsTable,
        getReferencedColumn: (t) => t.periodId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BudgetsTableTableFilterComposer(
              $db: $db,
              $table: $db.budgetsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PaycheckPeriodsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PaycheckPeriodsTableTable> {
  $$PaycheckPeriodsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get closed => $composableBuilder(
      column: $table.closed, builder: (column) => ColumnOrderings(column));
}

class $$PaycheckPeriodsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaycheckPeriodsTableTable> {
  $$PaycheckPeriodsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<bool> get closed =>
      $composableBuilder(column: $table.closed, builder: (column) => column);

  Expression<T> planItemsTableRefs<T extends Object>(
      Expression<T> Function($$PlanItemsTableTableAnnotationComposer a) f) {
    final $$PlanItemsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.planItemsTable,
        getReferencedColumn: (t) => t.periodId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlanItemsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.planItemsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> budgetsTableRefs<T extends Object>(
      Expression<T> Function($$BudgetsTableTableAnnotationComposer a) f) {
    final $$BudgetsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.budgetsTable,
        getReferencedColumn: (t) => t.periodId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BudgetsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.budgetsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PaycheckPeriodsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PaycheckPeriodsTableTable,
    PaycheckPeriodsTableData,
    $$PaycheckPeriodsTableTableFilterComposer,
    $$PaycheckPeriodsTableTableOrderingComposer,
    $$PaycheckPeriodsTableTableAnnotationComposer,
    $$PaycheckPeriodsTableTableCreateCompanionBuilder,
    $$PaycheckPeriodsTableTableUpdateCompanionBuilder,
    (PaycheckPeriodsTableData, $$PaycheckPeriodsTableTableReferences),
    PaycheckPeriodsTableData,
    PrefetchHooks Function({bool planItemsTableRefs, bool budgetsTableRefs})> {
  $$PaycheckPeriodsTableTableTableManager(
      _$AppDatabase db, $PaycheckPeriodsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaycheckPeriodsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaycheckPeriodsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaycheckPeriodsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> endDate = const Value.absent(),
            Value<String> kind = const Value.absent(),
            Value<bool> closed = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PaycheckPeriodsTableCompanion(
            id: id,
            title: title,
            startDate: startDate,
            endDate: endDate,
            kind: kind,
            closed: closed,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required DateTime startDate,
            required DateTime endDate,
            required String kind,
            Value<bool> closed = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PaycheckPeriodsTableCompanion.insert(
            id: id,
            title: title,
            startDate: startDate,
            endDate: endDate,
            kind: kind,
            closed: closed,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PaycheckPeriodsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {planItemsTableRefs = false, budgetsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (planItemsTableRefs) db.planItemsTable,
                if (budgetsTableRefs) db.budgetsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (planItemsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$PaycheckPeriodsTableTableReferences
                            ._planItemsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PaycheckPeriodsTableTableReferences(db, table, p0)
                                .planItemsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.periodId == item.id),
                        typedResults: items),
                  if (budgetsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$PaycheckPeriodsTableTableReferences
                            ._budgetsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PaycheckPeriodsTableTableReferences(db, table, p0)
                                .budgetsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.periodId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PaycheckPeriodsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $PaycheckPeriodsTableTable,
        PaycheckPeriodsTableData,
        $$PaycheckPeriodsTableTableFilterComposer,
        $$PaycheckPeriodsTableTableOrderingComposer,
        $$PaycheckPeriodsTableTableAnnotationComposer,
        $$PaycheckPeriodsTableTableCreateCompanionBuilder,
        $$PaycheckPeriodsTableTableUpdateCompanionBuilder,
        (PaycheckPeriodsTableData, $$PaycheckPeriodsTableTableReferences),
        PaycheckPeriodsTableData,
        PrefetchHooks Function(
            {bool planItemsTableRefs, bool budgetsTableRefs})>;
typedef $$CategoriesTableTableCreateCompanionBuilder = CategoriesTableCompanion
    Function({
  required String id,
  required String name,
  required String emoji,
  Value<String?> parentId,
  required String colorHex,
  Value<bool> hidden,
  Value<int> rowid,
});
typedef $$CategoriesTableTableUpdateCompanionBuilder = CategoriesTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> emoji,
  Value<String?> parentId,
  Value<String> colorHex,
  Value<bool> hidden,
  Value<int> rowid,
});

final class $$CategoriesTableTableReferences extends BaseReferences<
    _$AppDatabase, $CategoriesTableTable, CategoriesTableData> {
  $$CategoriesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTableTable _parentIdTable(_$AppDatabase db) =>
      db.categoriesTable.createAlias($_aliasNameGenerator(
          db.categoriesTable.parentId, db.categoriesTable.id));

  $$CategoriesTableTableProcessedTableManager? get parentId {
    if ($_item.parentId == null) return null;
    final manager =
        $$CategoriesTableTableTableManager($_db, $_db.categoriesTable)
            .filter((f) => f.id($_item.parentId!));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$PlanItemsTableTable, List<PlanItemsTableData>>
      _planItemsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.planItemsTable,
              aliasName: $_aliasNameGenerator(
                  db.categoriesTable.id, db.planItemsTable.categoryId));

  $$PlanItemsTableTableProcessedTableManager get planItemsTableRefs {
    final manager = $$PlanItemsTableTableTableManager($_db, $_db.planItemsTable)
        .filter((f) => f.categoryId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_planItemsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TransactionsTableTable,
      List<TransactionsTableData>> _transactionsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.transactionsTable,
          aliasName: $_aliasNameGenerator(
              db.categoriesTable.id, db.transactionsTable.categoryId));

  $$TransactionsTableTableProcessedTableManager get transactionsTableRefs {
    final manager =
        $$TransactionsTableTableTableManager($_db, $_db.transactionsTable)
            .filter((f) => f.categoryId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_transactionsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$BudgetsTableTable, List<BudgetsTableData>>
      _budgetsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.budgetsTable,
              aliasName: $_aliasNameGenerator(
                  db.categoriesTable.id, db.budgetsTable.categoryId));

  $$BudgetsTableTableProcessedTableManager get budgetsTableRefs {
    final manager = $$BudgetsTableTableTableManager($_db, $_db.budgetsTable)
        .filter((f) => f.categoryId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_budgetsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$SubscriptionsTableTable,
      List<SubscriptionsTableData>> _subscriptionsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.subscriptionsTable,
          aliasName: $_aliasNameGenerator(
              db.categoriesTable.id, db.subscriptionsTable.categoryId));

  $$SubscriptionsTableTableProcessedTableManager get subscriptionsTableRefs {
    final manager =
        $$SubscriptionsTableTableTableManager($_db, $_db.subscriptionsTable)
            .filter((f) => f.categoryId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_subscriptionsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTableTable> {
  $$CategoriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get emoji => $composableBuilder(
      column: $table.emoji, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hidden => $composableBuilder(
      column: $table.hidden, builder: (column) => ColumnFilters(column));

  $$CategoriesTableTableFilterComposer get parentId {
    final $$CategoriesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableFilterComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> planItemsTableRefs(
      Expression<bool> Function($$PlanItemsTableTableFilterComposer f) f) {
    final $$PlanItemsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.planItemsTable,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlanItemsTableTableFilterComposer(
              $db: $db,
              $table: $db.planItemsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> transactionsTableRefs(
      Expression<bool> Function($$TransactionsTableTableFilterComposer f) f) {
    final $$TransactionsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactionsTable,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableTableFilterComposer(
              $db: $db,
              $table: $db.transactionsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> budgetsTableRefs(
      Expression<bool> Function($$BudgetsTableTableFilterComposer f) f) {
    final $$BudgetsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.budgetsTable,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BudgetsTableTableFilterComposer(
              $db: $db,
              $table: $db.budgetsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> subscriptionsTableRefs(
      Expression<bool> Function($$SubscriptionsTableTableFilterComposer f) f) {
    final $$SubscriptionsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.subscriptionsTable,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SubscriptionsTableTableFilterComposer(
              $db: $db,
              $table: $db.subscriptionsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTableTable> {
  $$CategoriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get emoji => $composableBuilder(
      column: $table.emoji, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hidden => $composableBuilder(
      column: $table.hidden, builder: (column) => ColumnOrderings(column));

  $$CategoriesTableTableOrderingComposer get parentId {
    final $$CategoriesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableOrderingComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CategoriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTableTable> {
  $$CategoriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get emoji =>
      $composableBuilder(column: $table.emoji, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<bool> get hidden =>
      $composableBuilder(column: $table.hidden, builder: (column) => column);

  $$CategoriesTableTableAnnotationComposer get parentId {
    final $$CategoriesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> planItemsTableRefs<T extends Object>(
      Expression<T> Function($$PlanItemsTableTableAnnotationComposer a) f) {
    final $$PlanItemsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.planItemsTable,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlanItemsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.planItemsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> transactionsTableRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableTableAnnotationComposer a) f) {
    final $$TransactionsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.transactionsTable,
            getReferencedColumn: (t) => t.categoryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TransactionsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.transactionsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> budgetsTableRefs<T extends Object>(
      Expression<T> Function($$BudgetsTableTableAnnotationComposer a) f) {
    final $$BudgetsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.budgetsTable,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BudgetsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.budgetsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> subscriptionsTableRefs<T extends Object>(
      Expression<T> Function($$SubscriptionsTableTableAnnotationComposer a) f) {
    final $$SubscriptionsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.subscriptionsTable,
            getReferencedColumn: (t) => t.categoryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$SubscriptionsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.subscriptionsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CategoriesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTableTable,
    CategoriesTableData,
    $$CategoriesTableTableFilterComposer,
    $$CategoriesTableTableOrderingComposer,
    $$CategoriesTableTableAnnotationComposer,
    $$CategoriesTableTableCreateCompanionBuilder,
    $$CategoriesTableTableUpdateCompanionBuilder,
    (CategoriesTableData, $$CategoriesTableTableReferences),
    CategoriesTableData,
    PrefetchHooks Function(
        {bool parentId,
        bool planItemsTableRefs,
        bool transactionsTableRefs,
        bool budgetsTableRefs,
        bool subscriptionsTableRefs})> {
  $$CategoriesTableTableTableManager(
      _$AppDatabase db, $CategoriesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> emoji = const Value.absent(),
            Value<String?> parentId = const Value.absent(),
            Value<String> colorHex = const Value.absent(),
            Value<bool> hidden = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesTableCompanion(
            id: id,
            name: name,
            emoji: emoji,
            parentId: parentId,
            colorHex: colorHex,
            hidden: hidden,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String emoji,
            Value<String?> parentId = const Value.absent(),
            required String colorHex,
            Value<bool> hidden = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesTableCompanion.insert(
            id: id,
            name: name,
            emoji: emoji,
            parentId: parentId,
            colorHex: colorHex,
            hidden: hidden,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CategoriesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {parentId = false,
              planItemsTableRefs = false,
              transactionsTableRefs = false,
              budgetsTableRefs = false,
              subscriptionsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (planItemsTableRefs) db.planItemsTable,
                if (transactionsTableRefs) db.transactionsTable,
                if (budgetsTableRefs) db.budgetsTable,
                if (subscriptionsTableRefs) db.subscriptionsTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (parentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.parentId,
                    referencedTable:
                        $$CategoriesTableTableReferences._parentIdTable(db),
                    referencedColumn:
                        $$CategoriesTableTableReferences._parentIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (planItemsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CategoriesTableTableReferences
                            ._planItemsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableTableReferences(db, table, p0)
                                .planItemsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items),
                  if (transactionsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CategoriesTableTableReferences
                            ._transactionsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableTableReferences(db, table, p0)
                                .transactionsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items),
                  if (budgetsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CategoriesTableTableReferences
                            ._budgetsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableTableReferences(db, table, p0)
                                .budgetsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items),
                  if (subscriptionsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CategoriesTableTableReferences
                            ._subscriptionsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableTableReferences(db, table, p0)
                                .subscriptionsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoriesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTableTable,
    CategoriesTableData,
    $$CategoriesTableTableFilterComposer,
    $$CategoriesTableTableOrderingComposer,
    $$CategoriesTableTableAnnotationComposer,
    $$CategoriesTableTableCreateCompanionBuilder,
    $$CategoriesTableTableUpdateCompanionBuilder,
    (CategoriesTableData, $$CategoriesTableTableReferences),
    CategoriesTableData,
    PrefetchHooks Function(
        {bool parentId,
        bool planItemsTableRefs,
        bool transactionsTableRefs,
        bool budgetsTableRefs,
        bool subscriptionsTableRefs})>;
typedef $$TagsTableTableCreateCompanionBuilder = TagsTableCompanion Function({
  required String id,
  required String name,
  Value<String?> colorHex,
  Value<int> rowid,
});
typedef $$TagsTableTableUpdateCompanionBuilder = TagsTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> colorHex,
  Value<int> rowid,
});

class $$TagsTableTableFilterComposer
    extends Composer<_$AppDatabase, $TagsTableTable> {
  $$TagsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnFilters(column));
}

class $$TagsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TagsTableTable> {
  $$TagsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnOrderings(column));
}

class $$TagsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTableTable> {
  $$TagsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);
}

class $$TagsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TagsTableTable,
    TagsTableData,
    $$TagsTableTableFilterComposer,
    $$TagsTableTableOrderingComposer,
    $$TagsTableTableAnnotationComposer,
    $$TagsTableTableCreateCompanionBuilder,
    $$TagsTableTableUpdateCompanionBuilder,
    (
      TagsTableData,
      BaseReferences<_$AppDatabase, $TagsTableTable, TagsTableData>
    ),
    TagsTableData,
    PrefetchHooks Function()> {
  $$TagsTableTableTableManager(_$AppDatabase db, $TagsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> colorHex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TagsTableCompanion(
            id: id,
            name: name,
            colorHex: colorHex,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> colorHex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TagsTableCompanion.insert(
            id: id,
            name: name,
            colorHex: colorHex,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TagsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TagsTableTable,
    TagsTableData,
    $$TagsTableTableFilterComposer,
    $$TagsTableTableOrderingComposer,
    $$TagsTableTableAnnotationComposer,
    $$TagsTableTableCreateCompanionBuilder,
    $$TagsTableTableUpdateCompanionBuilder,
    (
      TagsTableData,
      BaseReferences<_$AppDatabase, $TagsTableTable, TagsTableData>
    ),
    TagsTableData,
    PrefetchHooks Function()>;
typedef $$MerchantsTableTableCreateCompanionBuilder = MerchantsTableCompanion
    Function({
  required String id,
  required String name,
  Value<String?> location,
  Value<String?> ruleHint,
  Value<int> rowid,
});
typedef $$MerchantsTableTableUpdateCompanionBuilder = MerchantsTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> location,
  Value<String?> ruleHint,
  Value<int> rowid,
});

final class $$MerchantsTableTableReferences extends BaseReferences<
    _$AppDatabase, $MerchantsTableTable, MerchantsTableData> {
  $$MerchantsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionsTableTable,
      List<TransactionsTableData>> _transactionsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.transactionsTable,
          aliasName: $_aliasNameGenerator(
              db.merchantsTable.id, db.transactionsTable.merchantId));

  $$TransactionsTableTableProcessedTableManager get transactionsTableRefs {
    final manager =
        $$TransactionsTableTableTableManager($_db, $_db.transactionsTable)
            .filter((f) => f.merchantId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_transactionsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MerchantsTableTableFilterComposer
    extends Composer<_$AppDatabase, $MerchantsTableTable> {
  $$MerchantsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ruleHint => $composableBuilder(
      column: $table.ruleHint, builder: (column) => ColumnFilters(column));

  Expression<bool> transactionsTableRefs(
      Expression<bool> Function($$TransactionsTableTableFilterComposer f) f) {
    final $$TransactionsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactionsTable,
        getReferencedColumn: (t) => t.merchantId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableTableFilterComposer(
              $db: $db,
              $table: $db.transactionsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MerchantsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MerchantsTableTable> {
  $$MerchantsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ruleHint => $composableBuilder(
      column: $table.ruleHint, builder: (column) => ColumnOrderings(column));
}

class $$MerchantsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MerchantsTableTable> {
  $$MerchantsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get ruleHint =>
      $composableBuilder(column: $table.ruleHint, builder: (column) => column);

  Expression<T> transactionsTableRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableTableAnnotationComposer a) f) {
    final $$TransactionsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.transactionsTable,
            getReferencedColumn: (t) => t.merchantId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TransactionsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.transactionsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$MerchantsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MerchantsTableTable,
    MerchantsTableData,
    $$MerchantsTableTableFilterComposer,
    $$MerchantsTableTableOrderingComposer,
    $$MerchantsTableTableAnnotationComposer,
    $$MerchantsTableTableCreateCompanionBuilder,
    $$MerchantsTableTableUpdateCompanionBuilder,
    (MerchantsTableData, $$MerchantsTableTableReferences),
    MerchantsTableData,
    PrefetchHooks Function({bool transactionsTableRefs})> {
  $$MerchantsTableTableTableManager(
      _$AppDatabase db, $MerchantsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MerchantsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MerchantsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MerchantsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> ruleHint = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MerchantsTableCompanion(
            id: id,
            name: name,
            location: location,
            ruleHint: ruleHint,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> location = const Value.absent(),
            Value<String?> ruleHint = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MerchantsTableCompanion.insert(
            id: id,
            name: name,
            location: location,
            ruleHint: ruleHint,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MerchantsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({transactionsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (transactionsTableRefs) db.transactionsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MerchantsTableTableReferences
                            ._transactionsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MerchantsTableTableReferences(db, table, p0)
                                .transactionsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.merchantId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MerchantsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MerchantsTableTable,
    MerchantsTableData,
    $$MerchantsTableTableFilterComposer,
    $$MerchantsTableTableOrderingComposer,
    $$MerchantsTableTableAnnotationComposer,
    $$MerchantsTableTableCreateCompanionBuilder,
    $$MerchantsTableTableUpdateCompanionBuilder,
    (MerchantsTableData, $$MerchantsTableTableReferences),
    MerchantsTableData,
    PrefetchHooks Function({bool transactionsTableRefs})>;
typedef $$PlanItemsTableTableCreateCompanionBuilder = PlanItemsTableCompanion
    Function({
  required String id,
  required String title,
  required double expectedAmount,
  Value<String?> categoryId,
  required List<String> tags,
  required DateTime deadline,
  required String periodId,
  Value<int> priority,
  required String flex,
  Value<bool> done,
  Value<int> rowid,
});
typedef $$PlanItemsTableTableUpdateCompanionBuilder = PlanItemsTableCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<double> expectedAmount,
  Value<String?> categoryId,
  Value<List<String>> tags,
  Value<DateTime> deadline,
  Value<String> periodId,
  Value<int> priority,
  Value<String> flex,
  Value<bool> done,
  Value<int> rowid,
});

final class $$PlanItemsTableTableReferences extends BaseReferences<
    _$AppDatabase, $PlanItemsTableTable, PlanItemsTableData> {
  $$PlanItemsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTableTable _categoryIdTable(_$AppDatabase db) =>
      db.categoriesTable.createAlias($_aliasNameGenerator(
          db.planItemsTable.categoryId, db.categoriesTable.id));

  $$CategoriesTableTableProcessedTableManager? get categoryId {
    if ($_item.categoryId == null) return null;
    final manager =
        $$CategoriesTableTableTableManager($_db, $_db.categoriesTable)
            .filter((f) => f.id($_item.categoryId!));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PaycheckPeriodsTableTable _periodIdTable(_$AppDatabase db) =>
      db.paycheckPeriodsTable.createAlias($_aliasNameGenerator(
          db.planItemsTable.periodId, db.paycheckPeriodsTable.id));

  $$PaycheckPeriodsTableTableProcessedTableManager? get periodId {
    if ($_item.periodId == null) return null;
    final manager =
        $$PaycheckPeriodsTableTableTableManager($_db, $_db.paycheckPeriodsTable)
            .filter((f) => f.id($_item.periodId!));
    final item = $_typedResult.readTableOrNull(_periodIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TransactionsTableTable,
      List<TransactionsTableData>> _transactionsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.transactionsTable,
          aliasName: $_aliasNameGenerator(
              db.planItemsTable.id, db.transactionsTable.planItemId));

  $$TransactionsTableTableProcessedTableManager get transactionsTableRefs {
    final manager =
        $$TransactionsTableTableTableManager($_db, $_db.transactionsTable)
            .filter((f) => f.planItemId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_transactionsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PlanItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PlanItemsTableTable> {
  $$PlanItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get expectedAmount => $composableBuilder(
      column: $table.expectedAmount,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get tags =>
      $composableBuilder(
          column: $table.tags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get flex => $composableBuilder(
      column: $table.flex, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get done => $composableBuilder(
      column: $table.done, builder: (column) => ColumnFilters(column));

  $$CategoriesTableTableFilterComposer get categoryId {
    final $$CategoriesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableFilterComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PaycheckPeriodsTableTableFilterComposer get periodId {
    final $$PaycheckPeriodsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.periodId,
        referencedTable: $db.paycheckPeriodsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PaycheckPeriodsTableTableFilterComposer(
              $db: $db,
              $table: $db.paycheckPeriodsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> transactionsTableRefs(
      Expression<bool> Function($$TransactionsTableTableFilterComposer f) f) {
    final $$TransactionsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactionsTable,
        getReferencedColumn: (t) => t.planItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableTableFilterComposer(
              $db: $db,
              $table: $db.transactionsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PlanItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PlanItemsTableTable> {
  $$PlanItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get expectedAmount => $composableBuilder(
      column: $table.expectedAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get flex => $composableBuilder(
      column: $table.flex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get done => $composableBuilder(
      column: $table.done, builder: (column) => ColumnOrderings(column));

  $$CategoriesTableTableOrderingComposer get categoryId {
    final $$CategoriesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableOrderingComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PaycheckPeriodsTableTableOrderingComposer get periodId {
    final $$PaycheckPeriodsTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.periodId,
            referencedTable: $db.paycheckPeriodsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PaycheckPeriodsTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.paycheckPeriodsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$PlanItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlanItemsTableTable> {
  $$PlanItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<double> get expectedAmount => $composableBuilder(
      column: $table.expectedAmount, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get flex =>
      $composableBuilder(column: $table.flex, builder: (column) => column);

  GeneratedColumn<bool> get done =>
      $composableBuilder(column: $table.done, builder: (column) => column);

  $$CategoriesTableTableAnnotationComposer get categoryId {
    final $$CategoriesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PaycheckPeriodsTableTableAnnotationComposer get periodId {
    final $$PaycheckPeriodsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.periodId,
            referencedTable: $db.paycheckPeriodsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PaycheckPeriodsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.paycheckPeriodsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<T> transactionsTableRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableTableAnnotationComposer a) f) {
    final $$TransactionsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.transactionsTable,
            getReferencedColumn: (t) => t.planItemId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TransactionsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.transactionsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PlanItemsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlanItemsTableTable,
    PlanItemsTableData,
    $$PlanItemsTableTableFilterComposer,
    $$PlanItemsTableTableOrderingComposer,
    $$PlanItemsTableTableAnnotationComposer,
    $$PlanItemsTableTableCreateCompanionBuilder,
    $$PlanItemsTableTableUpdateCompanionBuilder,
    (PlanItemsTableData, $$PlanItemsTableTableReferences),
    PlanItemsTableData,
    PrefetchHooks Function(
        {bool categoryId, bool periodId, bool transactionsTableRefs})> {
  $$PlanItemsTableTableTableManager(
      _$AppDatabase db, $PlanItemsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlanItemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlanItemsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlanItemsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<double> expectedAmount = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<List<String>> tags = const Value.absent(),
            Value<DateTime> deadline = const Value.absent(),
            Value<String> periodId = const Value.absent(),
            Value<int> priority = const Value.absent(),
            Value<String> flex = const Value.absent(),
            Value<bool> done = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlanItemsTableCompanion(
            id: id,
            title: title,
            expectedAmount: expectedAmount,
            categoryId: categoryId,
            tags: tags,
            deadline: deadline,
            periodId: periodId,
            priority: priority,
            flex: flex,
            done: done,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required double expectedAmount,
            Value<String?> categoryId = const Value.absent(),
            required List<String> tags,
            required DateTime deadline,
            required String periodId,
            Value<int> priority = const Value.absent(),
            required String flex,
            Value<bool> done = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlanItemsTableCompanion.insert(
            id: id,
            title: title,
            expectedAmount: expectedAmount,
            categoryId: categoryId,
            tags: tags,
            deadline: deadline,
            periodId: periodId,
            priority: priority,
            flex: flex,
            done: done,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlanItemsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {categoryId = false,
              periodId = false,
              transactionsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (transactionsTableRefs) db.transactionsTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$PlanItemsTableTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$PlanItemsTableTableReferences._categoryIdTable(db).id,
                  ) as T;
                }
                if (periodId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.periodId,
                    referencedTable:
                        $$PlanItemsTableTableReferences._periodIdTable(db),
                    referencedColumn:
                        $$PlanItemsTableTableReferences._periodIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$PlanItemsTableTableReferences
                            ._transactionsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlanItemsTableTableReferences(db, table, p0)
                                .transactionsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.planItemId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PlanItemsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlanItemsTableTable,
    PlanItemsTableData,
    $$PlanItemsTableTableFilterComposer,
    $$PlanItemsTableTableOrderingComposer,
    $$PlanItemsTableTableAnnotationComposer,
    $$PlanItemsTableTableCreateCompanionBuilder,
    $$PlanItemsTableTableUpdateCompanionBuilder,
    (PlanItemsTableData, $$PlanItemsTableTableReferences),
    PlanItemsTableData,
    PrefetchHooks Function(
        {bool categoryId, bool periodId, bool transactionsTableRefs})>;
typedef $$TransactionsTableTableCreateCompanionBuilder
    = TransactionsTableCompanion Function({
  required String id,
  required DateTime datetime,
  required double amount,
  required String currency,
  required String accountId,
  required String type,
  Value<String?> categoryId,
  required List<String> tags,
  Value<String?> merchantId,
  Value<String?> note,
  required List<Map<String, dynamic>> attachments,
  Value<bool> planned,
  Value<String?> planItemId,
  Value<bool> excludeFromBudget,
  Value<int> rowid,
});
typedef $$TransactionsTableTableUpdateCompanionBuilder
    = TransactionsTableCompanion Function({
  Value<String> id,
  Value<DateTime> datetime,
  Value<double> amount,
  Value<String> currency,
  Value<String> accountId,
  Value<String> type,
  Value<String?> categoryId,
  Value<List<String>> tags,
  Value<String?> merchantId,
  Value<String?> note,
  Value<List<Map<String, dynamic>>> attachments,
  Value<bool> planned,
  Value<String?> planItemId,
  Value<bool> excludeFromBudget,
  Value<int> rowid,
});

final class $$TransactionsTableTableReferences extends BaseReferences<
    _$AppDatabase, $TransactionsTableTable, TransactionsTableData> {
  $$TransactionsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $AccountsTableTable _accountIdTable(_$AppDatabase db) =>
      db.accountsTable.createAlias($_aliasNameGenerator(
          db.transactionsTable.accountId, db.accountsTable.id));

  $$AccountsTableTableProcessedTableManager? get accountId {
    if ($_item.accountId == null) return null;
    final manager = $$AccountsTableTableTableManager($_db, $_db.accountsTable)
        .filter((f) => f.id($_item.accountId!));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CategoriesTableTable _categoryIdTable(_$AppDatabase db) =>
      db.categoriesTable.createAlias($_aliasNameGenerator(
          db.transactionsTable.categoryId, db.categoriesTable.id));

  $$CategoriesTableTableProcessedTableManager? get categoryId {
    if ($_item.categoryId == null) return null;
    final manager =
        $$CategoriesTableTableTableManager($_db, $_db.categoriesTable)
            .filter((f) => f.id($_item.categoryId!));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MerchantsTableTable _merchantIdTable(_$AppDatabase db) =>
      db.merchantsTable.createAlias($_aliasNameGenerator(
          db.transactionsTable.merchantId, db.merchantsTable.id));

  $$MerchantsTableTableProcessedTableManager? get merchantId {
    if ($_item.merchantId == null) return null;
    final manager = $$MerchantsTableTableTableManager($_db, $_db.merchantsTable)
        .filter((f) => f.id($_item.merchantId!));
    final item = $_typedResult.readTableOrNull(_merchantIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PlanItemsTableTable _planItemIdTable(_$AppDatabase db) =>
      db.planItemsTable.createAlias($_aliasNameGenerator(
          db.transactionsTable.planItemId, db.planItemsTable.id));

  $$PlanItemsTableTableProcessedTableManager? get planItemId {
    if ($_item.planItemId == null) return null;
    final manager = $$PlanItemsTableTableTableManager($_db, $_db.planItemsTable)
        .filter((f) => f.id($_item.planItemId!));
    final item = $_typedResult.readTableOrNull(_planItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TransactionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTableTable> {
  $$TransactionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get datetime => $composableBuilder(
      column: $table.datetime, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get tags =>
      $composableBuilder(
          column: $table.tags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<Map<String, dynamic>>,
          List<Map<String, dynamic>>, String>
      get attachments => $composableBuilder(
          column: $table.attachments,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get planned => $composableBuilder(
      column: $table.planned, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get excludeFromBudget => $composableBuilder(
      column: $table.excludeFromBudget,
      builder: (column) => ColumnFilters(column));

  $$AccountsTableTableFilterComposer get accountId {
    final $$AccountsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.accountsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableTableFilterComposer(
              $db: $db,
              $table: $db.accountsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableTableFilterComposer get categoryId {
    final $$CategoriesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableFilterComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MerchantsTableTableFilterComposer get merchantId {
    final $$MerchantsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.merchantId,
        referencedTable: $db.merchantsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MerchantsTableTableFilterComposer(
              $db: $db,
              $table: $db.merchantsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlanItemsTableTableFilterComposer get planItemId {
    final $$PlanItemsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.planItemId,
        referencedTable: $db.planItemsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlanItemsTableTableFilterComposer(
              $db: $db,
              $table: $db.planItemsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTableTable> {
  $$TransactionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get datetime => $composableBuilder(
      column: $table.datetime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attachments => $composableBuilder(
      column: $table.attachments, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get planned => $composableBuilder(
      column: $table.planned, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get excludeFromBudget => $composableBuilder(
      column: $table.excludeFromBudget,
      builder: (column) => ColumnOrderings(column));

  $$AccountsTableTableOrderingComposer get accountId {
    final $$AccountsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.accountsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableTableOrderingComposer(
              $db: $db,
              $table: $db.accountsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableTableOrderingComposer get categoryId {
    final $$CategoriesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableOrderingComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MerchantsTableTableOrderingComposer get merchantId {
    final $$MerchantsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.merchantId,
        referencedTable: $db.merchantsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MerchantsTableTableOrderingComposer(
              $db: $db,
              $table: $db.merchantsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlanItemsTableTableOrderingComposer get planItemId {
    final $$PlanItemsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.planItemId,
        referencedTable: $db.planItemsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlanItemsTableTableOrderingComposer(
              $db: $db,
              $table: $db.planItemsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTableTable> {
  $$TransactionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get datetime =>
      $composableBuilder(column: $table.datetime, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<Map<String, dynamic>>, String>
      get attachments => $composableBuilder(
          column: $table.attachments, builder: (column) => column);

  GeneratedColumn<bool> get planned =>
      $composableBuilder(column: $table.planned, builder: (column) => column);

  GeneratedColumn<bool> get excludeFromBudget => $composableBuilder(
      column: $table.excludeFromBudget, builder: (column) => column);

  $$AccountsTableTableAnnotationComposer get accountId {
    final $$AccountsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.accountsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.accountsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableTableAnnotationComposer get categoryId {
    final $$CategoriesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MerchantsTableTableAnnotationComposer get merchantId {
    final $$MerchantsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.merchantId,
        referencedTable: $db.merchantsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MerchantsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.merchantsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlanItemsTableTableAnnotationComposer get planItemId {
    final $$PlanItemsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.planItemId,
        referencedTable: $db.planItemsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlanItemsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.planItemsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionsTableTable,
    TransactionsTableData,
    $$TransactionsTableTableFilterComposer,
    $$TransactionsTableTableOrderingComposer,
    $$TransactionsTableTableAnnotationComposer,
    $$TransactionsTableTableCreateCompanionBuilder,
    $$TransactionsTableTableUpdateCompanionBuilder,
    (TransactionsTableData, $$TransactionsTableTableReferences),
    TransactionsTableData,
    PrefetchHooks Function(
        {bool accountId, bool categoryId, bool merchantId, bool planItemId})> {
  $$TransactionsTableTableTableManager(
      _$AppDatabase db, $TransactionsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> datetime = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String> accountId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<List<String>> tags = const Value.absent(),
            Value<String?> merchantId = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<List<Map<String, dynamic>>> attachments =
                const Value.absent(),
            Value<bool> planned = const Value.absent(),
            Value<String?> planItemId = const Value.absent(),
            Value<bool> excludeFromBudget = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionsTableCompanion(
            id: id,
            datetime: datetime,
            amount: amount,
            currency: currency,
            accountId: accountId,
            type: type,
            categoryId: categoryId,
            tags: tags,
            merchantId: merchantId,
            note: note,
            attachments: attachments,
            planned: planned,
            planItemId: planItemId,
            excludeFromBudget: excludeFromBudget,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime datetime,
            required double amount,
            required String currency,
            required String accountId,
            required String type,
            Value<String?> categoryId = const Value.absent(),
            required List<String> tags,
            Value<String?> merchantId = const Value.absent(),
            Value<String?> note = const Value.absent(),
            required List<Map<String, dynamic>> attachments,
            Value<bool> planned = const Value.absent(),
            Value<String?> planItemId = const Value.absent(),
            Value<bool> excludeFromBudget = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionsTableCompanion.insert(
            id: id,
            datetime: datetime,
            amount: amount,
            currency: currency,
            accountId: accountId,
            type: type,
            categoryId: categoryId,
            tags: tags,
            merchantId: merchantId,
            note: note,
            attachments: attachments,
            planned: planned,
            planItemId: planItemId,
            excludeFromBudget: excludeFromBudget,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TransactionsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {accountId = false,
              categoryId = false,
              merchantId = false,
              planItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (accountId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.accountId,
                    referencedTable:
                        $$TransactionsTableTableReferences._accountIdTable(db),
                    referencedColumn: $$TransactionsTableTableReferences
                        ._accountIdTable(db)
                        .id,
                  ) as T;
                }
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$TransactionsTableTableReferences._categoryIdTable(db),
                    referencedColumn: $$TransactionsTableTableReferences
                        ._categoryIdTable(db)
                        .id,
                  ) as T;
                }
                if (merchantId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.merchantId,
                    referencedTable:
                        $$TransactionsTableTableReferences._merchantIdTable(db),
                    referencedColumn: $$TransactionsTableTableReferences
                        ._merchantIdTable(db)
                        .id,
                  ) as T;
                }
                if (planItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.planItemId,
                    referencedTable:
                        $$TransactionsTableTableReferences._planItemIdTable(db),
                    referencedColumn: $$TransactionsTableTableReferences
                        ._planItemIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TransactionsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionsTableTable,
    TransactionsTableData,
    $$TransactionsTableTableFilterComposer,
    $$TransactionsTableTableOrderingComposer,
    $$TransactionsTableTableAnnotationComposer,
    $$TransactionsTableTableCreateCompanionBuilder,
    $$TransactionsTableTableUpdateCompanionBuilder,
    (TransactionsTableData, $$TransactionsTableTableReferences),
    TransactionsTableData,
    PrefetchHooks Function(
        {bool accountId, bool categoryId, bool merchantId, bool planItemId})>;
typedef $$BudgetsTableTableCreateCompanionBuilder = BudgetsTableCompanion
    Function({
  required String id,
  required String periodId,
  required String categoryId,
  required double limitAmount,
  required String carryOverRule,
  Value<double?> carryOverPct,
  Value<int> rowid,
});
typedef $$BudgetsTableTableUpdateCompanionBuilder = BudgetsTableCompanion
    Function({
  Value<String> id,
  Value<String> periodId,
  Value<String> categoryId,
  Value<double> limitAmount,
  Value<String> carryOverRule,
  Value<double?> carryOverPct,
  Value<int> rowid,
});

final class $$BudgetsTableTableReferences extends BaseReferences<_$AppDatabase,
    $BudgetsTableTable, BudgetsTableData> {
  $$BudgetsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PaycheckPeriodsTableTable _periodIdTable(_$AppDatabase db) =>
      db.paycheckPeriodsTable.createAlias($_aliasNameGenerator(
          db.budgetsTable.periodId, db.paycheckPeriodsTable.id));

  $$PaycheckPeriodsTableTableProcessedTableManager? get periodId {
    if ($_item.periodId == null) return null;
    final manager =
        $$PaycheckPeriodsTableTableTableManager($_db, $_db.paycheckPeriodsTable)
            .filter((f) => f.id($_item.periodId!));
    final item = $_typedResult.readTableOrNull(_periodIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CategoriesTableTable _categoryIdTable(_$AppDatabase db) =>
      db.categoriesTable.createAlias($_aliasNameGenerator(
          db.budgetsTable.categoryId, db.categoriesTable.id));

  $$CategoriesTableTableProcessedTableManager? get categoryId {
    if ($_item.categoryId == null) return null;
    final manager =
        $$CategoriesTableTableTableManager($_db, $_db.categoriesTable)
            .filter((f) => f.id($_item.categoryId!));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BudgetsTableTableFilterComposer
    extends Composer<_$AppDatabase, $BudgetsTableTable> {
  $$BudgetsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get limitAmount => $composableBuilder(
      column: $table.limitAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get carryOverRule => $composableBuilder(
      column: $table.carryOverRule, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get carryOverPct => $composableBuilder(
      column: $table.carryOverPct, builder: (column) => ColumnFilters(column));

  $$PaycheckPeriodsTableTableFilterComposer get periodId {
    final $$PaycheckPeriodsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.periodId,
        referencedTable: $db.paycheckPeriodsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PaycheckPeriodsTableTableFilterComposer(
              $db: $db,
              $table: $db.paycheckPeriodsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableTableFilterComposer get categoryId {
    final $$CategoriesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableFilterComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BudgetsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BudgetsTableTable> {
  $$BudgetsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get limitAmount => $composableBuilder(
      column: $table.limitAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get carryOverRule => $composableBuilder(
      column: $table.carryOverRule,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get carryOverPct => $composableBuilder(
      column: $table.carryOverPct,
      builder: (column) => ColumnOrderings(column));

  $$PaycheckPeriodsTableTableOrderingComposer get periodId {
    final $$PaycheckPeriodsTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.periodId,
            referencedTable: $db.paycheckPeriodsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PaycheckPeriodsTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.paycheckPeriodsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$CategoriesTableTableOrderingComposer get categoryId {
    final $$CategoriesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableOrderingComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BudgetsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BudgetsTableTable> {
  $$BudgetsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get limitAmount => $composableBuilder(
      column: $table.limitAmount, builder: (column) => column);

  GeneratedColumn<String> get carryOverRule => $composableBuilder(
      column: $table.carryOverRule, builder: (column) => column);

  GeneratedColumn<double> get carryOverPct => $composableBuilder(
      column: $table.carryOverPct, builder: (column) => column);

  $$PaycheckPeriodsTableTableAnnotationComposer get periodId {
    final $$PaycheckPeriodsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.periodId,
            referencedTable: $db.paycheckPeriodsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PaycheckPeriodsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.paycheckPeriodsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$CategoriesTableTableAnnotationComposer get categoryId {
    final $$CategoriesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BudgetsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BudgetsTableTable,
    BudgetsTableData,
    $$BudgetsTableTableFilterComposer,
    $$BudgetsTableTableOrderingComposer,
    $$BudgetsTableTableAnnotationComposer,
    $$BudgetsTableTableCreateCompanionBuilder,
    $$BudgetsTableTableUpdateCompanionBuilder,
    (BudgetsTableData, $$BudgetsTableTableReferences),
    BudgetsTableData,
    PrefetchHooks Function({bool periodId, bool categoryId})> {
  $$BudgetsTableTableTableManager(_$AppDatabase db, $BudgetsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> periodId = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<double> limitAmount = const Value.absent(),
            Value<String> carryOverRule = const Value.absent(),
            Value<double?> carryOverPct = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BudgetsTableCompanion(
            id: id,
            periodId: periodId,
            categoryId: categoryId,
            limitAmount: limitAmount,
            carryOverRule: carryOverRule,
            carryOverPct: carryOverPct,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String periodId,
            required String categoryId,
            required double limitAmount,
            required String carryOverRule,
            Value<double?> carryOverPct = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BudgetsTableCompanion.insert(
            id: id,
            periodId: periodId,
            categoryId: categoryId,
            limitAmount: limitAmount,
            carryOverRule: carryOverRule,
            carryOverPct: carryOverPct,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BudgetsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({periodId = false, categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (periodId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.periodId,
                    referencedTable:
                        $$BudgetsTableTableReferences._periodIdTable(db),
                    referencedColumn:
                        $$BudgetsTableTableReferences._periodIdTable(db).id,
                  ) as T;
                }
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$BudgetsTableTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$BudgetsTableTableReferences._categoryIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BudgetsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BudgetsTableTable,
    BudgetsTableData,
    $$BudgetsTableTableFilterComposer,
    $$BudgetsTableTableOrderingComposer,
    $$BudgetsTableTableAnnotationComposer,
    $$BudgetsTableTableCreateCompanionBuilder,
    $$BudgetsTableTableUpdateCompanionBuilder,
    (BudgetsTableData, $$BudgetsTableTableReferences),
    BudgetsTableData,
    PrefetchHooks Function({bool periodId, bool categoryId})>;
typedef $$GoalsTableTableCreateCompanionBuilder = GoalsTableCompanion Function({
  required String id,
  required String title,
  required double targetAmount,
  required double savedAmount,
  Value<DateTime?> dueDate,
  Value<String?> autoTopUpRule,
  Value<int> rowid,
});
typedef $$GoalsTableTableUpdateCompanionBuilder = GoalsTableCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<double> targetAmount,
  Value<double> savedAmount,
  Value<DateTime?> dueDate,
  Value<String?> autoTopUpRule,
  Value<int> rowid,
});

class $$GoalsTableTableFilterComposer
    extends Composer<_$AppDatabase, $GoalsTableTable> {
  $$GoalsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get targetAmount => $composableBuilder(
      column: $table.targetAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get savedAmount => $composableBuilder(
      column: $table.savedAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get autoTopUpRule => $composableBuilder(
      column: $table.autoTopUpRule, builder: (column) => ColumnFilters(column));
}

class $$GoalsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTableTable> {
  $$GoalsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get targetAmount => $composableBuilder(
      column: $table.targetAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get savedAmount => $composableBuilder(
      column: $table.savedAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get autoTopUpRule => $composableBuilder(
      column: $table.autoTopUpRule,
      builder: (column) => ColumnOrderings(column));
}

class $$GoalsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTableTable> {
  $$GoalsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<double> get targetAmount => $composableBuilder(
      column: $table.targetAmount, builder: (column) => column);

  GeneratedColumn<double> get savedAmount => $composableBuilder(
      column: $table.savedAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<String> get autoTopUpRule => $composableBuilder(
      column: $table.autoTopUpRule, builder: (column) => column);
}

class $$GoalsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GoalsTableTable,
    GoalsTableData,
    $$GoalsTableTableFilterComposer,
    $$GoalsTableTableOrderingComposer,
    $$GoalsTableTableAnnotationComposer,
    $$GoalsTableTableCreateCompanionBuilder,
    $$GoalsTableTableUpdateCompanionBuilder,
    (
      GoalsTableData,
      BaseReferences<_$AppDatabase, $GoalsTableTable, GoalsTableData>
    ),
    GoalsTableData,
    PrefetchHooks Function()> {
  $$GoalsTableTableTableManager(_$AppDatabase db, $GoalsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<double> targetAmount = const Value.absent(),
            Value<double> savedAmount = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<String?> autoTopUpRule = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalsTableCompanion(
            id: id,
            title: title,
            targetAmount: targetAmount,
            savedAmount: savedAmount,
            dueDate: dueDate,
            autoTopUpRule: autoTopUpRule,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required double targetAmount,
            required double savedAmount,
            Value<DateTime?> dueDate = const Value.absent(),
            Value<String?> autoTopUpRule = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalsTableCompanion.insert(
            id: id,
            title: title,
            targetAmount: targetAmount,
            savedAmount: savedAmount,
            dueDate: dueDate,
            autoTopUpRule: autoTopUpRule,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GoalsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GoalsTableTable,
    GoalsTableData,
    $$GoalsTableTableFilterComposer,
    $$GoalsTableTableOrderingComposer,
    $$GoalsTableTableAnnotationComposer,
    $$GoalsTableTableCreateCompanionBuilder,
    $$GoalsTableTableUpdateCompanionBuilder,
    (
      GoalsTableData,
      BaseReferences<_$AppDatabase, $GoalsTableTable, GoalsTableData>
    ),
    GoalsTableData,
    PrefetchHooks Function()>;
typedef $$SubscriptionsTableTableCreateCompanionBuilder
    = SubscriptionsTableCompanion Function({
  required String id,
  required String provider,
  required double amount,
  required String currency,
  required String cadence,
  required DateTime nextCharge,
  Value<String?> categoryId,
  required List<String> tags,
  Value<bool> active,
  Value<bool> pause,
  Value<int> rowid,
});
typedef $$SubscriptionsTableTableUpdateCompanionBuilder
    = SubscriptionsTableCompanion Function({
  Value<String> id,
  Value<String> provider,
  Value<double> amount,
  Value<String> currency,
  Value<String> cadence,
  Value<DateTime> nextCharge,
  Value<String?> categoryId,
  Value<List<String>> tags,
  Value<bool> active,
  Value<bool> pause,
  Value<int> rowid,
});

final class $$SubscriptionsTableTableReferences extends BaseReferences<
    _$AppDatabase, $SubscriptionsTableTable, SubscriptionsTableData> {
  $$SubscriptionsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTableTable _categoryIdTable(_$AppDatabase db) =>
      db.categoriesTable.createAlias($_aliasNameGenerator(
          db.subscriptionsTable.categoryId, db.categoriesTable.id));

  $$CategoriesTableTableProcessedTableManager? get categoryId {
    if ($_item.categoryId == null) return null;
    final manager =
        $$CategoriesTableTableTableManager($_db, $_db.categoriesTable)
            .filter((f) => f.id($_item.categoryId!));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$SubscriptionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SubscriptionsTableTable> {
  $$SubscriptionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get provider => $composableBuilder(
      column: $table.provider, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cadence => $composableBuilder(
      column: $table.cadence, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextCharge => $composableBuilder(
      column: $table.nextCharge, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get tags =>
      $composableBuilder(
          column: $table.tags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get pause => $composableBuilder(
      column: $table.pause, builder: (column) => ColumnFilters(column));

  $$CategoriesTableTableFilterComposer get categoryId {
    final $$CategoriesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableFilterComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SubscriptionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SubscriptionsTableTable> {
  $$SubscriptionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get provider => $composableBuilder(
      column: $table.provider, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cadence => $composableBuilder(
      column: $table.cadence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextCharge => $composableBuilder(
      column: $table.nextCharge, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get pause => $composableBuilder(
      column: $table.pause, builder: (column) => ColumnOrderings(column));

  $$CategoriesTableTableOrderingComposer get categoryId {
    final $$CategoriesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableOrderingComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SubscriptionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubscriptionsTableTable> {
  $$SubscriptionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get provider =>
      $composableBuilder(column: $table.provider, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get cadence =>
      $composableBuilder(column: $table.cadence, builder: (column) => column);

  GeneratedColumn<DateTime> get nextCharge => $composableBuilder(
      column: $table.nextCharge, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<bool> get pause =>
      $composableBuilder(column: $table.pause, builder: (column) => column);

  $$CategoriesTableTableAnnotationComposer get categoryId {
    final $$CategoriesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.categoriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SubscriptionsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubscriptionsTableTable,
    SubscriptionsTableData,
    $$SubscriptionsTableTableFilterComposer,
    $$SubscriptionsTableTableOrderingComposer,
    $$SubscriptionsTableTableAnnotationComposer,
    $$SubscriptionsTableTableCreateCompanionBuilder,
    $$SubscriptionsTableTableUpdateCompanionBuilder,
    (SubscriptionsTableData, $$SubscriptionsTableTableReferences),
    SubscriptionsTableData,
    PrefetchHooks Function({bool categoryId})> {
  $$SubscriptionsTableTableTableManager(
      _$AppDatabase db, $SubscriptionsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubscriptionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubscriptionsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubscriptionsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> provider = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String> cadence = const Value.absent(),
            Value<DateTime> nextCharge = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<List<String>> tags = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<bool> pause = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SubscriptionsTableCompanion(
            id: id,
            provider: provider,
            amount: amount,
            currency: currency,
            cadence: cadence,
            nextCharge: nextCharge,
            categoryId: categoryId,
            tags: tags,
            active: active,
            pause: pause,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String provider,
            required double amount,
            required String currency,
            required String cadence,
            required DateTime nextCharge,
            Value<String?> categoryId = const Value.absent(),
            required List<String> tags,
            Value<bool> active = const Value.absent(),
            Value<bool> pause = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SubscriptionsTableCompanion.insert(
            id: id,
            provider: provider,
            amount: amount,
            currency: currency,
            cadence: cadence,
            nextCharge: nextCharge,
            categoryId: categoryId,
            tags: tags,
            active: active,
            pause: pause,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SubscriptionsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable: $$SubscriptionsTableTableReferences
                        ._categoryIdTable(db),
                    referencedColumn: $$SubscriptionsTableTableReferences
                        ._categoryIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$SubscriptionsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SubscriptionsTableTable,
    SubscriptionsTableData,
    $$SubscriptionsTableTableFilterComposer,
    $$SubscriptionsTableTableOrderingComposer,
    $$SubscriptionsTableTableAnnotationComposer,
    $$SubscriptionsTableTableCreateCompanionBuilder,
    $$SubscriptionsTableTableUpdateCompanionBuilder,
    (SubscriptionsTableData, $$SubscriptionsTableTableReferences),
    SubscriptionsTableData,
    PrefetchHooks Function({bool categoryId})>;
typedef $$RulesTableTableCreateCompanionBuilder = RulesTableCompanion Function({
  required String id,
  required String condition,
  required String action,
  Value<int> priority,
  Value<int> rowid,
});
typedef $$RulesTableTableUpdateCompanionBuilder = RulesTableCompanion Function({
  Value<String> id,
  Value<String> condition,
  Value<String> action,
  Value<int> priority,
  Value<int> rowid,
});

class $$RulesTableTableFilterComposer
    extends Composer<_$AppDatabase, $RulesTableTable> {
  $$RulesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get condition => $composableBuilder(
      column: $table.condition, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));
}

class $$RulesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RulesTableTable> {
  $$RulesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get condition => $composableBuilder(
      column: $table.condition, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));
}

class $$RulesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RulesTableTable> {
  $$RulesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);
}

class $$RulesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RulesTableTable,
    RulesTableData,
    $$RulesTableTableFilterComposer,
    $$RulesTableTableOrderingComposer,
    $$RulesTableTableAnnotationComposer,
    $$RulesTableTableCreateCompanionBuilder,
    $$RulesTableTableUpdateCompanionBuilder,
    (
      RulesTableData,
      BaseReferences<_$AppDatabase, $RulesTableTable, RulesTableData>
    ),
    RulesTableData,
    PrefetchHooks Function()> {
  $$RulesTableTableTableManager(_$AppDatabase db, $RulesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RulesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RulesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RulesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> condition = const Value.absent(),
            Value<String> action = const Value.absent(),
            Value<int> priority = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RulesTableCompanion(
            id: id,
            condition: condition,
            action: action,
            priority: priority,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String condition,
            required String action,
            Value<int> priority = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RulesTableCompanion.insert(
            id: id,
            condition: condition,
            action: action,
            priority: priority,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RulesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RulesTableTable,
    RulesTableData,
    $$RulesTableTableFilterComposer,
    $$RulesTableTableOrderingComposer,
    $$RulesTableTableAnnotationComposer,
    $$RulesTableTableCreateCompanionBuilder,
    $$RulesTableTableUpdateCompanionBuilder,
    (
      RulesTableData,
      BaseReferences<_$AppDatabase, $RulesTableTable, RulesTableData>
    ),
    RulesTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AccountsTableTableTableManager get accountsTable =>
      $$AccountsTableTableTableManager(_db, _db.accountsTable);
  $$PaycheckPeriodsTableTableTableManager get paycheckPeriodsTable =>
      $$PaycheckPeriodsTableTableTableManager(_db, _db.paycheckPeriodsTable);
  $$CategoriesTableTableTableManager get categoriesTable =>
      $$CategoriesTableTableTableManager(_db, _db.categoriesTable);
  $$TagsTableTableTableManager get tagsTable =>
      $$TagsTableTableTableManager(_db, _db.tagsTable);
  $$MerchantsTableTableTableManager get merchantsTable =>
      $$MerchantsTableTableTableManager(_db, _db.merchantsTable);
  $$PlanItemsTableTableTableManager get planItemsTable =>
      $$PlanItemsTableTableTableManager(_db, _db.planItemsTable);
  $$TransactionsTableTableTableManager get transactionsTable =>
      $$TransactionsTableTableTableManager(_db, _db.transactionsTable);
  $$BudgetsTableTableTableManager get budgetsTable =>
      $$BudgetsTableTableTableManager(_db, _db.budgetsTable);
  $$GoalsTableTableTableManager get goalsTable =>
      $$GoalsTableTableTableManager(_db, _db.goalsTable);
  $$SubscriptionsTableTableTableManager get subscriptionsTable =>
      $$SubscriptionsTableTableTableManager(_db, _db.subscriptionsTable);
  $$RulesTableTableTableManager get rulesTable =>
      $$RulesTableTableTableManager(_db, _db.rulesTable);
}
