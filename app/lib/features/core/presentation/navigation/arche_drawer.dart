import 'package:flutter/material.dart';

class ArcheDrawer extends StatelessWidget {
  final VoidCallback onDashboardTap;
  final VoidCallback onLearningJourneyTap;
  final VoidCallback onSummarizeTap;
  final VoidCallback onProfileTap;

  const ArcheDrawer({
    super.key,
    required this.onDashboardTap,
    required this.onLearningJourneyTap,
    required this.onSummarizeTap,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Arche',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.dashboard_outlined),
              title: const Text('Dashboard'),
              onTap: onDashboardTap,
            ),
            ListTile(
              leading: const Icon(Icons.timeline_outlined),
              title: const Text('Learning Journey'),
              onTap: onLearningJourneyTap,
            ),
            ListTile(
              leading: const Icon(Icons.summarize_outlined),
              title: const Text('Summarize'),
              onTap: onSummarizeTap,
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profile'),
              onTap: onProfileTap,
            ),
          ],
        ),
      ),
    );
  }
}
