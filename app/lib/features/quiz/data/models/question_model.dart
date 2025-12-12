class Question {
  final String id;
  final String description;
  final List<String> options;

  Question({
    required this.id,
    required this.description,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      description: json['description'],
      options: List<String>.from(json['options']),
    );
  }
}
