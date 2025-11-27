import 'package:flutter/material.dart';

class DailyTaskScreen extends StatelessWidget {
  const DailyTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F0FF),
      appBar: AppBar(
        title: const Text("Daily Learning Tasks"),
        backgroundColor: const Color(0xFF6A5AE0),
        elevation: 0,
      ),

      // ✅ USE LISTVIEW → NEVER OVERFLOWS
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "Finish these today 🔥",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Your AI-generated daily learning goals",
            style: TextStyle(color: Colors.black54),
          ),

          const SizedBox(height: 24),

          _taskCard(
            icon: Icons.code,
            title: "Python Basics",
            subtitle: "Introduction to Python programming",
            progress: 0.4,
            progressText: "2 / 5",
            color: const Color(0xFFFFC83D),
          ),

          _taskCard(
            icon: Icons.check_circle,
            title: "Linux Foundation",
            subtitle: "Terminal, commands & file system",
            progress: 1,
            progressText: "Completed",
            color: const Color(0xFF4CD964),
          ),

          _taskCard(
            icon: Icons.psychology,
            title: "Intro to AI/ML",
            subtitle: "Machine learning fundamentals",
            progress: 0.33,
            progressText: "1 / 3",
            color: const Color(0xFF7A6BFF),
          ),

          _taskCard(
            icon: Icons.web,
            title: "Web Development",
            subtitle: "HTML & CSS fundamentals",
            progress: 0.2,
            progressText: "1 / 5",
            color: const Color(0xFF58B2FF),
          ),

          const SizedBox(height: 30),

          // ✅ CTA ALWAYS VISIBLE WITH SCROLL
          SizedBox(
            height: 52,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A5AE0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Today's learning started 🚀"),
                  ),
                );
              },
              child: const Text(
                "Start Learning Now",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ✅ SAFE TASK CARD — NO FLEX OVERFLOW
  Widget _taskCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required double progress,
    required String progressText,
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.2),
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
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 10),

                progress == 1
                    ? const Text(
                        "Completed",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LinearProgressIndicator(
                            value: progress,
                            minHeight: 6,
                            backgroundColor: Colors.grey.shade200,
                            color: color,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            progressText,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
