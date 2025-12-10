import 'package:flutter/material.dart';
import '../../../learningJourneys/data/models/learning_journey_model.dart';

/// Enum to represent the state of a schedule item.
enum ScheduleState { completed, active, locked }

/// A widget that displays a horizontal daily schedule based on a learning journey.
class DailyScheduleCard extends StatelessWidget {
  final LearningJourney journey;

  const DailyScheduleCard({super.key, required this.journey});

  // Helper to extract "Day X" and the title from a description
  Map<String, String> _parseDescription(String description) {
    final regExp = RegExp(r'^(Day\s*\d+):?\s*(.*)', caseSensitive: false);
    final match = regExp.firstMatch(description);
    if (match != null && match.groupCount >= 2) {
      return {
        'dayHeader': match.group(1) ?? '',
        'topicTitle': match.group(2)?.trim() ?? description,
      };
    }
    // Fallback if the format doesn't match
    return {'dayHeader': 'Lesson', 'topicTitle': description};
  }

  @override
  Widget build(BuildContext context) {
    // Find the index of the first incomplete subtopic. This is our "active" lesson.
    final int activeIndex = journey.subTopics.indexWhere(
      (topic) => !topic.isCompleted,
    );

    // Use a SingleChildScrollView to allow horizontal scrolling.
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      // Add padding to ensure cards don't stick to the screen edges.
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        children: List.generate(journey.subTopics.length, (index) {
          final subTopic = journey.subTopics[index];
          final parsed = _parseDescription(subTopic.description);
          final dayHeader = parsed['dayHeader']!;
          final topicTitle = parsed['topicTitle']!;

          // Determine the state directly based on `isCompleted` and position.
          ScheduleState state;
          if (subTopic.isCompleted) {
            // If the backend says it's complete, the state is 'completed'.
            state = ScheduleState.completed;
          } else if (index == activeIndex) {
            // If it's not complete AND it's the first incomplete one, it's 'active'.
            state = ScheduleState.active;
          } else {
            // If it's not complete and not the active one, it must be 'locked'.
            state = ScheduleState.locked;
          }

          return _buildScrollableItem(
            state: state,
            dayHeader: dayHeader,
            topicTitle: topicTitle,
            subtext: state == ScheduleState.active ? "(Today)" : null,
          );
        }),
      ),
    );
  }

  /// Helper to wrap each card with a fixed width and spacing.
  Widget _buildScrollableItem({
    required ScheduleState state,
    required String dayHeader,
    required String topicTitle,
    String? subtext,
  }) {
    return Container(
      width: 125, // Fixed width for each card
      margin: const EdgeInsets.only(right: 12), // Spacing between cards
      child: _ScheduleItemCard(
        state: state,
        dayHeader: dayHeader,
        topicTitle: topicTitle,
        subtext: subtext,
      ),
    );
  }
}

/// A private helper widget to build an individual card in the schedule.
class _ScheduleItemCard extends StatelessWidget {
  final ScheduleState state;
  final String dayHeader;
  final String topicTitle;
  final String? subtext;

  const _ScheduleItemCard({
    required this.state,
    required this.dayHeader,
    required this.topicTitle,
    this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    // Determine styles based on the card's state.
    final Color backgroundColor = state == ScheduleState.active
        ? Colors.white
        : Colors.grey[200]!;
    final Color textColor = state == ScheduleState.locked
        ? Colors.grey[500]!
        : state == ScheduleState.completed
        ? Colors.grey[700]!
        : Colors.black87;
    final FontWeight topicFontWeight = state == ScheduleState.active
        ? FontWeight.bold
        : FontWeight.normal;
    final Border? border = state == ScheduleState.active
        ? Border.all(color: const Color(0xFF4338CA), width: 2.5)
        : null;

    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.0),
        border: border,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 12.0),
              child: _buildTopContent(textColor),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Only show dayHeader in the bottom half if the card is not active.
                  if (state != ScheduleState.active)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Text(
                        dayHeader,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),

                  Text(
                    topicTitle,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: topicFontWeight,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtext != null && state == ScheduleState.active) ...[
                    const SizedBox(height: 1), // Reduced space
                    Text(
                      subtext!,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the content for the top half of the card based on its state.
  Widget _buildTopContent(Color textColor) {
    switch (state) {
      case ScheduleState.completed:
        return Container(
          width: 18,
          height: 18,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 18),
        );
      case ScheduleState.locked:
        return Icon(Icons.lock, color: Colors.grey[400], size: 20);
      case ScheduleState.active:
        return Text(
          dayHeader,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        );
    }
  }
}
