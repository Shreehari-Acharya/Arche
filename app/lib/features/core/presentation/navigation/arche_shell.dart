import 'package:app/features/Dashboard/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';
import '../../../learningJourneys/presentation/pages/Course_list_screen.dart';
import '../../../summarizer/presentation/pages/summarizer_screen.dart';
import 'arche_bottom_nav.dart';
import '../../../learningJourneys/presentation/pages/user_Prefernce.dart';
import '../../../learningJourneys/data/repositories/learning_repository.dart';
import '../../../auth/presentation/bloc/auth_local.dart';

class ArcheShell extends StatefulWidget {
  const ArcheShell({super.key});

  @override
  State<ArcheShell> createState() => _ArcheShellState();
}

class _ArcheShellState extends State<ArcheShell> {
  int _currentIndex = 0;

  String? _token;
  LearningRepository? _repo;

  @override
  void initState() {
    super.initState();
    _initRepo();
  }

  Future<void> _initRepo() async {
    final token = await AuthLocal.getToken();
    setState(() {
      _token = token ?? '';
      _repo = LearningRepository(authToken: _token);
    });
  }

  // -------------------------------
  // MAIN SCREENS (Tabs)
  // -------------------------------
  Widget _buildBody() {
    if (_repo == null) {
      return const Center(child: CircularProgressIndicator());
    }
    switch (_currentIndex) {
      case 0:
        return const DashboardScreen();
      case 1:
        return CourseListScreen(repository: _repo!);
      case 2:
        return const OnboardingScreen();
      case 3:
        return const SummarizerScreen();
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
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'lib/assets/logo.png',
          height: 25, // Adjust the height as needed
        ),
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
