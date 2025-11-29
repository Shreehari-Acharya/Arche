import 'package:app/features/Dashboard/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';
import '../../../learningJourneys/presentation/pages/Course_list_screen.dart';
import '../../../summarizer/presentation/pages/summarize_screen.dart';
import 'arche_bottom_nav.dart';
import '../../../learningJourneys/presentation/pages/user_Prefernce.dart';

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
        return const DashboardScreen();
      case 1:
        return const CourseListScreen();
      case 3:
        return const SummarizeScreen();
      default:
        return const DashboardScreen();
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
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
      return; // prevent tab switch
    }

    setState(() => _currentIndex = index);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text('Arche')),

      body: _buildBody(),

      // Instagram-style Navbar
      bottomNavigationBar: ArcheBottomNav(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
