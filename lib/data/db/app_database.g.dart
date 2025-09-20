// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
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
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('RUB'));
  static const VerificationMeta _openingBalanceMeta =
      const VerificationMeta('openingBalance');
  @override
  late final GeneratedColumn<int> openingBalance = GeneratedColumn<int>(
      'opening_balance', aliasedName, false,
      type: DriftSqlType.int,
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
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        type,
        currency,
        openingBalance,
        archived,
        createdAt,
        updatedAt
      ];
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
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
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
      openingBalance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}opening_balance'])!,
      archived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}archived'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
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
  final int openingBalance;
  final bool archived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AccountsTableData(
      {required this.id,
      required this.name,
      required this.type,
      required this.currency,
      required this.openingBalance,
      required this.archived,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['currency'] = Variable<String>(currency);
    map['opening_balance'] = Variable<int>(openingBalance);
    map['archived'] = Variable<bool>(archived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
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
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
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
      openingBalance: serializer.fromJson<int>(json['openingBalance']),
      archived: serializer.fromJson<bool>(json['archived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
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
      'openingBalance': serializer.toJson<int>(openingBalance),
      'archived': serializer.toJson<bool>(archived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AccountsTableData copyWith(
          {String? id,
          String? name,
          String? type,
          String? currency,
          int? openingBalance,
          bool? archived,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      AccountsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        currency: currency ?? this.currency,
        openingBalance: openingBalance ?? this.openingBalance,
        archived: archived ?? this.archived,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
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
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
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
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, type, currency, openingBalance, archived, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.currency == this.currency &&
          other.openingBalance == this.openingBalance &&
          other.archived == this.archived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AccountsTableCompanion extends UpdateCompanion<AccountsTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<String> currency;
  final Value<int> openingBalance;
  final Value<bool> archived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AccountsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.currency = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.archived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountsTableCompanion.insert({
    required String id,
    required String name,
    required String type,
    this.currency = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.archived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        type = Value(type);
  static Insertable<AccountsTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? currency,
    Expression<int>? openingBalance,
    Expression<bool>? archived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (currency != null) 'currency': currency,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (archived != null) 'archived': archived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? type,
      Value<String>? currency,
      Value<int>? openingBalance,
      Value<bool>? archived,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return AccountsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      currency: currency ?? this.currency,
      openingBalance: openingBalance ?? this.openingBalance,
      archived: archived ?? this.archived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
      map['opening_balance'] = Variable<int>(openingBalance.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
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
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
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
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
      'kind', aliasedName, false,
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
      'color_hex', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _hiddenMeta = const VerificationMeta('hidden');
  @override
  late final GeneratedColumn<bool> hidden = GeneratedColumn<bool>(
      'hidden', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("hidden" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
      'sort', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        kind,
        emoji,
        parentId,
        colorHex,
        hidden,
        sort,
        createdAt,
        updatedAt
      ];
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
    if (data.containsKey('kind')) {
      context.handle(
          _kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    } else if (isInserting) {
      context.missing(_kindMeta);
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
    }
    if (data.containsKey('hidden')) {
      context.handle(_hiddenMeta,
          hidden.isAcceptableOrUnknown(data['hidden']!, _hiddenMeta));
    }
    if (data.containsKey('sort')) {
      context.handle(
          _sortMeta, sort.isAcceptableOrUnknown(data['sort']!, _sortMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
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
      kind: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kind'])!,
      emoji: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}emoji'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_id']),
      colorHex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_hex']),
      hidden: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}hidden'])!,
      sort: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
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
  final String kind;
  final String emoji;
  final String? parentId;
  final String? colorHex;
  final bool hidden;
  final int sort;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CategoriesTableData(
      {required this.id,
      required this.name,
      required this.kind,
      required this.emoji,
      this.parentId,
      this.colorHex,
      required this.hidden,
      required this.sort,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['kind'] = Variable<String>(kind);
    map['emoji'] = Variable<String>(emoji);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    if (!nullToAbsent || colorHex != null) {
      map['color_hex'] = Variable<String>(colorHex);
    }
    map['hidden'] = Variable<bool>(hidden);
    map['sort'] = Variable<int>(sort);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CategoriesTableCompanion toCompanion(bool nullToAbsent) {
    return CategoriesTableCompanion(
      id: Value(id),
      name: Value(name),
      kind: Value(kind),
      emoji: Value(emoji),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      colorHex: colorHex == null && nullToAbsent
          ? const Value.absent()
          : Value(colorHex),
      hidden: Value(hidden),
      sort: Value(sort),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CategoriesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoriesTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      kind: serializer.fromJson<String>(json['kind']),
      emoji: serializer.fromJson<String>(json['emoji']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      colorHex: serializer.fromJson<String?>(json['colorHex']),
      hidden: serializer.fromJson<bool>(json['hidden']),
      sort: serializer.fromJson<int>(json['sort']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'kind': serializer.toJson<String>(kind),
      'emoji': serializer.toJson<String>(emoji),
      'parentId': serializer.toJson<String?>(parentId),
      'colorHex': serializer.toJson<String?>(colorHex),
      'hidden': serializer.toJson<bool>(hidden),
      'sort': serializer.toJson<int>(sort),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CategoriesTableData copyWith(
          {String? id,
          String? name,
          String? kind,
          String? emoji,
          Value<String?> parentId = const Value.absent(),
          Value<String?> colorHex = const Value.absent(),
          bool? hidden,
          int? sort,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      CategoriesTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        kind: kind ?? this.kind,
        emoji: emoji ?? this.emoji,
        parentId: parentId.present ? parentId.value : this.parentId,
        colorHex: colorHex.present ? colorHex.value : this.colorHex,
        hidden: hidden ?? this.hidden,
        sort: sort ?? this.sort,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CategoriesTableData copyWithCompanion(CategoriesTableCompanion data) {
    return CategoriesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      kind: data.kind.present ? data.kind.value : this.kind,
      emoji: data.emoji.present ? data.emoji.value : this.emoji,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      hidden: data.hidden.present ? data.hidden.value : this.hidden,
      sort: data.sort.present ? data.sort.value : this.sort,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('kind: $kind, ')
          ..write('emoji: $emoji, ')
          ..write('parentId: $parentId, ')
          ..write('colorHex: $colorHex, ')
          ..write('hidden: $hidden, ')
          ..write('sort: $sort, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, kind, emoji, parentId, colorHex,
      hidden, sort, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoriesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.kind == this.kind &&
          other.emoji == this.emoji &&
          other.parentId == this.parentId &&
          other.colorHex == this.colorHex &&
          other.hidden == this.hidden &&
          other.sort == this.sort &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CategoriesTableCompanion extends UpdateCompanion<CategoriesTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> kind;
  final Value<String> emoji;
  final Value<String?> parentId;
  final Value<String?> colorHex;
  final Value<bool> hidden;
  final Value<int> sort;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CategoriesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.kind = const Value.absent(),
    this.emoji = const Value.absent(),
    this.parentId = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.hidden = const Value.absent(),
    this.sort = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesTableCompanion.insert({
    required String id,
    required String name,
    required String kind,
    required String emoji,
    this.parentId = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.hidden = const Value.absent(),
    this.sort = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        kind = Value(kind),
        emoji = Value(emoji);
  static Insertable<CategoriesTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? kind,
    Expression<String>? emoji,
    Expression<String>? parentId,
    Expression<String>? colorHex,
    Expression<bool>? hidden,
    Expression<int>? sort,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (kind != null) 'kind': kind,
      if (emoji != null) 'emoji': emoji,
      if (parentId != null) 'parent_id': parentId,
      if (colorHex != null) 'color_hex': colorHex,
      if (hidden != null) 'hidden': hidden,
      if (sort != null) 'sort': sort,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? kind,
      Value<String>? emoji,
      Value<String?>? parentId,
      Value<String?>? colorHex,
      Value<bool>? hidden,
      Value<int>? sort,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return CategoriesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      kind: kind ?? this.kind,
      emoji: emoji ?? this.emoji,
      parentId: parentId ?? this.parentId,
      colorHex: colorHex ?? this.colorHex,
      hidden: hidden ?? this.hidden,
      sort: sort ?? this.sort,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
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
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
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
          ..write('kind: $kind, ')
          ..write('emoji: $emoji, ')
          ..write('parentId: $parentId, ')
          ..write('colorHex: $colorHex, ')
          ..write('hidden: $hidden, ')
          ..write('sort: $sort, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
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
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, startDate, endDate, kind, closed, createdAt, updatedAt];
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
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
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
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
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
  final DateTime createdAt;
  final DateTime updatedAt;
  const PaycheckPeriodsTableData(
      {required this.id,
      required this.title,
      required this.startDate,
      required this.endDate,
      required this.kind,
      required this.closed,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['kind'] = Variable<String>(kind);
    map['closed'] = Variable<bool>(closed);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
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
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
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
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
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
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PaycheckPeriodsTableData copyWith(
          {String? id,
          String? title,
          DateTime? startDate,
          DateTime? endDate,
          String? kind,
          bool? closed,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      PaycheckPeriodsTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        kind: kind ?? this.kind,
        closed: closed ?? this.closed,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
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
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
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
          ..write('closed: $closed, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, startDate, endDate, kind, closed, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaycheckPeriodsTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.kind == this.kind &&
          other.closed == this.closed &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PaycheckPeriodsTableCompanion
    extends UpdateCompanion<PaycheckPeriodsTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<String> kind;
  final Value<bool> closed;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PaycheckPeriodsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.kind = const Value.absent(),
    this.closed = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaycheckPeriodsTableCompanion.insert({
    required String id,
    required String title,
    required DateTime startDate,
    required DateTime endDate,
    required String kind,
    this.closed = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
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
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (kind != null) 'kind': kind,
      if (closed != null) 'closed': closed,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
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
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return PaycheckPeriodsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      kind: kind ?? this.kind,
      closed: closed ?? this.closed,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
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
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CriticalityTableTable extends CriticalityTable
    with TableInfo<$CriticalityTableTable, CriticalityTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CriticalityTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _iconEmojiMeta =
      const VerificationMeta('iconEmoji');
  @override
  late final GeneratedColumn<String> iconEmoji = GeneratedColumn<String>(
      'icon_emoji', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
      'sort', aliasedName, false,
      type: DriftSqlType.int,
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
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, colorHex, iconEmoji, sort, archived, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'criticality_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CriticalityTableData> instance,
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
    if (data.containsKey('icon_emoji')) {
      context.handle(_iconEmojiMeta,
          iconEmoji.isAcceptableOrUnknown(data['icon_emoji']!, _iconEmojiMeta));
    }
    if (data.containsKey('sort')) {
      context.handle(
          _sortMeta, sort.isAcceptableOrUnknown(data['sort']!, _sortMeta));
    }
    if (data.containsKey('archived')) {
      context.handle(_archivedMeta,
          archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CriticalityTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CriticalityTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      colorHex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_hex']),
      iconEmoji: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_emoji']),
      sort: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort'])!,
      archived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}archived'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CriticalityTableTable createAlias(String alias) {
    return $CriticalityTableTable(attachedDatabase, alias);
  }
}

class CriticalityTableData extends DataClass
    implements Insertable<CriticalityTableData> {
  final String id;
  final String name;
  final String? colorHex;
  final String? iconEmoji;
  final int sort;
  final bool archived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CriticalityTableData(
      {required this.id,
      required this.name,
      this.colorHex,
      this.iconEmoji,
      required this.sort,
      required this.archived,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || colorHex != null) {
      map['color_hex'] = Variable<String>(colorHex);
    }
    if (!nullToAbsent || iconEmoji != null) {
      map['icon_emoji'] = Variable<String>(iconEmoji);
    }
    map['sort'] = Variable<int>(sort);
    map['archived'] = Variable<bool>(archived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CriticalityTableCompanion toCompanion(bool nullToAbsent) {
    return CriticalityTableCompanion(
      id: Value(id),
      name: Value(name),
      colorHex: colorHex == null && nullToAbsent
          ? const Value.absent()
          : Value(colorHex),
      iconEmoji: iconEmoji == null && nullToAbsent
          ? const Value.absent()
          : Value(iconEmoji),
      sort: Value(sort),
      archived: Value(archived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CriticalityTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CriticalityTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      colorHex: serializer.fromJson<String?>(json['colorHex']),
      iconEmoji: serializer.fromJson<String?>(json['iconEmoji']),
      sort: serializer.fromJson<int>(json['sort']),
      archived: serializer.fromJson<bool>(json['archived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'colorHex': serializer.toJson<String?>(colorHex),
      'iconEmoji': serializer.toJson<String?>(iconEmoji),
      'sort': serializer.toJson<int>(sort),
      'archived': serializer.toJson<bool>(archived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CriticalityTableData copyWith(
          {String? id,
          String? name,
          Value<String?> colorHex = const Value.absent(),
          Value<String?> iconEmoji = const Value.absent(),
          int? sort,
          bool? archived,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      CriticalityTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        colorHex: colorHex.present ? colorHex.value : this.colorHex,
        iconEmoji: iconEmoji.present ? iconEmoji.value : this.iconEmoji,
        sort: sort ?? this.sort,
        archived: archived ?? this.archived,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CriticalityTableData copyWithCompanion(CriticalityTableCompanion data) {
    return CriticalityTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      iconEmoji: data.iconEmoji.present ? data.iconEmoji.value : this.iconEmoji,
      sort: data.sort.present ? data.sort.value : this.sort,
      archived: data.archived.present ? data.archived.value : this.archived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CriticalityTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
          ..write('iconEmoji: $iconEmoji, ')
          ..write('sort: $sort, ')
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, colorHex, iconEmoji, sort, archived, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CriticalityTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.colorHex == this.colorHex &&
          other.iconEmoji == this.iconEmoji &&
          other.sort == this.sort &&
          other.archived == this.archived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CriticalityTableCompanion extends UpdateCompanion<CriticalityTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> colorHex;
  final Value<String?> iconEmoji;
  final Value<int> sort;
  final Value<bool> archived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CriticalityTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.iconEmoji = const Value.absent(),
    this.sort = const Value.absent(),
    this.archived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CriticalityTableCompanion.insert({
    required String id,
    required String name,
    this.colorHex = const Value.absent(),
    this.iconEmoji = const Value.absent(),
    this.sort = const Value.absent(),
    this.archived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<CriticalityTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? colorHex,
    Expression<String>? iconEmoji,
    Expression<int>? sort,
    Expression<bool>? archived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (colorHex != null) 'color_hex': colorHex,
      if (iconEmoji != null) 'icon_emoji': iconEmoji,
      if (sort != null) 'sort': sort,
      if (archived != null) 'archived': archived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CriticalityTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? colorHex,
      Value<String?>? iconEmoji,
      Value<int>? sort,
      Value<bool>? archived,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return CriticalityTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
      iconEmoji: iconEmoji ?? this.iconEmoji,
      sort: sort ?? this.sort,
      archived: archived ?? this.archived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (iconEmoji.present) {
      map['icon_emoji'] = Variable<String>(iconEmoji.value);
    }
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CriticalityTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
          ..write('iconEmoji: $iconEmoji, ')
          ..write('sort: $sort, ')
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
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
  late final GeneratedColumn<int> expectedAmount = GeneratedColumn<int>(
      'expected_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories_table (id)'));
  static const VerificationMeta _periodIdMeta =
      const VerificationMeta('periodId');
  @override
  late final GeneratedColumn<String> periodId = GeneratedColumn<String>(
      'period_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES paycheck_periods_table (id)'));
  static const VerificationMeta _deadlineMeta =
      const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
      'deadline', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
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
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('fixed'));
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
      'done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("done" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _criticalityIdMeta =
      const VerificationMeta('criticalityId');
  @override
  late final GeneratedColumn<String> criticalityId = GeneratedColumn<String>(
      'criticality_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES criticality_table (id)'));
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        expectedAmount,
        categoryId,
        periodId,
        deadline,
        priority,
        flex,
        done,
        criticalityId,
        note,
        createdAt,
        updatedAt
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
    if (data.containsKey('period_id')) {
      context.handle(_periodIdMeta,
          periodId.isAcceptableOrUnknown(data['period_id']!, _periodIdMeta));
    } else if (isInserting) {
      context.missing(_periodIdMeta);
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('flex')) {
      context.handle(
          _flexMeta, flex.isAcceptableOrUnknown(data['flex']!, _flexMeta));
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    }
    if (data.containsKey('criticality_id')) {
      context.handle(
          _criticalityIdMeta,
          criticalityId.isAcceptableOrUnknown(
              data['criticality_id']!, _criticalityIdMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
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
      expectedAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}expected_amount'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id']),
      periodId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}period_id'])!,
      deadline: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline']),
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!,
      flex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}flex'])!,
      done: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}done'])!,
      criticalityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}criticality_id']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PlanItemsTableTable createAlias(String alias) {
    return $PlanItemsTableTable(attachedDatabase, alias);
  }
}

class PlanItemsTableData extends DataClass
    implements Insertable<PlanItemsTableData> {
  final String id;
  final String title;
  final int expectedAmount;
  final String? categoryId;
  final String periodId;
  final DateTime? deadline;
  final int priority;
  final String flex;
  final bool done;
  final String? criticalityId;
  final String? note;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PlanItemsTableData(
      {required this.id,
      required this.title,
      required this.expectedAmount,
      this.categoryId,
      required this.periodId,
      this.deadline,
      required this.priority,
      required this.flex,
      required this.done,
      this.criticalityId,
      this.note,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['expected_amount'] = Variable<int>(expectedAmount);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    map['period_id'] = Variable<String>(periodId);
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    map['priority'] = Variable<int>(priority);
    map['flex'] = Variable<String>(flex);
    map['done'] = Variable<bool>(done);
    if (!nullToAbsent || criticalityId != null) {
      map['criticality_id'] = Variable<String>(criticalityId);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
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
      periodId: Value(periodId),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      priority: Value(priority),
      flex: Value(flex),
      done: Value(done),
      criticalityId: criticalityId == null && nullToAbsent
          ? const Value.absent()
          : Value(criticalityId),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PlanItemsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanItemsTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      expectedAmount: serializer.fromJson<int>(json['expectedAmount']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      periodId: serializer.fromJson<String>(json['periodId']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      priority: serializer.fromJson<int>(json['priority']),
      flex: serializer.fromJson<String>(json['flex']),
      done: serializer.fromJson<bool>(json['done']),
      criticalityId: serializer.fromJson<String?>(json['criticalityId']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'expectedAmount': serializer.toJson<int>(expectedAmount),
      'categoryId': serializer.toJson<String?>(categoryId),
      'periodId': serializer.toJson<String>(periodId),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'priority': serializer.toJson<int>(priority),
      'flex': serializer.toJson<String>(flex),
      'done': serializer.toJson<bool>(done),
      'criticalityId': serializer.toJson<String?>(criticalityId),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PlanItemsTableData copyWith(
          {String? id,
          String? title,
          int? expectedAmount,
          Value<String?> categoryId = const Value.absent(),
          String? periodId,
          Value<DateTime?> deadline = const Value.absent(),
          int? priority,
          String? flex,
          bool? done,
          Value<String?> criticalityId = const Value.absent(),
          Value<String?> note = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      PlanItemsTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        expectedAmount: expectedAmount ?? this.expectedAmount,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        periodId: periodId ?? this.periodId,
        deadline: deadline.present ? deadline.value : this.deadline,
        priority: priority ?? this.priority,
        flex: flex ?? this.flex,
        done: done ?? this.done,
        criticalityId:
            criticalityId.present ? criticalityId.value : this.criticalityId,
        note: note.present ? note.value : this.note,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
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
      periodId: data.periodId.present ? data.periodId.value : this.periodId,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      priority: data.priority.present ? data.priority.value : this.priority,
      flex: data.flex.present ? data.flex.value : this.flex,
      done: data.done.present ? data.done.value : this.done,
      criticalityId: data.criticalityId.present
          ? data.criticalityId.value
          : this.criticalityId,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanItemsTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('expectedAmount: $expectedAmount, ')
          ..write('categoryId: $categoryId, ')
          ..write('periodId: $periodId, ')
          ..write('deadline: $deadline, ')
          ..write('priority: $priority, ')
          ..write('flex: $flex, ')
          ..write('done: $done, ')
          ..write('criticalityId: $criticalityId, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      expectedAmount,
      categoryId,
      periodId,
      deadline,
      priority,
      flex,
      done,
      criticalityId,
      note,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanItemsTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.expectedAmount == this.expectedAmount &&
          other.categoryId == this.categoryId &&
          other.periodId == this.periodId &&
          other.deadline == this.deadline &&
          other.priority == this.priority &&
          other.flex == this.flex &&
          other.done == this.done &&
          other.criticalityId == this.criticalityId &&
          other.note == this.note &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PlanItemsTableCompanion extends UpdateCompanion<PlanItemsTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> expectedAmount;
  final Value<String?> categoryId;
  final Value<String> periodId;
  final Value<DateTime?> deadline;
  final Value<int> priority;
  final Value<String> flex;
  final Value<bool> done;
  final Value<String?> criticalityId;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PlanItemsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.expectedAmount = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.periodId = const Value.absent(),
    this.deadline = const Value.absent(),
    this.priority = const Value.absent(),
    this.flex = const Value.absent(),
    this.done = const Value.absent(),
    this.criticalityId = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlanItemsTableCompanion.insert({
    required String id,
    required String title,
    required int expectedAmount,
    this.categoryId = const Value.absent(),
    required String periodId,
    this.deadline = const Value.absent(),
    this.priority = const Value.absent(),
    this.flex = const Value.absent(),
    this.done = const Value.absent(),
    this.criticalityId = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        expectedAmount = Value(expectedAmount),
        periodId = Value(periodId);
  static Insertable<PlanItemsTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? expectedAmount,
    Expression<String>? categoryId,
    Expression<String>? periodId,
    Expression<DateTime>? deadline,
    Expression<int>? priority,
    Expression<String>? flex,
    Expression<bool>? done,
    Expression<String>? criticalityId,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (expectedAmount != null) 'expected_amount': expectedAmount,
      if (categoryId != null) 'category_id': categoryId,
      if (periodId != null) 'period_id': periodId,
      if (deadline != null) 'deadline': deadline,
      if (priority != null) 'priority': priority,
      if (flex != null) 'flex': flex,
      if (done != null) 'done': done,
      if (criticalityId != null) 'criticality_id': criticalityId,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlanItemsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<int>? expectedAmount,
      Value<String?>? categoryId,
      Value<String>? periodId,
      Value<DateTime?>? deadline,
      Value<int>? priority,
      Value<String>? flex,
      Value<bool>? done,
      Value<String?>? criticalityId,
      Value<String?>? note,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return PlanItemsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      expectedAmount: expectedAmount ?? this.expectedAmount,
      categoryId: categoryId ?? this.categoryId,
      periodId: periodId ?? this.periodId,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
      flex: flex ?? this.flex,
      done: done ?? this.done,
      criticalityId: criticalityId ?? this.criticalityId,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
      map['expected_amount'] = Variable<int>(expectedAmount.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (periodId.present) {
      map['period_id'] = Variable<String>(periodId.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
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
    if (criticalityId.present) {
      map['criticality_id'] = Variable<String>(criticalityId.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
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
          ..write('periodId: $periodId, ')
          ..write('deadline: $deadline, ')
          ..write('priority: $priority, ')
          ..write('flex: $flex, ')
          ..write('done: $done, ')
          ..write('criticalityId: $criticalityId, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
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
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  static const VerificationMeta _planItemIdMeta =
      const VerificationMeta('planItemId');
  @override
  late final GeneratedColumn<String> planItemId = GeneratedColumn<String>(
      'plan_item_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES plan_items_table (id)'));
  static const VerificationMeta _criticalityIdMeta =
      const VerificationMeta('criticalityId');
  @override
  late final GeneratedColumn<String> criticalityId = GeneratedColumn<String>(
      'criticality_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES criticality_table (id)'));
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _attachmentsMeta =
      const VerificationMeta('attachments');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      attachments = GeneratedColumn<String>('attachments', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $TransactionsTableTable.$converterattachments);
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
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        datetime,
        amount,
        currency,
        accountId,
        type,
        categoryId,
        planItemId,
        criticalityId,
        note,
        attachments,
        excludeFromBudget,
        createdAt,
        updatedAt
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
    if (data.containsKey('plan_item_id')) {
      context.handle(
          _planItemIdMeta,
          planItemId.isAcceptableOrUnknown(
              data['plan_item_id']!, _planItemIdMeta));
    }
    if (data.containsKey('criticality_id')) {
      context.handle(
          _criticalityIdMeta,
          criticalityId.isAcceptableOrUnknown(
              data['criticality_id']!, _criticalityIdMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    context.handle(_attachmentsMeta, const VerificationResult.success());
    if (data.containsKey('exclude_from_budget')) {
      context.handle(
          _excludeFromBudgetMeta,
          excludeFromBudget.isAcceptableOrUnknown(
              data['exclude_from_budget']!, _excludeFromBudgetMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
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
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id']),
      planItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_item_id']),
      criticalityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}criticality_id']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      attachments: $TransactionsTableTable.$converterattachments.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}attachments'])!),
      excludeFromBudget: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}exclude_from_budget'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TransactionsTableTable createAlias(String alias) {
    return $TransactionsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterattachments =
      const StringListConverter();
}

class TransactionsTableData extends DataClass
    implements Insertable<TransactionsTableData> {
  final String id;
  final DateTime datetime;
  final int amount;
  final String currency;
  final String accountId;
  final String type;
  final String? categoryId;
  final String? planItemId;
  final String? criticalityId;
  final String? note;
  final List<String> attachments;
  final bool excludeFromBudget;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TransactionsTableData(
      {required this.id,
      required this.datetime,
      required this.amount,
      required this.currency,
      required this.accountId,
      required this.type,
      this.categoryId,
      this.planItemId,
      this.criticalityId,
      this.note,
      required this.attachments,
      required this.excludeFromBudget,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['datetime'] = Variable<DateTime>(datetime);
    map['amount'] = Variable<int>(amount);
    map['currency'] = Variable<String>(currency);
    map['account_id'] = Variable<String>(accountId);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    if (!nullToAbsent || planItemId != null) {
      map['plan_item_id'] = Variable<String>(planItemId);
    }
    if (!nullToAbsent || criticalityId != null) {
      map['criticality_id'] = Variable<String>(criticalityId);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    {
      map['attachments'] = Variable<String>(
          $TransactionsTableTable.$converterattachments.toSql(attachments));
    }
    map['exclude_from_budget'] = Variable<bool>(excludeFromBudget);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
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
      planItemId: planItemId == null && nullToAbsent
          ? const Value.absent()
          : Value(planItemId),
      criticalityId: criticalityId == null && nullToAbsent
          ? const Value.absent()
          : Value(criticalityId),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      attachments: Value(attachments),
      excludeFromBudget: Value(excludeFromBudget),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TransactionsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionsTableData(
      id: serializer.fromJson<String>(json['id']),
      datetime: serializer.fromJson<DateTime>(json['datetime']),
      amount: serializer.fromJson<int>(json['amount']),
      currency: serializer.fromJson<String>(json['currency']),
      accountId: serializer.fromJson<String>(json['accountId']),
      type: serializer.fromJson<String>(json['type']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      planItemId: serializer.fromJson<String?>(json['planItemId']),
      criticalityId: serializer.fromJson<String?>(json['criticalityId']),
      note: serializer.fromJson<String?>(json['note']),
      attachments: serializer.fromJson<List<String>>(json['attachments']),
      excludeFromBudget: serializer.fromJson<bool>(json['excludeFromBudget']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'datetime': serializer.toJson<DateTime>(datetime),
      'amount': serializer.toJson<int>(amount),
      'currency': serializer.toJson<String>(currency),
      'accountId': serializer.toJson<String>(accountId),
      'type': serializer.toJson<String>(type),
      'categoryId': serializer.toJson<String?>(categoryId),
      'planItemId': serializer.toJson<String?>(planItemId),
      'criticalityId': serializer.toJson<String?>(criticalityId),
      'note': serializer.toJson<String?>(note),
      'attachments': serializer.toJson<List<String>>(attachments),
      'excludeFromBudget': serializer.toJson<bool>(excludeFromBudget),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TransactionsTableData copyWith(
          {String? id,
          DateTime? datetime,
          int? amount,
          String? currency,
          String? accountId,
          String? type,
          Value<String?> categoryId = const Value.absent(),
          Value<String?> planItemId = const Value.absent(),
          Value<String?> criticalityId = const Value.absent(),
          Value<String?> note = const Value.absent(),
          List<String>? attachments,
          bool? excludeFromBudget,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      TransactionsTableData(
        id: id ?? this.id,
        datetime: datetime ?? this.datetime,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        accountId: accountId ?? this.accountId,
        type: type ?? this.type,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        planItemId: planItemId.present ? planItemId.value : this.planItemId,
        criticalityId:
            criticalityId.present ? criticalityId.value : this.criticalityId,
        note: note.present ? note.value : this.note,
        attachments: attachments ?? this.attachments,
        excludeFromBudget: excludeFromBudget ?? this.excludeFromBudget,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
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
      planItemId:
          data.planItemId.present ? data.planItemId.value : this.planItemId,
      criticalityId: data.criticalityId.present
          ? data.criticalityId.value
          : this.criticalityId,
      note: data.note.present ? data.note.value : this.note,
      attachments:
          data.attachments.present ? data.attachments.value : this.attachments,
      excludeFromBudget: data.excludeFromBudget.present
          ? data.excludeFromBudget.value
          : this.excludeFromBudget,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
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
          ..write('planItemId: $planItemId, ')
          ..write('criticalityId: $criticalityId, ')
          ..write('note: $note, ')
          ..write('attachments: $attachments, ')
          ..write('excludeFromBudget: $excludeFromBudget, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
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
      planItemId,
      criticalityId,
      note,
      attachments,
      excludeFromBudget,
      createdAt,
      updatedAt);
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
          other.planItemId == this.planItemId &&
          other.criticalityId == this.criticalityId &&
          other.note == this.note &&
          other.attachments == this.attachments &&
          other.excludeFromBudget == this.excludeFromBudget &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TransactionsTableCompanion
    extends UpdateCompanion<TransactionsTableData> {
  final Value<String> id;
  final Value<DateTime> datetime;
  final Value<int> amount;
  final Value<String> currency;
  final Value<String> accountId;
  final Value<String> type;
  final Value<String?> categoryId;
  final Value<String?> planItemId;
  final Value<String?> criticalityId;
  final Value<String?> note;
  final Value<List<String>> attachments;
  final Value<bool> excludeFromBudget;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const TransactionsTableCompanion({
    this.id = const Value.absent(),
    this.datetime = const Value.absent(),
    this.amount = const Value.absent(),
    this.currency = const Value.absent(),
    this.accountId = const Value.absent(),
    this.type = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.planItemId = const Value.absent(),
    this.criticalityId = const Value.absent(),
    this.note = const Value.absent(),
    this.attachments = const Value.absent(),
    this.excludeFromBudget = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsTableCompanion.insert({
    required String id,
    required DateTime datetime,
    required int amount,
    required String currency,
    required String accountId,
    required String type,
    this.categoryId = const Value.absent(),
    this.planItemId = const Value.absent(),
    this.criticalityId = const Value.absent(),
    this.note = const Value.absent(),
    required List<String> attachments,
    this.excludeFromBudget = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        datetime = Value(datetime),
        amount = Value(amount),
        currency = Value(currency),
        accountId = Value(accountId),
        type = Value(type),
        attachments = Value(attachments);
  static Insertable<TransactionsTableData> custom({
    Expression<String>? id,
    Expression<DateTime>? datetime,
    Expression<int>? amount,
    Expression<String>? currency,
    Expression<String>? accountId,
    Expression<String>? type,
    Expression<String>? categoryId,
    Expression<String>? planItemId,
    Expression<String>? criticalityId,
    Expression<String>? note,
    Expression<String>? attachments,
    Expression<bool>? excludeFromBudget,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
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
      if (planItemId != null) 'plan_item_id': planItemId,
      if (criticalityId != null) 'criticality_id': criticalityId,
      if (note != null) 'note': note,
      if (attachments != null) 'attachments': attachments,
      if (excludeFromBudget != null) 'exclude_from_budget': excludeFromBudget,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? datetime,
      Value<int>? amount,
      Value<String>? currency,
      Value<String>? accountId,
      Value<String>? type,
      Value<String?>? categoryId,
      Value<String?>? planItemId,
      Value<String?>? criticalityId,
      Value<String?>? note,
      Value<List<String>>? attachments,
      Value<bool>? excludeFromBudget,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return TransactionsTableCompanion(
      id: id ?? this.id,
      datetime: datetime ?? this.datetime,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      accountId: accountId ?? this.accountId,
      type: type ?? this.type,
      categoryId: categoryId ?? this.categoryId,
      planItemId: planItemId ?? this.planItemId,
      criticalityId: criticalityId ?? this.criticalityId,
      note: note ?? this.note,
      attachments: attachments ?? this.attachments,
      excludeFromBudget: excludeFromBudget ?? this.excludeFromBudget,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
      map['amount'] = Variable<int>(amount.value);
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
    if (planItemId.present) {
      map['plan_item_id'] = Variable<String>(planItemId.value);
    }
    if (criticalityId.present) {
      map['criticality_id'] = Variable<String>(criticalityId.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (attachments.present) {
      map['attachments'] = Variable<String>($TransactionsTableTable
          .$converterattachments
          .toSql(attachments.value));
    }
    if (excludeFromBudget.present) {
      map['exclude_from_budget'] = Variable<bool>(excludeFromBudget.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
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
          ..write('planItemId: $planItemId, ')
          ..write('criticalityId: $criticalityId, ')
          ..write('note: $note, ')
          ..write('attachments: $attachments, ')
          ..write('excludeFromBudget: $excludeFromBudget, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AccountsTableTable accountsTable = $AccountsTableTable(this);
  late final $CategoriesTableTable categoriesTable =
      $CategoriesTableTable(this);
  late final $PaycheckPeriodsTableTable paycheckPeriodsTable =
      $PaycheckPeriodsTableTable(this);
  late final $CriticalityTableTable criticalityTable =
      $CriticalityTableTable(this);
  late final $PlanItemsTableTable planItemsTable = $PlanItemsTableTable(this);
  late final $TransactionsTableTable transactionsTable =
      $TransactionsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        accountsTable,
        categoriesTable,
        paycheckPeriodsTable,
        criticalityTable,
        planItemsTable,
        transactionsTable
      ];
}

typedef $$AccountsTableTableCreateCompanionBuilder = AccountsTableCompanion
    Function({
  required String id,
  required String name,
  required String type,
  Value<String> currency,
  Value<int> openingBalance,
  Value<bool> archived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$AccountsTableTableUpdateCompanionBuilder = AccountsTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> type,
  Value<String> currency,
  Value<int> openingBalance,
  Value<bool> archived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
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

  ColumnFilters<int> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<int> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<int> get openingBalance => $composableBuilder(
      column: $table.openingBalance, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

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
            Value<int> openingBalance = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountsTableCompanion(
            id: id,
            name: name,
            type: type,
            currency: currency,
            openingBalance: openingBalance,
            archived: archived,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String type,
            Value<String> currency = const Value.absent(),
            Value<int> openingBalance = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountsTableCompanion.insert(
            id: id,
            name: name,
            type: type,
            currency: currency,
            openingBalance: openingBalance,
            archived: archived,
            createdAt: createdAt,
            updatedAt: updatedAt,
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
typedef $$CategoriesTableTableCreateCompanionBuilder = CategoriesTableCompanion
    Function({
  required String id,
  required String name,
  required String kind,
  required String emoji,
  Value<String?> parentId,
  Value<String?> colorHex,
  Value<bool> hidden,
  Value<int> sort,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$CategoriesTableTableUpdateCompanionBuilder = CategoriesTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> kind,
  Value<String> emoji,
  Value<String?> parentId,
  Value<String?> colorHex,
  Value<bool> hidden,
  Value<int> sort,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
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

  ColumnFilters<String> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get emoji => $composableBuilder(
      column: $table.emoji, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hidden => $composableBuilder(
      column: $table.hidden, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sort => $composableBuilder(
      column: $table.sort, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<String> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get emoji => $composableBuilder(
      column: $table.emoji, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hidden => $composableBuilder(
      column: $table.hidden, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sort => $composableBuilder(
      column: $table.sort, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get emoji =>
      $composableBuilder(column: $table.emoji, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<bool> get hidden =>
      $composableBuilder(column: $table.hidden, builder: (column) => column);

  GeneratedColumn<int> get sort =>
      $composableBuilder(column: $table.sort, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

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
        {bool parentId, bool planItemsTableRefs, bool transactionsTableRefs})> {
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
            Value<String> kind = const Value.absent(),
            Value<String> emoji = const Value.absent(),
            Value<String?> parentId = const Value.absent(),
            Value<String?> colorHex = const Value.absent(),
            Value<bool> hidden = const Value.absent(),
            Value<int> sort = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesTableCompanion(
            id: id,
            name: name,
            kind: kind,
            emoji: emoji,
            parentId: parentId,
            colorHex: colorHex,
            hidden: hidden,
            sort: sort,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String kind,
            required String emoji,
            Value<String?> parentId = const Value.absent(),
            Value<String?> colorHex = const Value.absent(),
            Value<bool> hidden = const Value.absent(),
            Value<int> sort = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesTableCompanion.insert(
            id: id,
            name: name,
            kind: kind,
            emoji: emoji,
            parentId: parentId,
            colorHex: colorHex,
            hidden: hidden,
            sort: sort,
            createdAt: createdAt,
            updatedAt: updatedAt,
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
              transactionsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (planItemsTableRefs) db.planItemsTable,
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
        {bool parentId, bool planItemsTableRefs, bool transactionsTableRefs})>;
typedef $$PaycheckPeriodsTableTableCreateCompanionBuilder
    = PaycheckPeriodsTableCompanion Function({
  required String id,
  required String title,
  required DateTime startDate,
  required DateTime endDate,
  required String kind,
  Value<bool> closed,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
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
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

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
    PrefetchHooks Function({bool planItemsTableRefs})> {
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
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PaycheckPeriodsTableCompanion(
            id: id,
            title: title,
            startDate: startDate,
            endDate: endDate,
            kind: kind,
            closed: closed,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required DateTime startDate,
            required DateTime endDate,
            required String kind,
            Value<bool> closed = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PaycheckPeriodsTableCompanion.insert(
            id: id,
            title: title,
            startDate: startDate,
            endDate: endDate,
            kind: kind,
            closed: closed,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PaycheckPeriodsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({planItemsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (planItemsTableRefs) db.planItemsTable
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
        PrefetchHooks Function({bool planItemsTableRefs})>;
typedef $$CriticalityTableTableCreateCompanionBuilder
    = CriticalityTableCompanion Function({
  required String id,
  required String name,
  Value<String?> colorHex,
  Value<String?> iconEmoji,
  Value<int> sort,
  Value<bool> archived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$CriticalityTableTableUpdateCompanionBuilder
    = CriticalityTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> colorHex,
  Value<String?> iconEmoji,
  Value<int> sort,
  Value<bool> archived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$CriticalityTableTableReferences extends BaseReferences<
    _$AppDatabase, $CriticalityTableTable, CriticalityTableData> {
  $$CriticalityTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlanItemsTableTable, List<PlanItemsTableData>>
      _planItemsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.planItemsTable,
              aliasName: $_aliasNameGenerator(
                  db.criticalityTable.id, db.planItemsTable.criticalityId));

  $$PlanItemsTableTableProcessedTableManager get planItemsTableRefs {
    final manager = $$PlanItemsTableTableTableManager($_db, $_db.planItemsTable)
        .filter((f) => f.criticalityId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_planItemsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TransactionsTableTable,
      List<TransactionsTableData>> _transactionsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.transactionsTable,
          aliasName: $_aliasNameGenerator(
              db.criticalityTable.id, db.transactionsTable.criticalityId));

  $$TransactionsTableTableProcessedTableManager get transactionsTableRefs {
    final manager =
        $$TransactionsTableTableTableManager($_db, $_db.transactionsTable)
            .filter((f) => f.criticalityId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_transactionsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CriticalityTableTableFilterComposer
    extends Composer<_$AppDatabase, $CriticalityTableTable> {
  $$CriticalityTableTableFilterComposer({
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

  ColumnFilters<String> get iconEmoji => $composableBuilder(
      column: $table.iconEmoji, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sort => $composableBuilder(
      column: $table.sort, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> planItemsTableRefs(
      Expression<bool> Function($$PlanItemsTableTableFilterComposer f) f) {
    final $$PlanItemsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.planItemsTable,
        getReferencedColumn: (t) => t.criticalityId,
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
        getReferencedColumn: (t) => t.criticalityId,
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

class $$CriticalityTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CriticalityTableTable> {
  $$CriticalityTableTableOrderingComposer({
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

  ColumnOrderings<String> get iconEmoji => $composableBuilder(
      column: $table.iconEmoji, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sort => $composableBuilder(
      column: $table.sort, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CriticalityTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CriticalityTableTable> {
  $$CriticalityTableTableAnnotationComposer({
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

  GeneratedColumn<String> get iconEmoji =>
      $composableBuilder(column: $table.iconEmoji, builder: (column) => column);

  GeneratedColumn<int> get sort =>
      $composableBuilder(column: $table.sort, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> planItemsTableRefs<T extends Object>(
      Expression<T> Function($$PlanItemsTableTableAnnotationComposer a) f) {
    final $$PlanItemsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.planItemsTable,
        getReferencedColumn: (t) => t.criticalityId,
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
            getReferencedColumn: (t) => t.criticalityId,
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

class $$CriticalityTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CriticalityTableTable,
    CriticalityTableData,
    $$CriticalityTableTableFilterComposer,
    $$CriticalityTableTableOrderingComposer,
    $$CriticalityTableTableAnnotationComposer,
    $$CriticalityTableTableCreateCompanionBuilder,
    $$CriticalityTableTableUpdateCompanionBuilder,
    (CriticalityTableData, $$CriticalityTableTableReferences),
    CriticalityTableData,
    PrefetchHooks Function(
        {bool planItemsTableRefs, bool transactionsTableRefs})> {
  $$CriticalityTableTableTableManager(
      _$AppDatabase db, $CriticalityTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CriticalityTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CriticalityTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CriticalityTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> colorHex = const Value.absent(),
            Value<String?> iconEmoji = const Value.absent(),
            Value<int> sort = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CriticalityTableCompanion(
            id: id,
            name: name,
            colorHex: colorHex,
            iconEmoji: iconEmoji,
            sort: sort,
            archived: archived,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> colorHex = const Value.absent(),
            Value<String?> iconEmoji = const Value.absent(),
            Value<int> sort = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CriticalityTableCompanion.insert(
            id: id,
            name: name,
            colorHex: colorHex,
            iconEmoji: iconEmoji,
            sort: sort,
            archived: archived,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CriticalityTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {planItemsTableRefs = false, transactionsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (planItemsTableRefs) db.planItemsTable,
                if (transactionsTableRefs) db.transactionsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (planItemsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CriticalityTableTableReferences
                            ._planItemsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CriticalityTableTableReferences(db, table, p0)
                                .planItemsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.criticalityId == item.id),
                        typedResults: items),
                  if (transactionsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CriticalityTableTableReferences
                            ._transactionsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CriticalityTableTableReferences(db, table, p0)
                                .transactionsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.criticalityId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CriticalityTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CriticalityTableTable,
    CriticalityTableData,
    $$CriticalityTableTableFilterComposer,
    $$CriticalityTableTableOrderingComposer,
    $$CriticalityTableTableAnnotationComposer,
    $$CriticalityTableTableCreateCompanionBuilder,
    $$CriticalityTableTableUpdateCompanionBuilder,
    (CriticalityTableData, $$CriticalityTableTableReferences),
    CriticalityTableData,
    PrefetchHooks Function(
        {bool planItemsTableRefs, bool transactionsTableRefs})>;
typedef $$PlanItemsTableTableCreateCompanionBuilder = PlanItemsTableCompanion
    Function({
  required String id,
  required String title,
  required int expectedAmount,
  Value<String?> categoryId,
  required String periodId,
  Value<DateTime?> deadline,
  Value<int> priority,
  Value<String> flex,
  Value<bool> done,
  Value<String?> criticalityId,
  Value<String?> note,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$PlanItemsTableTableUpdateCompanionBuilder = PlanItemsTableCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<int> expectedAmount,
  Value<String?> categoryId,
  Value<String> periodId,
  Value<DateTime?> deadline,
  Value<int> priority,
  Value<String> flex,
  Value<bool> done,
  Value<String?> criticalityId,
  Value<String?> note,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
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

  static $CriticalityTableTable _criticalityIdTable(_$AppDatabase db) =>
      db.criticalityTable.createAlias($_aliasNameGenerator(
          db.planItemsTable.criticalityId, db.criticalityTable.id));

  $$CriticalityTableTableProcessedTableManager? get criticalityId {
    if ($_item.criticalityId == null) return null;
    final manager =
        $$CriticalityTableTableTableManager($_db, $_db.criticalityTable)
            .filter((f) => f.id($_item.criticalityId!));
    final item = $_typedResult.readTableOrNull(_criticalityIdTable($_db));
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

  ColumnFilters<int> get expectedAmount => $composableBuilder(
      column: $table.expectedAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get flex => $composableBuilder(
      column: $table.flex, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get done => $composableBuilder(
      column: $table.done, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

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

  $$CriticalityTableTableFilterComposer get criticalityId {
    final $$CriticalityTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.criticalityId,
        referencedTable: $db.criticalityTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CriticalityTableTableFilterComposer(
              $db: $db,
              $table: $db.criticalityTable,
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

  ColumnOrderings<int> get expectedAmount => $composableBuilder(
      column: $table.expectedAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get flex => $composableBuilder(
      column: $table.flex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get done => $composableBuilder(
      column: $table.done, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

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

  $$CriticalityTableTableOrderingComposer get criticalityId {
    final $$CriticalityTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.criticalityId,
        referencedTable: $db.criticalityTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CriticalityTableTableOrderingComposer(
              $db: $db,
              $table: $db.criticalityTable,
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

  GeneratedColumn<int> get expectedAmount => $composableBuilder(
      column: $table.expectedAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get flex =>
      $composableBuilder(column: $table.flex, builder: (column) => column);

  GeneratedColumn<bool> get done =>
      $composableBuilder(column: $table.done, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

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

  $$CriticalityTableTableAnnotationComposer get criticalityId {
    final $$CriticalityTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.criticalityId,
        referencedTable: $db.criticalityTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CriticalityTableTableAnnotationComposer(
              $db: $db,
              $table: $db.criticalityTable,
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
        {bool categoryId,
        bool periodId,
        bool criticalityId,
        bool transactionsTableRefs})> {
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
            Value<int> expectedAmount = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<String> periodId = const Value.absent(),
            Value<DateTime?> deadline = const Value.absent(),
            Value<int> priority = const Value.absent(),
            Value<String> flex = const Value.absent(),
            Value<bool> done = const Value.absent(),
            Value<String?> criticalityId = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlanItemsTableCompanion(
            id: id,
            title: title,
            expectedAmount: expectedAmount,
            categoryId: categoryId,
            periodId: periodId,
            deadline: deadline,
            priority: priority,
            flex: flex,
            done: done,
            criticalityId: criticalityId,
            note: note,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required int expectedAmount,
            Value<String?> categoryId = const Value.absent(),
            required String periodId,
            Value<DateTime?> deadline = const Value.absent(),
            Value<int> priority = const Value.absent(),
            Value<String> flex = const Value.absent(),
            Value<bool> done = const Value.absent(),
            Value<String?> criticalityId = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlanItemsTableCompanion.insert(
            id: id,
            title: title,
            expectedAmount: expectedAmount,
            categoryId: categoryId,
            periodId: periodId,
            deadline: deadline,
            priority: priority,
            flex: flex,
            done: done,
            criticalityId: criticalityId,
            note: note,
            createdAt: createdAt,
            updatedAt: updatedAt,
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
              criticalityId = false,
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
                if (criticalityId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.criticalityId,
                    referencedTable:
                        $$PlanItemsTableTableReferences._criticalityIdTable(db),
                    referencedColumn: $$PlanItemsTableTableReferences
                        ._criticalityIdTable(db)
                        .id,
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
        {bool categoryId,
        bool periodId,
        bool criticalityId,
        bool transactionsTableRefs})>;
typedef $$TransactionsTableTableCreateCompanionBuilder
    = TransactionsTableCompanion Function({
  required String id,
  required DateTime datetime,
  required int amount,
  required String currency,
  required String accountId,
  required String type,
  Value<String?> categoryId,
  Value<String?> planItemId,
  Value<String?> criticalityId,
  Value<String?> note,
  required List<String> attachments,
  Value<bool> excludeFromBudget,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$TransactionsTableTableUpdateCompanionBuilder
    = TransactionsTableCompanion Function({
  Value<String> id,
  Value<DateTime> datetime,
  Value<int> amount,
  Value<String> currency,
  Value<String> accountId,
  Value<String> type,
  Value<String?> categoryId,
  Value<String?> planItemId,
  Value<String?> criticalityId,
  Value<String?> note,
  Value<List<String>> attachments,
  Value<bool> excludeFromBudget,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
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

  static $CriticalityTableTable _criticalityIdTable(_$AppDatabase db) =>
      db.criticalityTable.createAlias($_aliasNameGenerator(
          db.transactionsTable.criticalityId, db.criticalityTable.id));

  $$CriticalityTableTableProcessedTableManager? get criticalityId {
    if ($_item.criticalityId == null) return null;
    final manager =
        $$CriticalityTableTableTableManager($_db, $_db.criticalityTable)
            .filter((f) => f.id($_item.criticalityId!));
    final item = $_typedResult.readTableOrNull(_criticalityIdTable($_db));
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

  ColumnFilters<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get attachments => $composableBuilder(
          column: $table.attachments,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get excludeFromBudget => $composableBuilder(
      column: $table.excludeFromBudget,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

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

  $$CriticalityTableTableFilterComposer get criticalityId {
    final $$CriticalityTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.criticalityId,
        referencedTable: $db.criticalityTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CriticalityTableTableFilterComposer(
              $db: $db,
              $table: $db.criticalityTable,
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

  ColumnOrderings<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attachments => $composableBuilder(
      column: $table.attachments, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get excludeFromBudget => $composableBuilder(
      column: $table.excludeFromBudget,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

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

  $$CriticalityTableTableOrderingComposer get criticalityId {
    final $$CriticalityTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.criticalityId,
        referencedTable: $db.criticalityTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CriticalityTableTableOrderingComposer(
              $db: $db,
              $table: $db.criticalityTable,
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

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get attachments =>
      $composableBuilder(
          column: $table.attachments, builder: (column) => column);

  GeneratedColumn<bool> get excludeFromBudget => $composableBuilder(
      column: $table.excludeFromBudget, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

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

  $$CriticalityTableTableAnnotationComposer get criticalityId {
    final $$CriticalityTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.criticalityId,
        referencedTable: $db.criticalityTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CriticalityTableTableAnnotationComposer(
              $db: $db,
              $table: $db.criticalityTable,
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
        {bool accountId,
        bool categoryId,
        bool planItemId,
        bool criticalityId})> {
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
            Value<int> amount = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String> accountId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<String?> planItemId = const Value.absent(),
            Value<String?> criticalityId = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<List<String>> attachments = const Value.absent(),
            Value<bool> excludeFromBudget = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
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
            planItemId: planItemId,
            criticalityId: criticalityId,
            note: note,
            attachments: attachments,
            excludeFromBudget: excludeFromBudget,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime datetime,
            required int amount,
            required String currency,
            required String accountId,
            required String type,
            Value<String?> categoryId = const Value.absent(),
            Value<String?> planItemId = const Value.absent(),
            Value<String?> criticalityId = const Value.absent(),
            Value<String?> note = const Value.absent(),
            required List<String> attachments,
            Value<bool> excludeFromBudget = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
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
            planItemId: planItemId,
            criticalityId: criticalityId,
            note: note,
            attachments: attachments,
            excludeFromBudget: excludeFromBudget,
            createdAt: createdAt,
            updatedAt: updatedAt,
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
              planItemId = false,
              criticalityId = false}) {
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
                if (criticalityId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.criticalityId,
                    referencedTable: $$TransactionsTableTableReferences
                        ._criticalityIdTable(db),
                    referencedColumn: $$TransactionsTableTableReferences
                        ._criticalityIdTable(db)
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
        {bool accountId,
        bool categoryId,
        bool planItemId,
        bool criticalityId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AccountsTableTableTableManager get accountsTable =>
      $$AccountsTableTableTableManager(_db, _db.accountsTable);
  $$CategoriesTableTableTableManager get categoriesTable =>
      $$CategoriesTableTableTableManager(_db, _db.categoriesTable);
  $$PaycheckPeriodsTableTableTableManager get paycheckPeriodsTable =>
      $$PaycheckPeriodsTableTableTableManager(_db, _db.paycheckPeriodsTable);
  $$CriticalityTableTableTableManager get criticalityTable =>
      $$CriticalityTableTableTableManager(_db, _db.criticalityTable);
  $$PlanItemsTableTableTableManager get planItemsTable =>
      $$PlanItemsTableTableTableManager(_db, _db.planItemsTable);
  $$TransactionsTableTableTableManager get transactionsTable =>
      $$TransactionsTableTableTableManager(_db, _db.transactionsTable);
}
