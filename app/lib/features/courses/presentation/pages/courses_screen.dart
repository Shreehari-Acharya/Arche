import 'package:flutter/material.dart';
import '../../../core/presentation/widgets/welcome_header.dart';
import '../../../core/presentation/widgets/feature_card.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: const [
          WelcomeHeader(),
          FeatureCard(
            icon: Icons.menu_book_rounded,
            title: 'Curated Study Resources',
            subtitle:
                'High-quality YouTube videos and articles organized for your topic.',
          ),
          FeatureCard(
            icon: Icons.psychology_rounded,
            title: 'AI Smart Notes & Mindmaps',
            subtitle:
                'Summaries, notes, and mindmaps generated from your PDFs.',
          ),
          FeatureCard(
            icon: Icons.calendar_today_rounded,
            title: 'Personal Weekly Roadmap',
            subtitle:
                'A structured personalized course for your learning goals.',
          ),
        ],
      ),
    );
  }
}
