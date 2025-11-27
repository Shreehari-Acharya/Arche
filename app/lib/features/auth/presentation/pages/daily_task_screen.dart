import 'package:flutter/material.dart';

class DailyTaskScreen extends StatelessWidget {
  const DailyTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Tasks"),
        backgroundColor: const Color(0xFF6A5AE0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF3F0FF), Color(0xFFEFF4FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Text(
              "Finish these today 🔥",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            const Text(
              "Stay consistent to build your streak!",
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 25),

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
              subtitle: "Basics of Linux terminal & commands",
              progress: 1,
              progressText: "Completed",
              color: const Color(0xFF4CD964),
            ),

            _taskCard(
              icon: Icons.psychology,
              title: "Intro to AI/ML",
              subtitle: "Fundamentals of machine learning",
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

            const Spacer(),

            // ✅ Bottom CTA Button
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Today's learning started 🚀"),
                  ),
                );
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
                    "Start Learning Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }

  // ✅ Daily Task Card Widget
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
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
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
