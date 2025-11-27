import 'package:flutter/material.dart';
import '../../data/models/learning_journey_model.dart'; 
import 'daily_task_screen.dart';

class GeneratedRoadmapScreen extends StatelessWidget {
  final LearningJourney journey;

  const GeneratedRoadmapScreen({
    super.key,
    required this.journey,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF4A8CFF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "AI Generated Roadmap",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _profileCard(),
          const SizedBox(height: 24),
          _generatedRoadmap(),
          const SizedBox(height: 30),

          // START LEARNING BUTTON
          GestureDetector(
            onTap: () {
              // Check if subtopics exist
              if (journey.subTopics != null && journey.subTopics!.isNotEmpty) {
                // Navigate to Daily Task Screen with Day 1 Data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DailyTaskScreen(
                      subTopic: journey.subTopics![0], 
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("No topics available in this journey")),
                );
              }
            },
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Color(0xFF4A8CFF), Color(0xFF9B4CFF)],
                ),
              ),
              child: const Center(
                child: Text(
                  "Start Learning 🚀",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Learning Journey",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),

          _infoRow("Topic", journey.topicName),
          _infoRow("Days", "${journey.subTopics?.length ?? 0} Days"),
          _infoRow("Created", journey.createdAt.split('T')[0]),
        ],
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _generatedRoadmap() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Weekly Plan",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 18),

          if (journey.subTopics != null)
            ...journey.subTopics!.map(
              (subTopic) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 20,
                      color: Color(0xFF6A5AE0),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        // Extract just the title part if formatted like "Day 1: Title"
                        subTopic.description.contains(':') 
                            ? subTopic.description.split(':')[1].trim()
                            : subTopic.description, 
                        style: const TextStyle(fontSize: 15, height: 1.3),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            const Text("No plan generated yet."),
        ],
      ),
    );
  }
}