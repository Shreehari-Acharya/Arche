import 'package:flutter/material.dart';
import '../../../learningJourneys/data/models/learning_journey_model.dart';
import 'course_progress_card.dart';
import 'daily_schedule_card.dart';

class CourseCard extends StatelessWidget {
  final LearningJourney journey;
  final Function(SubTopic)? onContinue;
  final Function(SubTopic)? onDailyTaskTapped;

  const CourseCard({
    super.key,
    required this.journey,
    this.onContinue,
    this.onDailyTaskTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // This part is from the original CourseProgressCard structure
            CourseProgressCard(journey: journey, onContinue: onContinue),
            // This part contains the title and the DailyScheduleCard
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Your Journey at a Glance",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  DailyScheduleCard(
                    journey: journey,
                    onItemTapped: onDailyTaskTapped,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
