import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/models/learning_journey_model.dart';

class VideoPlayerScreen extends StatelessWidget {
  final SubTopic subTopic;

  const VideoPlayerScreen({super.key, required this.subTopic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Videos"),
      ),
      body: subTopic.videoResources.isEmpty
          ? const Center(child: Text("No videos found for this day"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: subTopic.videoResources.length,
              itemBuilder: (context, index) {
                final video = subTopic.videoResources[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const Icon(Icons.play_circle_fill, size: 36),
                    title: Text(video.title),
                    subtitle: Text("${video.duration} mins"),
                    trailing: const Icon(Icons.launch),
                    onTap: () async {
                      final uri = Uri.parse(video.url);

                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Could not open video")),
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
