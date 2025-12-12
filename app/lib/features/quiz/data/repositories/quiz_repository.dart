import '../models/quiz_model.dart';
import '../providers/quiz_api_provider.dart';

class QuizRepository {
  final QuizApiProvider _apiProvider = QuizApiProvider();

  Future<Quiz> getQuiz(String subTopicId) {
    return _apiProvider.fetchQuiz(subTopicId);
  }

  Future<Map<String, dynamic>> submitQuiz(String quizId, Map<String, String> answers) {
    return _apiProvider.submitAnswers(quizId, answers);
  }
}