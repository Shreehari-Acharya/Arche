import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FF),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          children: [
            const SizedBox(height: 10),

            // ---------------- WELCOME ----------------
            const Text(
              "Welcome back, Alex! 👋",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Ready to continue your learning journey?",
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 25),

            // PROGRESS CARD
            _progressCard(),
            const SizedBox(height: 30),

            // ---------------- WEEK ROADMAP ----------------
            const Text(
              "This Week's Roadmap",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 16),

            _roadmapCard(
              icon: Icons.menu_book,
              title: "Variables & Data Types",
              subtitle: "Day 1",
              status: "In Progress",
              statusColor: Color(0xFF32C682),
            ),
            const SizedBox(height: 16),

            _roadmapCard(
              icon: Icons.menu_book,
              title: "Control Flow",
              subtitle: "Day 2",
            ),
            const SizedBox(height: 16),

            _roadmapCard(
              icon: Icons.menu_book,
              title: "Functions",
              subtitle: "Day 3",
            ),

            const SizedBox(height: 30),

            // ---------------- QUICK ACCESS ----------------
            const Text(
              "Quick Access",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 18),

            _quickAccessCard(
              icon: Icons.calendar_today,
              color1: Color(0xFF6A7BFF),
              color2: Color(0xFF5A5FFF),
              title: "My Study Plan",
              subtitle: "Weekly roadmap & milestones",
            ),
            const SizedBox(height: 16),

            _quickAccessCard(
              icon: Icons.note,
              color1: Color(0xFFB36CFF),
              color2: Color(0xFF8B52FF),
              title: "Smart Notes",
              subtitle: "AI-powered study notes",
            ),
            const SizedBox(height: 16),

            _quickAccessCard(
              icon: Icons.flash_on,
              color1: Color(0xFFFF7A7A),
              color2: Color(0xFFFF4D4D),
              title: "Revision Tests",
              subtitle: "Quiz yourself instantly",
            ),
            const SizedBox(height: 16),

            _quickAccessCard(
              icon: Icons.videocam_rounded,
              color1: Color(0xFF7A6BFF),
              color2: Color(0xFF8E75FF),
              title: "Curated Videos",
              subtitle: "Handpicked learning content",
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------
  // PROGRESS CARD
  // ----------------------------------------------------
  Widget _progressCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TEXT
              Expanded(
                child: const Text(
                  "Your Progress\nWeek 2 of 4 • Python Fundamentals",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
              ),

              // STREAK BOX
              Container(
                width: 86,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE4E4),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: const [
                    Icon(Icons.local_fire_department,
                        color: Colors.orange, size: 26),
                    SizedBox(height: 4),
                    Text(
                      "7",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "day\nstreak",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Text(
            "Overall Progress",
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
          const SizedBox(height: 8),

          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: 0.45,
              minHeight: 8,
              backgroundColor: Colors.grey.shade300,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statusDot(Colors.green, "12 completed"),
              _statusDot(Colors.blue, "8 in progress"),
              _statusDot(Colors.grey, "7 upcoming"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusDot(Color color, String label) {
    return Row(
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  // ----------------------------------------------------
  // ROADMAP CARD
  // ----------------------------------------------------
  Widget _roadmapCard({
    required IconData icon,
    required String title,
    required String subtitle,
    String? status,
    Color? statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.04),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ICON
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF7A6BFF), Color(0xFF8F79FF)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),

          // TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    if (status != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: (statusColor ?? Colors.green).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: statusColor ?? Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------
  // QUICK ACCESS CARD
  // ----------------------------------------------------
  Widget _quickAccessCard({
    required IconData icon,
    required Color color1,
    required Color color2,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: [color1, color2]),
            ),
            child: Icon(icon, color: Colors.white, size: 26),
          ),
          const SizedBox(width: 16),

          // TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
