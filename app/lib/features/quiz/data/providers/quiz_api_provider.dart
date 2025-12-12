import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quiz_model.dart';

class QuizApiProvider {
  // Replace with your actual base URL
  final String _baseUrl = "http://localhost:5000/api";

  Future<Quiz> fetchQuiz(String subTopicId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/quizzes/start?subTopicId=$subTopicId'),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body)['data'];
      return Quiz.fromJson(data);
    } else {
      throw Exception('Failed to load quiz');
    }
  }

  Future<Map<String, dynamic>> submitAnswers(
    String quizId,
    Map<String, String> answers,
  ) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/quizzes/answers'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'quizId': quizId, 'answers': answers}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to submit answers');
    }
  }
}
