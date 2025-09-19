class Tag {
  const Tag({
    required this.id,
    required this.name,
    this.colorHex,
  });

  final String id;
  final String name;
  final String? colorHex;

  Tag copyWith({
    String? id,
    String? name,
    String? colorHex,
  }) {
    return Tag(
      id: id ?? this.id,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'colorHex': colorHex,
      };

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'] as String,
      name: json['name'] as String,
      colorHex: json['colorHex'] as String?,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Tag &&
        other.id == id &&
        other.name == name &&
        other.colorHex == colorHex;
  }

  @override
  int get hashCode => Object.hash(id, name, colorHex);
}
