import 'package:flutter/material.dart';
import '../../../learningJourneys/data/models/learning_journey_model.dart';
import '../../../learningJourneys/data/repositories/learning_repository.dart';
import '../../../auth/presentation/bloc/auth_local.dart';
import '../../../learningJourneys/presentation/pages/Course_screen.dart';
import '../widgets/course_progress_card.dart';
import '../widgets/daily_schedule_card.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4338CA), Colors.white],
          ),
        ),
        child: FutureBuilder<List<LearningJourney>>(
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
                  // This is where the DailyScheduleCard will be added for each journey
                  ...journeys.map((journey) {
                    // This GestureDetector wraps the entire entry for a single journey
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
                      // Using a Column to stack the cards vertically
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CourseProgressCard(
                            journey: journey,
                            onContinue: () async {
                              final fullJourney = await repository
                                  .getJourneyDetails(userId, journey.id);

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
                          ),
                          const SizedBox(height: 20),
                          // Title for the daily schedule
                          const Text(
                            "Your Journey at a Glance",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Displaying the DailyScheduleCard here with the journey data
                          DailyScheduleCard(journey: journey),
                          const SizedBox(
                            height: 30,
                          ), // Spacing between journey sections
                        ],
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        ),
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
