import 'package:collection/collection.dart';

enum PlanFlex { fixed, elastic }

class PlanItem {
  PlanItem({
    required this.id,
    required this.title,
    required this.expectedAmount,
    this.categoryId,
    List<String> tags = const <String>[],
    required this.deadline,
    required this.periodId,
    this.priority = 0,
    this.flex = PlanFlex.fixed,
    this.done = false,
  }) : tags = List.unmodifiable(tags);

  final String id;
  final String title;
  final double expectedAmount;
  final String? categoryId;
  final List<String> tags;
  final DateTime deadline;
  final String periodId;
  final int priority;
  final PlanFlex flex;
  final bool done;

  PlanItem copyWith({
    String? id,
    String? title,
    double? expectedAmount,
    String? categoryId,
    List<String>? tags,
    DateTime? deadline,
    String? periodId,
    int? priority,
    PlanFlex? flex,
    bool? done,
  }) {
    return PlanItem(
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
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'expectedAmount': expectedAmount,
        'categoryId': categoryId,
        'tags': tags,
        'deadline': deadline.toIso8601String(),
        'periodId': periodId,
        'priority': priority,
        'flex': flex.name,
        'done': done,
      };

  factory PlanItem.fromJson(Map<String, dynamic> json) {
    final tagsJson = json['tags'];
    return PlanItem(
      id: json['id'] as String,
      title: json['title'] as String,
      expectedAmount: (json['expectedAmount'] as num).toDouble(),
      categoryId: json['categoryId'] as String?,
      tags: tagsJson == null
          ? const <String>[]
          : List<String>.from(tagsJson as List),
      deadline: DateTime.parse(json['deadline'] as String),
      periodId: json['periodId'] as String,
      priority: json['priority'] as int? ?? 0,
      flex: PlanFlex.values.firstWhere((value) => value.name == json['flex']),
      done: json['done'] as bool? ?? false,
    );
  }

  static const _listEquality = ListEquality<String>();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PlanItem &&
        other.id == id &&
        other.title == title &&
        other.expectedAmount == expectedAmount &&
        other.categoryId == categoryId &&
        _listEquality.equals(other.tags, tags) &&
        other.deadline == deadline &&
        other.periodId == periodId &&
        other.priority == priority &&
        other.flex == flex &&
        other.done == done;
  }

  @override
  int get hashCode => Object.hashAll(
        [
          id,
          title,
          expectedAmount,
          categoryId,
          Object.hashAll(tags),
          deadline,
          periodId,
          priority,
          flex,
          done,
        ],
      );
}
