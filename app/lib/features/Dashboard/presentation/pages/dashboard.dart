import 'package:flutter/material.dart';
import '../../../learningJourneys/data/models/learning_journey_model.dart';
import '../../../learningJourneys/data/repositories/learning_repository.dart';
import '../../../auth/presentation/bloc/auth_local.dart';
import '../../../learningJourneys/presentation/pages/Course_screen.dart';
import '../widgets/course_progress_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String userId = "";
  final LearningRepository repository = LearningRepository();

  /// We will store detailed journeys here
  Future<List<LearningJourney>>? _detailedJourneysFuture;

  @override
  void initState() {
    super.initState();
    _initDashboard();
  }

  Future<void> _initDashboard() async {
    final uid = await AuthLocal.getUserId() ?? "";
    if (!mounted) return;

    userId = uid;
    setState(() {
      _detailedJourneysFuture = _loadDetailedJourneys();
    });
  }

  /// 🔥 Loads ALL journeys + fetches full details for each
  Future<List<LearningJourney>> _loadDetailedJourneys() async {
    final journeys = await repository.getAllJourneys(userId);

    List<LearningJourney> detailed = [];

    for (final j in journeys) {
      final full = await repository.getJourneyDetails(userId, j.id);
      detailed.add(full);
    }

    return detailed;
  }

  void _reloadDashboard() {
    setState(() {
      _detailedJourneysFuture = _loadDetailedJourneys();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_detailedJourneysFuture == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FF),

      body: FutureBuilder<List<LearningJourney>>(
        future: _detailedJourneysFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final journeys = snapshot.data ?? [];

          if (journeys.isEmpty) {
            return const Center(child: Text("No learning journeys yet"));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome Back 👋",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),

                ...journeys.map((journey) {
                  final total = journey.subTopics.length;
                  final completed = journey.subTopics
                      .where((t) => t.isCompleted)
                      .length;

                  final double progress = total == 0 ? 0 : completed / total;

                  final int streak = _calculateStreak(journey.subTopics);

                  return GestureDetector(
                    onTap: () async {
                      final fullJourney = await repository.getJourneyDetails(
                        userId,
                        journey.id,
                      );

                      if (!mounted) return;

                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GeneratedRoadmapScreen(
                            journey: fullJourney,
                            repository: repository,
                            userId: userId,
                          ),
                        ),
                      );

                      _reloadDashboard(); // refresh UI after returning
                    },

                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CourseProgressCard(
                        courseName: journey.topicName,
                        completed: completed,
                        total: total == 0 ? 1 : total,
                        streak: streak,
                      ),
                    ),
                  );
                }),

                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Simple streak logic
  int _calculateStreak(List<SubTopic> topics) {
    int streak = 0;

    for (final t in topics) {
      if (t.isCompleted) {
        streak++;
      } else {
        break;
      }
    }

    return streak;
  }
}
