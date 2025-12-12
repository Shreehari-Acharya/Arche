import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/quiz_repository.dart';
import '../../logic/bloc/quiz_bloc.dart';
import '../widgets/quiz_card.dart';

class QuizScreen extends StatelessWidget {
  final String subTopicId;
  const QuizScreen({super.key, required this.subTopicId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(
        quizRepository: RepositoryProvider.of<QuizRepository>(context),
      )..add(FetchQuiz(subTopicId)),
      child: const QuizView(),
    );
  }
}

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color deepIndigoBlue = Color(0xFF303F9F);
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = screenHeight * 0.25;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: BlocConsumer<QuizBloc, QuizState>(
        listener: (context, state) {
          if (state is QuizError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is QuizLoading || state is QuizInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is QuizFinished) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quiz Finished!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  Text('Your Score: ${state.score} / ${state.totalQuestions}'),
                  const SizedBox(height: 10),
                  Text(
                    'Result: ${state.result.toUpperCase()}',
                    style: TextStyle(
                      color: state.result == 'passed'
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pop(state.result == 'passed'),
                    child: const Text('Back to Topics'),
                  ),
                ],
              ),
            );
          }
          if (state is QuizLoaded) {
            final questionNumber = state.currentQuestionIndex + 1;
            final totalQuestions = state.quiz.questions.length;
            final currentQuestionId =
                state.quiz.questions[state.currentQuestionIndex].id;
            final isAnswerSelected = state.selectedAnswers.containsKey(
              currentQuestionId,
            );

            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: headerHeight,
                        decoration: const BoxDecoration(color: deepIndigoBlue),
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              // Changed from spaceBetween to have more control
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Quiz',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Question $questionNumber of $totalQuestions',
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
          
                                // Added SizedBox to create a small gap from the bottom edge
                                const SizedBox(height: 5),
                                LinearProgressIndicator(
                                  value: questionNumber / totalQuestions,
                                  backgroundColor: Colors.white30,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                  minHeight: 8,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: headerHeight - 40),
                        child: const QuizCard(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: deepIndigoBlue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: isAnswerSelected
                        ? () {
                            if (state.isLastQuestion) {
                              context.read<QuizBloc>().add(SubmitQuiz());
                            } else {
                              context.read<QuizBloc>().add(NextQuestion());
                            }
                          }
                        : null, // Disable button if no answer is selected
                    child: Text(
                      state.isLastQuestion ? 'Submit Quiz' : 'Next Question',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          // This handles the case where an error snackbar is shown but the UI should remain
          if (state is QuizError) {
            return const Center(
              child: Text('An error occurred. Please try again.'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
