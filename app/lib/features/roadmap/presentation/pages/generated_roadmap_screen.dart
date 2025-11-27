import 'package:flutter/material.dart';
import '../../../tasks/presentation/pages/daily_task_screen.dart';

class GeneratedRoadmapScreen extends StatelessWidget {
  final List<String> topics;
  final String skillLevel;
  final String language;
  final int studyHours;
  final String timePeriod;

  const GeneratedRoadmapScreen({
    super.key,
    required this.topics,
    required this.skillLevel,
    required this.language,
    required this.studyHours,
    required this.timePeriod,
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

          // ✅ START LEARNING BUTTON → GO TO DAILY TASKS
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const DailyTaskScreen(),
                ),
              );
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

  // --------------------------------------------------
  // ✅ PROFILE SUMMARY CARD
  // --------------------------------------------------
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
            "Your Learning Profile",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),

          _infoRow("Topics", topics.join(", ")),
          _infoRow("Skill Level", skillLevel),
          _infoRow("Language", language),
          _infoRow("Study Hours", "$studyHours hrs/day"),
          _infoRow("Duration", timePeriod),
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
            width: 120,
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
              value.isEmpty ? "Not provided" : value,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------
  // ✅ GENERATED ROADMAP (VISUAL TIMELINE)
  // --------------------------------------------------
  Widget _generatedRoadmap() {
    final roadmapSteps = [
      "Introduction & Setup",
      "Core Concepts",
      "Hands-on Practice",
      "Advanced Topics",
      "Mini Project",
      "Revision",
      "Final Assessment",
    ];

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
            "Your AI Weekly Plan",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 18),

          ...roadmapSteps.map(
            (step) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 20,
                    color: Color(0xFF6A5AE0),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      step,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFE9F7F3),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFF46C38B)),
            ),
            child: const Text(
              "✅ You got this! Stay consistent and complete your learning journey on time.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F7A52),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
