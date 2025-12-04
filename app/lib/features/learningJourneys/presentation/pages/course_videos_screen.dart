import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/models/learning_journey_model.dart';

class CourseVideosScreen extends StatelessWidget {
  final LearningJourney journey;

  const CourseVideosScreen({
    super.key,
    required this.journey,
  });

  @override
  Widget build(BuildContext context) {
    final subTopics = journey.subTopics ?? [];

    final allVideos = subTopics
        .expand((sub) => sub.videoResources)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(journey.topicName),
      ),
      body: allVideos.isEmpty
          ? const Center(child: Text("No videos found for this course"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: allVideos.length,
              itemBuilder: (context, index) {
                final video = allVideos[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const Icon(Icons.play_circle_fill,
                        color: Colors.deepPurple, size: 32),
                    title: Text(video.title),
                    subtitle: Text("${video.duration} mins"),
                    trailing: const Icon(Icons.open_in_new),

                    onTap: () async {
                      final uri = Uri.parse(video.url);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                  ),
                );
              },
            ),
    );
  }
}
