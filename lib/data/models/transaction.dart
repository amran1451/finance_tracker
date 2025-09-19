import 'package:collection/collection.dart';

enum TransactionType { expense, income, transfer }

enum AttachmentType { image, file }

class Attachment {
  Attachment({
    required this.path,
    this.type = AttachmentType.image,
  });

  final String path;
  final AttachmentType type;

  Attachment copyWith({
    String? path,
    AttachmentType? type,
  }) {
    return Attachment(
      path: path ?? this.path,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() => {
        'path': path,
        'type': type.name,
      };

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      path: json['path'] as String,
      type: AttachmentType.values
          .firstWhere((value) => value.name == json['type'], orElse: () => AttachmentType.image),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Attachment && other.path == path && other.type == type;
  }

  @override
  int get hashCode => Object.hash(path, type);
}

class FinanceTransaction {
  FinanceTransaction({
    required this.id,
    required this.datetime,
    required this.amount,
    required this.currency,
    required this.accountId,
    required this.type,
    this.categoryId,
    List<String> tags = const <String>[],
    this.merchantId,
    this.note,
    List<Attachment> attachments = const <Attachment>[],
    this.planned = false,
    this.planItemId,
    this.excludeFromBudget = false,
  })  : tags = List.unmodifiable(tags),
        attachments = List.unmodifiable(attachments);

  final String id;
  final DateTime datetime;
  final double amount;
  final String currency;
  final String accountId;
  final TransactionType type;
  final String? categoryId;
  final List<String> tags;
  final String? merchantId;
  final String? note;
  final List<Attachment> attachments;
  final bool planned;
  final String? planItemId;
  final bool excludeFromBudget;

  FinanceTransaction copyWith({
    String? id,
    DateTime? datetime,
    double? amount,
    String? currency,
    String? accountId,
    TransactionType? type,
    String? categoryId,
    List<String>? tags,
    String? merchantId,
    String? note,
    List<Attachment>? attachments,
    bool? planned,
    String? planItemId,
    bool? excludeFromBudget,
  }) {
    return FinanceTransaction(
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
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'datetime': datetime.toIso8601String(),
        'amount': amount,
        'currency': currency,
        'accountId': accountId,
        'type': type.name,
        'categoryId': categoryId,
        'tags': tags,
        'merchantId': merchantId,
        'note': note,
        'attachments': attachments.map((e) => e.toJson()).toList(),
        'planned': planned,
        'planItemId': planItemId,
        'excludeFromBudget': excludeFromBudget,
      };

  factory FinanceTransaction.fromJson(Map<String, dynamic> json) {
    final tagsJson = json['tags'];
    final attachmentsJson = json['attachments'];
    return FinanceTransaction(
      id: json['id'] as String,
      datetime: DateTime.parse(json['datetime'] as String),
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      accountId: json['accountId'] as String,
      type: TransactionType.values
          .firstWhere((value) => value.name == json['type']),
      categoryId: json['categoryId'] as String?,
      tags: tagsJson == null
          ? const <String>[]
          : List<String>.from(tagsJson as List),
      merchantId: json['merchantId'] as String?,
      note: json['note'] as String?,
      attachments: attachmentsJson == null
          ? const <Attachment>[]
          : (attachmentsJson as List)
              .map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList(),
      planned: json['planned'] as bool? ?? false,
      planItemId: json['planItemId'] as String?,
      excludeFromBudget: json['excludeFromBudget'] as bool? ?? false,
    );
  }

  static const _stringListEquality = ListEquality<String>();
  static const _attachmentListEquality = ListEquality<Attachment>();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FinanceTransaction &&
        other.id == id &&
        other.datetime == datetime &&
        other.amount == amount &&
        other.currency == currency &&
        other.accountId == accountId &&
        other.type == type &&
        other.categoryId == categoryId &&
        _stringListEquality.equals(other.tags, tags) &&
        other.merchantId == merchantId &&
        other.note == note &&
        _attachmentListEquality.equals(other.attachments, attachments) &&
        other.planned == planned &&
        other.planItemId == planItemId &&
        other.excludeFromBudget == excludeFromBudget;
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        datetime,
        amount,
        currency,
        accountId,
        type,
        categoryId,
        Object.hashAll(tags),
        merchantId,
        note,
        Object.hashAll(attachments),
        planned,
        planItemId,
        excludeFromBudget,
      ]);
}
