enum PaycheckPeriodKind { advance, salary, custom }

class PaycheckPeriod {
  const PaycheckPeriod({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.kind,
    this.closed = false,
  });

  final String id;
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final PaycheckPeriodKind kind;
  final bool closed;

  PaycheckPeriod copyWith({
    String? id,
    String? title,
    DateTime? startDate,
    DateTime? endDate,
    PaycheckPeriodKind? kind,
    bool? closed,
  }) {
    return PaycheckPeriod(
      id: id ?? this.id,
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      kind: kind ?? this.kind,
      closed: closed ?? this.closed,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'kind': kind.name,
        'closed': closed,
      };

  factory PaycheckPeriod.fromJson(Map<String, dynamic> json) {
    return PaycheckPeriod(
      id: json['id'] as String,
      title: json['title'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      kind: PaycheckPeriodKind.values
          .firstWhere((value) => value.name == json['kind']),
      closed: json['closed'] as bool? ?? false,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaycheckPeriod &&
        other.id == id &&
        other.title == title &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.kind == kind &&
        other.closed == closed;
  }

  @override
  int get hashCode => Object.hash(id, title, startDate, endDate, kind, closed);
}
