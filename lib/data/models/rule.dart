import 'package:collection/collection.dart';

enum RuleConditionType { merchant, amountRange, textMatch, timeOfDay, weekday }

class RuleAction {
  RuleAction({
    this.categoryId,
    List<String> tagsAdd = const <String>[],
    this.setPlanned,
    this.noteTemplate,
  }) : tagsAdd = List.unmodifiable(tagsAdd);

  final String? categoryId;
  final List<String> tagsAdd;
  final bool? setPlanned;
  final String? noteTemplate;

  RuleAction copyWith({
    String? categoryId,
    List<String>? tagsAdd,
    bool? setPlanned,
    String? noteTemplate,
  }) {
    return RuleAction(
      categoryId: categoryId ?? this.categoryId,
      tagsAdd: tagsAdd ?? this.tagsAdd,
      setPlanned: setPlanned ?? this.setPlanned,
      noteTemplate: noteTemplate ?? this.noteTemplate,
    );
  }

  Map<String, dynamic> toJson() => {
        'categoryId': categoryId,
        'tagsAdd': tagsAdd,
        'setPlanned': setPlanned,
        'noteTemplate': noteTemplate,
      };

  factory RuleAction.fromJson(Map<String, dynamic> json) {
    return RuleAction(
      categoryId: json['categoryId'] as String?,
      tagsAdd: json['tagsAdd'] == null
          ? const <String>[]
          : List<String>.from(json['tagsAdd'] as List),
      setPlanned: json['setPlanned'] as bool?,
      noteTemplate: json['noteTemplate'] as String?,
    );
  }

  static const _listEquality = ListEquality<String>();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RuleAction &&
        other.categoryId == categoryId &&
        _listEquality.equals(other.tagsAdd, tagsAdd) &&
        other.setPlanned == setPlanned &&
        other.noteTemplate == noteTemplate;
  }

  @override
  int get hashCode => Object.hash(
        categoryId,
        Object.hashAll(tagsAdd),
        setPlanned,
        noteTemplate,
      );
}

class RuleCondition {
  RuleCondition({
    required this.type,
    Map<String, dynamic>? data,
  }) : data = data == null ? null : Map.unmodifiable(data);

  final RuleConditionType type;
  final Map<String, dynamic>? data;

  RuleCondition copyWith({
    RuleConditionType? type,
    Map<String, dynamic>? data,
  }) {
    return RuleCondition(
      type: type ?? this.type,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type.name,
        'data': data,
      };

  factory RuleCondition.fromJson(Map<String, dynamic> json) {
    return RuleCondition(
      type: RuleConditionType.values
          .firstWhere((value) => value.name == json['type']),
      data: json['data'] == null
          ? null
          : Map<String, dynamic>.from(json['data'] as Map),
    );
  }

  static const _mapEquality = DeepCollectionEquality();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RuleCondition &&
        other.type == type &&
        _mapEquality.equals(other.data, data);
  }

  @override
  int get hashCode => Object.hash(
        type,
        data == null ? null : _mapEquality.hash(data!),
      );
}

class Rule {
  const Rule({
    required this.id,
    required this.condition,
    required this.action,
    this.priority = 0,
  });

  final String id;
  final RuleCondition condition;
  final RuleAction action;
  final int priority;

  Rule copyWith({
    String? id,
    RuleCondition? condition,
    RuleAction? action,
    int? priority,
  }) {
    return Rule(
      id: id ?? this.id,
      condition: condition ?? this.condition,
      action: action ?? this.action,
      priority: priority ?? this.priority,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'condition': condition.toJson(),
        'action': action.toJson(),
        'priority': priority,
      };

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      id: json['id'] as String,
      condition: RuleCondition.fromJson(
          json['condition'] as Map<String, dynamic>),
      action: RuleAction.fromJson(json['action'] as Map<String, dynamic>),
      priority: json['priority'] as int? ?? 0,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Rule &&
        other.id == id &&
        other.condition == condition &&
        other.action == action &&
        other.priority == priority;
  }

  @override
  int get hashCode => Object.hash(id, condition, action, priority);
}
