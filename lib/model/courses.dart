class Course {
  final int id;
  final String name;
  final String description;
  final Map<String, String> attachmentsUrls;
  final bool passed;
  final int countBlocks;
  final int countStudents;
  final int countLessons;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Course({
    required this.id,
    required this.name,
    required this.description,
    required this.attachmentsUrls,
    required this.passed,
    required this.countBlocks,
    required this.countStudents,
    required this.countLessons,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      attachmentsUrls: Map<String, String>.from(json['attachmentsUrls']),
      passed: json['passed'] as bool,
      countBlocks: json['countBlocks'] as int,
      countStudents: json['countStudents'] as int,
      countLessons: json['countLessons'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}