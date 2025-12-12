import 'question_model.dart';

class Quiz {
  final String id;
  final String subTopicId;
  final List<Question> questions;

  Quiz({
    required this.id,
    required this.subTopicId,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    var questionsList = json['questions'] as List;
    List<Question> questions = questionsList.map((i) => Question.fromJson(i)).toList();

    return Quiz(
      id: json['id'],
      subTopicId: json['subTopicId'],
      questions: questions,
    );
  }
}