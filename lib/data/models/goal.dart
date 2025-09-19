import 'package:collection/collection.dart';

class Goal {
  Goal({
    required this.id,
    required this.title,
    required this.targetAmount,
    required this.savedAmount,
    this.dueDate,
    Map<String, dynamic>? autoTopUpRule,
  }) : autoTopUpRule =
            autoTopUpRule == null ? null : Map.unmodifiable(autoTopUpRule);

  final String id;
  final String title;
  final double targetAmount;
  final double savedAmount;
  final DateTime? dueDate;
  final Map<String, dynamic>? autoTopUpRule;

  Goal copyWith({
    String? id,
    String? title,
    double? targetAmount,
    double? savedAmount,
    DateTime? dueDate,
    Map<String, dynamic>? autoTopUpRule,
  }) {
    return Goal(
      id: id ?? this.id,
      title: title ?? this.title,
      targetAmount: targetAmount ?? this.targetAmount,
      savedAmount: savedAmount ?? this.savedAmount,
      dueDate: dueDate ?? this.dueDate,
      autoTopUpRule: autoTopUpRule ?? this.autoTopUpRule,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'targetAmount': targetAmount,
        'savedAmount': savedAmount,
        'dueDate': dueDate?.toIso8601String(),
        'autoTopUpRule': autoTopUpRule,
      };

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      id: json['id'] as String,
      title: json['title'] as String,
      targetAmount: (json['targetAmount'] as num).toDouble(),
      savedAmount: (json['savedAmount'] as num).toDouble(),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      autoTopUpRule: json['autoTopUpRule'] == null
          ? null
          : Map<String, dynamic>.from(json['autoTopUpRule'] as Map),
    );
  }

  static const _mapEquality = DeepCollectionEquality();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Goal &&
        other.id == id &&
        other.title == title &&
        other.targetAmount == targetAmount &&
        other.savedAmount == savedAmount &&
        other.dueDate == dueDate &&
        _mapEquality.equals(other.autoTopUpRule, autoTopUpRule);
  }

  @override
  int get hashCode => Object.hash(
        id,
        title,
        targetAmount,
        savedAmount,
        dueDate,
        autoTopUpRule == null
            ? null
            : _mapEquality.hash(autoTopUpRule!),
      );
}
