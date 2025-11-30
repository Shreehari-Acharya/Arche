import 'package:flutter/material.dart';
import '../../data/models/learning_journey_model.dart';
// import 'package:url_launcher/url_launcher.dart'; // Add this to pubspec.yaml to open links

class DailyTaskScreen extends StatelessWidget {
  final SubTopic subTopic; 

  const DailyTaskScreen({super.key, required this.subTopic});

  @override
  Widget build(BuildContext context) {
    // Basic string parsing to separate "Day 1" from the actual topic description
    final parts = subTopic.description.split(':');
    final String title = parts.isNotEmpty ? parts[0] : "Daily Task";
    final String subtitle = parts.length > 1 ? parts[1].trim() : subTopic.description;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F0FF),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF6A5AE0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
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

          // Dynamic Video List
          if (subTopic.videoResources.isEmpty)
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(child: Text("No videos found for this topic.")),
            )
          else
            ...subTopic.videoResources.map((video) => _taskCard(
              icon: Icons.play_circle_fill,
              title: video.title,
              subtitle: "${video.duration} mins • Video Lesson",
              url: video.url,
              color: const Color(0xFF7A6BFF),
            )),

          const SizedBox(height: 30),

          // Bottom CTA
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Great job! Day marked as complete."),
                ),
              );
              Navigator.pop(context); // Go back to Roadmap or Dashboard
            },
            child: Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Color(0xFF4A8CFF), Color(0xFF9B4CFF)],
                ),
              ),
              child: const Center(
                child: Text(
                  "Mark Day as Complete",
                  style: TextStyle(
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

  Widget _taskCard({
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
        onTap: () {
          // TODO: Implement actual URL Launching here
          debugPrint("Launching URL: $url"); 
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
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
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