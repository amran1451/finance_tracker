import 'package:collection/collection.dart';

enum SubscriptionCadence { weekly, monthly, yearly, custom }

class Subscription {
  Subscription({
    required this.id,
    required this.provider,
    required this.amount,
    required this.currency,
    required this.cadence,
    required this.nextCharge,
    this.categoryId,
    List<String> tags = const <String>[],
    this.active = true,
    this.pause = false,
  }) : tags = List.unmodifiable(tags);

  final String id;
  final String provider;
  final double amount;
  final String currency;
  final SubscriptionCadence cadence;
  final DateTime nextCharge;
  final String? categoryId;
  final List<String> tags;
  final bool active;
  final bool pause;

  Subscription copyWith({
    String? id,
    String? provider,
    double? amount,
    String? currency,
    SubscriptionCadence? cadence,
    DateTime? nextCharge,
    String? categoryId,
    List<String>? tags,
    bool? active,
    bool? pause,
  }) {
    return Subscription(
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
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'provider': provider,
        'amount': amount,
        'currency': currency,
        'cadence': cadence.name,
        'nextCharge': nextCharge.toIso8601String(),
        'categoryId': categoryId,
        'tags': tags,
        'active': active,
        'pause': pause,
      };

  factory Subscription.fromJson(Map<String, dynamic> json) {
    final tagsJson = json['tags'];
    return Subscription(
      id: json['id'] as String,
      provider: json['provider'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      cadence: SubscriptionCadence.values
          .firstWhere((value) => value.name == json['cadence']),
      nextCharge: DateTime.parse(json['nextCharge'] as String),
      categoryId: json['categoryId'] as String?,
      tags: tagsJson == null
          ? const <String>[]
          : List<String>.from(tagsJson as List),
      active: json['active'] as bool? ?? true,
      pause: json['pause'] as bool? ?? false,
    );
  }

  static const _listEquality = ListEquality<String>();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Subscription &&
        other.id == id &&
        other.provider == provider &&
        other.amount == amount &&
        other.currency == currency &&
        other.cadence == cadence &&
        other.nextCharge == nextCharge &&
        other.categoryId == categoryId &&
        _listEquality.equals(other.tags, tags) &&
        other.active == active &&
        other.pause == pause;
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        provider,
        amount,
        currency,
        cadence,
        nextCharge,
        categoryId,
        Object.hashAll(tags),
        active,
        pause,
      ]);
}
