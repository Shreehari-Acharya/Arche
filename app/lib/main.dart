import 'package:flutter/material.dart';
import 'signup.dart';       // Get Started → SignUpScreen
import 'login.dart';        // Sign In → LoginScreen

void main() {
  runApp(const ArcheApp());
}

class ArcheApp extends StatelessWidget {
  const ArcheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF5F3FF),
              Color(0xFFEFF1FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                /// LOGO + APP NAME
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6A5AE0), Color(0xFF9C4BFF)],
                        ),
                      ),
                      child: const Icon(Icons.auto_graph,
                          size: 40, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Arche",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// MAIN TITLE
                const Text(
                  "The place where\nlearning begins",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "AI-driven study platform with curated\nresources, smart notes, and active\nrevision tools",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.4,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 28),

                /// ⭐ GET STARTED → SIGN UP SCREEN
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 180,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4A8CFF), Color(0xFF9B4CFF)],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                /// ⭐ SIGN IN → LOGIN SCREEN
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 180,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                /// STUDY COMPANION LINK
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.picture_as_pdf,
                        size: 18, color: Color(0xFF8566FF)),
                    SizedBox(width: 8),
                    Text(
                      "Try Study Companion (Upload PDFs/PPTs)",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6A5AE0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.arrow_right_alt, color: Color(0xFF6A5AE0))
                  ],
                ),

                const SizedBox(height: 35),

                /// FEATURE CARDS
                const FeatureCard(
                  icon: Icons.menu_book,
                  title: "Topic-based resource discovery",
                  subtitle:
                      "Find curated learning materials tailored to your interests",
                ),
                const SizedBox(height: 16),

                const FeatureCard(
                  icon: Icons.psychology,
                  title: "AI study planner + smart notes",
                  subtitle: "Intelligent planning & note-taking powered by AI",
                ),
                const SizedBox(height: 16),

                const FeatureCard(
                  icon: Icons.flash_on,
                  title: "Instant revision system",
                  subtitle: "Quick quizzes & tests to reinforce learning",
                ),
                const SizedBox(height: 16),

                const FeatureCard(
                  icon: Icons.calendar_today,
                  title: "Daily reminders & streaks",
                  subtitle: "Stay consistent with smart reminders",
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// FEATURE CARD WIDGET
class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 18,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [Color(0xFF7A6BFF), Color(0xFFB36CFF)],
              ),
            ),
            child: Icon(icon, color: Colors.white, size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.3,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
