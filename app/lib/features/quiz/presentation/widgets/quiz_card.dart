import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/bloc/quiz_bloc.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      buildWhen: (previous, current) =>
          current is QuizLoaded, // Only rebuild for new questions
      builder: (context, state) {
        if (state is QuizLoaded) {
          final question = state.quiz.questions[state.currentQuestionIndex];
          final selectedAnswer = state.selectedAnswers[question.id];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      question.description,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...question.options.map(
                      (option) => _buildAnswerOption(
                        context,
                        option,
                        isSelected: selectedAnswer == option,
                        onTap: () {
                          context.read<QuizBloc>().add(
                            AnswerSelected(
                              questionId: question.id,
                              answer: option,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink(); // Should not be reached if logic is correct
      },
    );
  }

  Widget _buildAnswerOption(
    BuildContext context,
    String text, {
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    const Color deepIndigoBlue = Color(0xFF303F9F);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black87,
          backgroundColor: isSelected ? deepIndigoBlue : Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(
            color: isSelected ? deepIndigoBlue : Colors.grey[300]!,
          ),
          alignment: Alignment.centerLeft,
        ),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
