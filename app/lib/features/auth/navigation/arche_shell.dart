import 'package:flutter/material.dart';

import '../screens/courses_screen.dart';
import '../screens/notes_screen.dart';
import '../screens/roadmap_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/summarize_screen.dart';
import 'arche_bottom_nav.dart';
import 'arche_drawer.dart';

// Onboarding is directly under lib/
import 'package:app/onboarding.dart';

class ArcheShell extends StatefulWidget {
  const ArcheShell({super.key});

  @override
  State<ArcheShell> createState() => _ArcheShellState();
}

class _ArcheShellState extends State<ArcheShell> {
  int _currentIndex = 0;

  // -------------------------------
  // MAIN SCREENS (Tabs)
  // -------------------------------
  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const CoursesScreen();
      case 1:
        return const NotesScreen();
      case 3:
        return const RoadmapScreen();
      case 4:
        return const ProfileScreen();
      default:
        return const CoursesScreen();
    }
  }

  // -------------------------------
  // When a tab is selected
  // -------------------------------
  void _onTabSelected(int index) {
    // ----------------------------------------
    // Special case: + Button (index = 2)
    // Opens Onboarding and DOES NOT change tab
    // ----------------------------------------
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        ),
      );
      return; // prevent tab switch
    }

    setState(() => _currentIndex = index);
  }

  // -------------------------------
  // Drawer navigation
  // -------------------------------
  void _openSummarize() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SummarizeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ArcheDrawer(
        onDashboardTap: () {
          Navigator.pop(context);
          setState(() => _currentIndex = 0);
        },
        onLearningJourneyTap: () {
          Navigator.pop(context);
          setState(() => _currentIndex = 3); // roadmap tab
        },
        onSummarizeTap: () {
          Navigator.pop(context);
          _openSummarize();
        },
        onProfileTap: () {
          Navigator.pop(context);
          setState(() => _currentIndex = 4);
        },
      ),

      appBar: AppBar(
        elevation: 0,
        title: const Text('Arche'),
      ),

      body: _buildBody(),

      // Instagram-style Navbar
      bottomNavigationBar: ArcheBottomNav(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
