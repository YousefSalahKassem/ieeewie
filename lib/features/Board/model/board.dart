class Board{
  final String image;
  final String name;
  final String role;
  final String description;
  final String id;
  Board(
      {required this.image,
      required this.name,
      required this.role,
      required this.description,
      required this.id,
      });

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      name: json['name'] as String,
      role: json['role'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['role'] = role;
    data['image'] = image;
    data['description'] = description;
    data['id'] = id;
    return data;
  }

  Board copyWith({
    String? image,
    String? name,
    String? role,
    String? id,
    String? description,
  }) {
    return Board(
      description: description ?? this.description,
      image: image?? this.image,
      id: id?? this.id,
      role: role?? this.role,
      name: name?? this.name,
    );
  }
}
