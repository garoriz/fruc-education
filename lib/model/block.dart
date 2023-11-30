class Block {
  int id;
  String name;
  String avatarUrl;
  String status;
  int countLessons;

  Block({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.status,
    required this.countLessons,
  });

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      id: json['id'] as int,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String,
      status: json['status'] as String,
      countLessons: json['countLessons'] as int,
    );
  }
}