enum CarryOverRule { none, full, partial }

class Budget {
  const Budget({
    required this.id,
    required this.periodId,
    required this.categoryId,
    required this.limitAmount,
    this.carryOverRule = CarryOverRule.none,
    this.carryOverPct,
  });

  final String id;
  final String periodId;
  final String categoryId;
  final double limitAmount;
  final CarryOverRule carryOverRule;
  final double? carryOverPct;

  Budget copyWith({
    String? id,
    String? periodId,
    String? categoryId,
    double? limitAmount,
    CarryOverRule? carryOverRule,
    double? carryOverPct,
  }) {
    return Budget(
      id: id ?? this.id,
      periodId: periodId ?? this.periodId,
      categoryId: categoryId ?? this.categoryId,
      limitAmount: limitAmount ?? this.limitAmount,
      carryOverRule: carryOverRule ?? this.carryOverRule,
      carryOverPct: carryOverPct ?? this.carryOverPct,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'periodId': periodId,
        'categoryId': categoryId,
        'limitAmount': limitAmount,
        'carryOverRule': carryOverRule.name,
        'carryOverPct': carryOverPct,
      };

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      id: json['id'] as String,
      periodId: json['periodId'] as String,
      categoryId: json['categoryId'] as String,
      limitAmount: (json['limitAmount'] as num).toDouble(),
      carryOverRule: CarryOverRule.values
          .firstWhere((value) => value.name == json['carryOverRule']),
      carryOverPct: (json['carryOverPct'] as num?)?.toDouble(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Budget &&
        other.id == id &&
        other.periodId == periodId &&
        other.categoryId == categoryId &&
        other.limitAmount == limitAmount &&
        other.carryOverRule == carryOverRule &&
        other.carryOverPct == carryOverPct;
  }

  @override
  int get hashCode =>
      Object.hash(id, periodId, categoryId, limitAmount, carryOverRule, carryOverPct);
}
