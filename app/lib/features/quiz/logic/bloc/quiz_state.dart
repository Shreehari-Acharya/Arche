part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final Quiz quiz;
  final int currentQuestionIndex;
  final Map<String, String> selectedAnswers;
  final bool isLastQuestion;

  const QuizLoaded({
    required this.quiz,
    this.currentQuestionIndex = 0,
    this.selectedAnswers = const {},
    this.isLastQuestion = false,
  });

  @override
  List<Object> get props => [quiz, currentQuestionIndex, selectedAnswers, isLastQuestion];

  QuizLoaded copyWith({
    Quiz? quiz,
    int? currentQuestionIndex,
    Map<String, String>? selectedAnswers,
    bool? isLastQuestion,
  }) {
    return QuizLoaded(
      quiz: quiz ?? this.quiz,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      isLastQuestion: isLastQuestion ?? this.isLastQuestion,
    );
  }
}

class AnswerSubmitted extends QuizState {
  final QuizLoaded previousState;
  final String correctAnswer;
  final String selectedAnswer;

  const AnswerSubmitted({
    required this.previousState,
    required this.correctAnswer,
    required this.selectedAnswer,
  });

  @override
  List<Object> get props => [previousState, correctAnswer, selectedAnswer];
}

class QuizFinished extends QuizState {
  final int score;
  final int totalQuestions;
  final String result;

  const QuizFinished({
    required this.score,
    required this.totalQuestions,
    required this.result,
  });

  @override
  List<Object> get props => [score, totalQuestions, result];
}

class QuizError extends QuizState {
  final String message;

  const QuizError(this.message);

  @override
  List<Object> get props => [message];
}