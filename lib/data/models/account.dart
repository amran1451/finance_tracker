enum AccountType { cash, card, bank, wallet }

class Account {
  const Account({
    required this.id,
    required this.name,
    required this.type,
    required this.currency,
    this.openingBalance = 0,
    this.archived = false,
  });

  final String id;
  final String name;
  final AccountType type;
  final String currency;
  final double openingBalance;
  final bool archived;

  Account copyWith({
    String? id,
    String? name,
    AccountType? type,
    String? currency,
    double? openingBalance,
    bool? archived,
  }) {
    return Account(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      currency: currency ?? this.currency,
      openingBalance: openingBalance ?? this.openingBalance,
      archived: archived ?? this.archived,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type.name,
        'currency': currency,
        'openingBalance': openingBalance,
        'archived': archived,
      };

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'] as String,
      name: json['name'] as String,
      type: AccountType.values.firstWhere((e) => e.name == json['type']),
      currency: json['currency'] as String,
      openingBalance: (json['openingBalance'] as num?)?.toDouble() ?? 0,
      archived: json['archived'] as bool? ?? false,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Account &&
        other.id == id &&
        other.name == name &&
        other.type == type &&
        other.currency == currency &&
        other.openingBalance == openingBalance &&
        other.archived == archived;
  }

  @override
  int get hashCode =>
      Object.hash(id, name, type, currency, openingBalance, archived);
}
