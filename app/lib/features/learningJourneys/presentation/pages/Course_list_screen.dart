import 'package:flutter/material.dart';
import '../../data/repositories/learning_repository.dart';
import '../../data/models/learning_journey_model.dart';
import 'Course_screen.dart';
import '../../../auth/presentation/bloc/auth_local.dart';
import '../../../Dashboard/presentation/widgets/course_progress_card.dart';

class CourseListScreen extends StatefulWidget {
  final LearningRepository repository;

  const CourseListScreen({super.key, required this.repository});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  String userId = '';
  Future<List<LearningJourney>>? _detailedJourneysFuture;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final uid = await AuthLocal.getUserId() ?? '';
    if (!mounted) return;
    setState(() {
      userId = uid;
      _detailedJourneysFuture = _loadDetailedJourneys();
    });
  }

  Future<List<LearningJourney>> _loadDetailedJourneys() async {
    final journeys = await widget.repository.getAllJourneys(userId);
    final detailed = <LearningJourney>[];
    for (final j in journeys) {
      final full = await widget.repository.getJourneyDetails(userId, j.id);
      detailed.add(full);
    }
    return detailed;
  }

  Future<void> _refresh() async {
    setState(() {
      _detailedJourneysFuture = _loadDetailedJourneys();
    });
  }

  /*int _calculateStreak(List<SubTopic> topics) {
    int streak = 0;
    for (final t in topics) {
      if (t.isCompleted) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }*/

  @override
  Widget build(BuildContext context) {
    if (_detailedJourneysFuture == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: FutureBuilder<List<LearningJourney>>(
        future: _detailedJourneysFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Failed to load courses\n${snapshot.error}",
                textAlign: TextAlign.center,
              ),
            );
          }

          final journeys = snapshot.data ?? [];

          if (journeys.isEmpty) {
            return const Center(child: Text("No courses yet"));
          }

          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: journeys.length,
              itemBuilder: (context, index) {
                final journey = journeys[index];
                /*final total = journey.subTopics.length;
                final completed = journey.subTopics
                    .where((t) => t.isCompleted)
                    .length;
                final streak = _calculateStreak(journey.subTopics);*/

                return GestureDetector(
                  onTap: () async {
                    try {
                      final detailed = await widget.repository
                          .getJourneyDetails(userId, journey.id);

                      if (!mounted) return;

                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GeneratedRoadmapScreen(
                            journey: detailed,
                            repository: widget.repository,
                            userId: userId,
                          ),
                        ),
                      );

                      _refresh();
                    } catch (e) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Failed to open course: $e")),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CourseProgressCard(
                      journey: journey,
                      onContinue: (subTopic) async {
                        // This is the same logic from your GestureDetector's onTap
                        try {
                          final detailed = await widget.repository
                              .getJourneyDetails(userId, journey.id);

                          if (!mounted) return;

                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => GeneratedRoadmapScreen(
                                journey: detailed,
                                repository: widget.repository,
                                userId: userId,
                              ),
                            ),
                          );

                          _refresh();
                        } catch (e) {
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Failed to open course: $e"),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
