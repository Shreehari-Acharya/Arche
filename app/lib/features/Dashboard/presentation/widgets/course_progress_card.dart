import 'package:flutter/material.dart';
import '../../../learningJourneys/data/models/learning_journey_model.dart';
import 'dart:core';

class CourseProgressCard extends StatelessWidget {
  final LearningJourney journey;
  final Function(SubTopic)? onContinue;

  const CourseProgressCard({super.key, required this.journey, this.onContinue});

  String _extractDayFromDescription(String description) {
    final regExp = RegExp(r'^(Day\s*\d+):?', caseSensitive: false);
    final match = regExp.firstMatch(description);
    return match?.group(1) ?? 'Next Lesson';
  }

  String? _getYoutubeThumbnailUrl(String? videoUrl) {
    if (videoUrl == null || videoUrl.isEmpty) {
      return null;
    }
    final regExp = RegExp(
      r'.*(?:(?:youtu\.be\/|v\/|vi\/|u\/\w\/|embed\/)|(?:(?:watch)?\?v(?:i)?=|\&v(?:i)?=))([^#\&\?]*).*',
      caseSensitive: false,
    );
    final match = regExp.firstMatch(videoUrl);
    final videoId = match?.group(1);

    if (videoId != null && videoId.length == 11) {
      return 'https://img.youtube.com/vi/$videoId/mqdefault.jpg';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final totalSubTopics = journey.subTopics.length;
    final completedSubTopics = journey.subTopics
        .where((st) => st.isCompleted)
        .length;
    final progress = totalSubTopics > 0
        ? completedSubTopics / totalSubTopics
        : 0.0;
    final isCompleted = progress >= 1.0 && totalSubTopics > 0;

    // Find the next subtopic or show completion message
    final nextSubTopic = journey.subTopics.firstWhere(
      (st) => !st.isCompleted,
      orElse: () => SubTopic(
        id: '',
        description: 'All lessons completed!',
        isCompleted: false,
        videoResources: [],
      ),
    );

    // Extract the day and the rest of the description
    final dayLabel = isCompleted
        ? "Journey Complete"
        : _extractDayFromDescription(nextSubTopic.description);
    final lessonTitle = nextSubTopic.description.replaceFirst(
      RegExp(r'^(Day\s*\d+):?\s*'),
      '',
    );

    final videoResource = nextSubTopic.videoResources.isNotEmpty
        ? nextSubTopic.videoResources.first
        : null;
    final lessonDuration = videoResource != null
        ? "${videoResource.duration ~/ 60} min"
        : "N/A";
    final thumbnailUrl = _getYoutubeThumbnailUrl(videoResource?.url);

    return Container(
      padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left: Image Thumbnail
              _buildImageThumbnail(lessonDuration, thumbnailUrl),
              const SizedBox(width: 12),
              // Right: Text Column
              _buildHeaderText(
                dayLabel,
                lessonTitle,
                "Jump back in: ${journey.topicName}",
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Button
          if (!isCompleted) _buildContinueButton(),
          const SizedBox(height: 12),

          // Footer/Progress
          _buildProgressBar(progress, completedSubTopics, totalSubTopics),
        ],
      ),
    );
  }

  Widget _buildImageThumbnail(String duration, String? thumbnailUrl) {
    return SizedBox(
      width: 120, // A slightly wider thumbnail for a better 16:9 look
      height: 95,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                color: Colors.black,
                child: thumbnailUrl != null
                    ? Image.network(
                        thumbnailUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error_outline, color: Colors.red),
                      )
                    : const Icon(
                        Icons.video_library_outlined,
                        color: Colors.grey,
                      ),
              ),
            ),
          ),
          // Semi-transparent overlay for better icon visibility
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                duration,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderText(String dayLabel, String title, String subtitle) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dayLabel,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20, // text-2xl
              fontWeight: FontWeight.w800, // font-extrabold
              color: Color(0xFF1F2937), // text-gray-900
              height: 1,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12, // text-sm
              color: Color(0xFF6B7280), // text-gray-500
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,

      child: ElevatedButton(
        onPressed: () {
          final nextSubTopic = journey.subTopics.firstWhere(
            (st) => !st.isCompleted,
            orElse: () => SubTopic(
              id: '',
              description: 'All lessons completed!',
              isCompleted: false,
              videoResources: [],
            ),
          );
          if (onContinue != null && nextSubTopic.id.isNotEmpty) {
            onContinue!(nextSubTopic);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4338CA), // bg-indigo-700
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: const Text(
          "Continue Lesson",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildProgressBar(double progress, int completed, int total) {
    final text = progress >= 1.0 && total > 0
        ? "Completed! ($total of $total lessons)"
        : "${(progress * 100).toInt()}% complete ($completed of $total lessons)";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: const Color(0xFFE5E7EB), // bg-gray-200
            valueColor: const AlwaysStoppedAnimation<Color>(
              Colors.green,
            ), // bg-teal-400
            minHeight: 8,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14, // text-sm
            color: Color(0xFF4B5563), // text-gray-600
          ),
        ),
      ],
    );
  }
}
