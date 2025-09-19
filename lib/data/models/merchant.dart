class Merchant {
  const Merchant({
    required this.id,
    required this.name,
    this.location,
    this.ruleHint,
  });

  final String id;
  final String name;
  final String? location;
  final String? ruleHint;

  Merchant copyWith({
    String? id,
    String? name,
    String? location,
    String? ruleHint,
  }) {
    return Merchant(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      ruleHint: ruleHint ?? this.ruleHint,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'location': location,
        'ruleHint': ruleHint,
      };

  factory Merchant.fromJson(Map<String, dynamic> json) {
    return Merchant(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String?,
      ruleHint: json['ruleHint'] as String?,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Merchant &&
        other.id == id &&
        other.name == name &&
        other.location == location &&
        other.ruleHint == ruleHint;
  }

  @override
  int get hashCode => Object.hash(id, name, location, ruleHint);
}
