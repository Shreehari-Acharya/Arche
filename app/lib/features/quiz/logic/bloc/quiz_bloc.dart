import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/quiz_model.dart';
import '../../data/repositories/quiz_repository.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizRepository _quizRepository;

  QuizBloc({required QuizRepository quizRepository})
    : _quizRepository = quizRepository,
      super(QuizInitial()) {
    on<FetchQuiz>(_onFetchQuiz);
    on<AnswerSelected>(_onAnswerSelected);
    on<NextQuestion>(_onNextQuestion);
    on<SubmitQuiz>(_onSubmitQuiz);
  }

  void _onFetchQuiz(FetchQuiz event, Emitter<QuizState> emit) async {
    emit(QuizLoading());
    try {
      final quiz = await _quizRepository.getQuiz(event.subTopicId);
      emit(QuizLoaded(quiz: quiz, isLastQuestion: quiz.questions.length == 1));
    } catch (e) {
      emit(QuizError(e.toString()));
    }
  }

  void _onAnswerSelected(AnswerSelected event, Emitter<QuizState> emit) {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      final newAnswers = Map<String, String>.from(currentState.selectedAnswers);
      newAnswers[event.questionId] = event.answer;

      emit(currentState.copyWith(selectedAnswers: newAnswers));
    }
  }

  void _onNextQuestion(NextQuestion event, Emitter<QuizState> emit) {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      final nextIndex = currentState.currentQuestionIndex + 1;

      if (nextIndex < currentState.quiz.questions.length) {
        emit(
          currentState.copyWith(
            currentQuestionIndex: nextIndex,
            isLastQuestion: nextIndex == currentState.quiz.questions.length - 1,
          ),
        );
      }
    }
  }

  void _onSubmitQuiz(SubmitQuiz event, Emitter<QuizState> emit) async {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      // Ensure all questions have been answered before submitting
      if (currentState.selectedAnswers.length !=
          currentState.quiz.questions.length) {
        emit(const QuizError("Please answer all questions before submitting."));
        // Re-emit the loaded state to allow the user to continue
        emit(currentState);
        return;
      }
      try {
        final result = await _quizRepository.submitQuiz(
          currentState.quiz.id,
          currentState.selectedAnswers,
        );
        emit(
          QuizFinished(
            score: result['score'],
            totalQuestions: result['totalQuestions'],
            result: result['result'],
          ),
        );
      } catch (e) {
        emit(QuizError(e.toString()));
      }
    }
  }
}
