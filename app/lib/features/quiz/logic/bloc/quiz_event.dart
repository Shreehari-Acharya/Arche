part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class FetchQuiz extends QuizEvent {
  final String subTopicId;

  const FetchQuiz(this.subTopicId);

  @override
  List<Object> get props => [subTopicId];
}

class AnswerSelected extends QuizEvent {
  final String questionId;
  final String answer;

  const AnswerSelected({required this.questionId, required this.answer});

  @override
  List<Object> get props => [questionId, answer];
}

class NextQuestion extends QuizEvent {}

class SubmitQuiz extends QuizEvent {}
