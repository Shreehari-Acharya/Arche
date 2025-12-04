import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/models/learning_journey_model.dart';
import '../../data/repositories/learning_repository.dart';

class DailyTaskScreen extends StatelessWidget {
  final SubTopic subTopic;
  final String journeyId;
  final String userId;
  final LearningRepository repository;

  const DailyTaskScreen({
    super.key,
    required this.subTopic,
    required this.journeyId,
    required this.userId,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    final parts = subTopic.description.split(':');
    final String title = parts.isNotEmpty ? parts.first : "Daily Task";
    final String subtitle = parts.length > 1
        ? parts.sublist(1).join(':').trim()
        : subTopic.description;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F0FF),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF6A5AE0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 10),

          const Text(
            "Today's Learning Goals 🔥",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Text(
            subtitle,
            style: const TextStyle(color: Colors.black54, fontSize: 16),
          ),

          const SizedBox(height: 25),

          /// ✅ VIDEO LIST
          if (subTopic.videoResources.isEmpty)
            const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text("No videos found for this topic."),
              ),
            )
          else
            ...subTopic.videoResources.map(
              (video) => _taskCard(
                context: context,
                icon: Icons.play_circle_fill,
                title: video.title,
                subtitle: "${video.duration} mins • Video Lesson",
                url: video.url,
                color: const Color(0xFF7A6BFF),
              ),
            ),

          const SizedBox(height: 30),

          /// ✅ MARK AS COMPLETE BUTTON
          GestureDetector(
            onTap: subTopic.isCompleted
                ? null
                : () async {
                    try {
                      await repository.markTaskComplete(
                        journeyId: journeyId,
                        subTopicId: subTopic.id,
                      );

                      if (!context.mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("✅ Task marked as complete"),
                        ),
                      );

                      /// ✅ SEND SUCCESS SIGNAL BACK TO ROADMAP
                      Navigator.pop(context, true);
                    } catch (e) {
                      if (!context.mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("❌ Failed: $e"),
                        ),
                      );
                    }
                  },
            child: Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: subTopic.isCompleted
                    ? const LinearGradient(
                        colors: [Colors.grey, Colors.grey],
                      )
                    : const LinearGradient(
                        colors: [Color(0xFF4A8CFF), Color(0xFF9B4CFF)],
                      ),
              ),
              child: Center(
                child: Text(
                  subTopic.isCompleted
                      ? "✅ Already Completed"
                      : "Mark Day as Complete",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// ✅ VIDEO CARD WITH URL LAUNCH
  Widget _taskCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required String url,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: InkWell(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Could not open video")),
            );
          }
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.15),
              ),
              child: Icon(icon, color: color, size: 26),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style:
                        const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
