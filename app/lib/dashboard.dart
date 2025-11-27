import 'package:flutter/material.dart';
import 'features/learning/data/models/learning_journey_model.dart';
import 'features/learning/data/repositories/learning_repository.dart';
// ✅ Import the Roadmap Screen
import 'features/learning/presentation/pages/generated_roadmap_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final LearningRepository _repository = LearningRepository();
  late Future<List<LearningJourney>> _journeysFuture;

  // ⚠️ Replace with the actual logged-in userId
  final String _userId = "cmi4kz1610000ijnmm3jun0l9"; 

  @override
  void initState() {
    super.initState();
    _journeysFuture = _repository.getAllJourneys(_userId);
  }

  // ✅ NEW: Function to handle Card Tap
  void _openJourney(LearningJourney summaryItem) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // 1. Fetch full details (subTopics, videos) from API
      final fullJourney = await _repository.getJourneyDetails(_userId, summaryItem.id);

      // 2. Close loading dialog
      if (mounted) Navigator.pop(context);

      // 3. Navigate to Roadmap Screen with FULL data
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => GeneratedRoadmapScreen(journey: fullJourney),
          ),
        );
      }
    } catch (e) {
      // Close loading dialog on error
      if (mounted) Navigator.pop(context);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error opening journey: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FF),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _journeysFuture = _repository.getAllJourneys(_userId);
            });
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            children: [
              const SizedBox(height: 10),
              const Text("Welcome back! 👋",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              const Text("Ready to continue your learning journey?",
                  style: TextStyle(fontSize: 15, color: Colors.black54)),
              const SizedBox(height: 25),

              _progressCard(),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Your Learning Journeys",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  Text("View All →",
                      style: TextStyle(fontSize: 14, color: Color(0xFF6A5AE0), fontWeight: FontWeight.w600))
                ],
              ),
              const SizedBox(height: 16),

              // ---------------------------------------------
              // ✅ DYNAMIC LIST FROM API
              // ---------------------------------------------
              FutureBuilder<List<LearningJourney>>(
                future: _journeysFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return _emptyStateCard();
                  }

                  return Column(
                    children: snapshot.data!.map((journey) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: _roadmapCard(
                          icon: Icons.school,
                          title: journey.topicName,
                          subtitle: "Created: ${journey.createdAt.split('T')[0]}",
                          onTap: () => _openJourney(journey), // ✅ Calls API on tap
                        ),
                      );
                    }).toList(),
                  );
                },
              ),

              const SizedBox(height: 30),
              // ... Quick Access Cards (same as before) ...
            ],
          ),
        ),
      ),
    );
  }

  // ... (Keep _progressCard, _roadmapCard, _quickAccessCard, _emptyStateCard exactly as before) ...
  
  // Re-pasting _roadmapCard just for clarity on where onTap goes:
  Widget _roadmapCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF7A6BFF), Color(0xFF8F79FF)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
  
  Widget _progressCard() {
    // ... paste your previous progress card code here ...
    return Container(height: 100, color: Colors.grey[200], child: Center(child: Text("Progress Card Placeholder")));
  }
  
  Widget _emptyStateCard() {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(child: Text("No journeys yet. Create one!")),
    );
  }
}