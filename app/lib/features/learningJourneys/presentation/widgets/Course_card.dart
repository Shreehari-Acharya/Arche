import 'package:flutter/material.dart';
import '../../data/models/learning_journey_model.dart';
import '../../../Dashboard/presentation/widgets/course_progress_card.dart';

// This wrapper adapts the old CourseCard usage to the new CourseProgressCard.
class CourseCard extends StatelessWidget {
  final LearningJourney journey;
  final VoidCallback? onTap;

  const CourseCard({super.key, required this.journey, this.onTap});

  int _calculateStreak(List<SubTopic> topics) {
    int streak = 0;
    for (final t in topics) {
      if (t.isCompleted) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }

  @override
  Widget build(BuildContext context) {
    final total = journey.subTopics.length;
    final completed = journey.subTopics.where((t) => t.isCompleted).length;
    final streak = _calculateStreak(journey.subTopics);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: CourseProgressCard(
          courseName: journey.topicName,
          completed: completed,
          total: total == 0 ? 1 : total,
          streak: streak,
        ),
      ),
    );
  }
}
