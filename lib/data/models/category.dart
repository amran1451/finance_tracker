class Category {
  const Category({
    required this.id,
    required this.name,
    required this.emoji,
    this.parentId,
    required this.colorHex,
    this.hidden = false,
  });

  final String id;
  final String name;
  final String emoji;
  final String? parentId;
  final String colorHex;
  final bool hidden;

  Category copyWith({
    String? id,
    String? name,
    String? emoji,
    String? parentId,
    String? colorHex,
    bool? hidden,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      parentId: parentId ?? this.parentId,
      colorHex: colorHex ?? this.colorHex,
      hidden: hidden ?? this.hidden,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'emoji': emoji,
        'parentId': parentId,
        'colorHex': colorHex,
        'hidden': hidden,
      };

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String,
      emoji: json['emoji'] as String,
      parentId: json['parentId'] as String?,
      colorHex: json['colorHex'] as String,
      hidden: json['hidden'] as bool? ?? false,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Category &&
        other.id == id &&
        other.name == name &&
        other.emoji == emoji &&
        other.parentId == parentId &&
        other.colorHex == colorHex &&
        other.hidden == hidden;
  }

  @override
  int get hashCode => Object.hash(id, name, emoji, parentId, colorHex, hidden);
}
