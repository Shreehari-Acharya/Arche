import 'package:flutter/material.dart';
import '../../data/repositories/learning_repository.dart';
import '../../data/models/learning_journey_model.dart';
import 'generated_roadmap_screen.dart';

class CourseListScreen extends StatefulWidget {
  final LearningRepository repository;

  // ✅ DO NOT USE const here because repository is runtime injected
  CourseListScreen({
    super.key,
    required this.repository,
  });

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  // ✅ TEMP USER (replace later with AuthLocal)
  final String userId = "cmieugm7s0000uye0jzmwhgut";

  late Future<List<LearningJourney>> _journeysFuture;

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  void _loadCourses() {
    _journeysFuture = widget.repository.getAllJourneys(userId);
  }

  Future<void> _refresh() async {
    setState(() {
      _loadCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ongoing Courses"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<LearningJourney>>(
        future: _journeysFuture,
        builder: (context, snapshot) {
          // ✅ LOADING STATE
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ✅ ERROR STATE
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Failed to load courses\n${snapshot.error}",
                textAlign: TextAlign.center,
              ),
            );
          }

          final journeys = snapshot.data ?? [];

          // ✅ EMPTY STATE
          if (journeys.isEmpty) {
            return const Center(child: Text("No courses yet"));
          }

          // ✅ COURSE LIST
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: journeys.length,
              itemBuilder: (context, index) {
                final journey = journeys[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(
                      Icons.school,
                      color: Colors.deepPurple,
                    ),
                    title: Text(
                      journey.topicName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "Created on ${journey.createdAt}",
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: const Icon(Icons.chevron_right),

                    // ✅ OPEN BACKEND-POWERED ROADMAP
                    onTap: () async {
                      try {
                        final detailed = await widget.repository
                            .getJourneyDetails(
                          userId,
                          journey.id,
                        );

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

                        // ✅ AUTO REFRESH AFTER MARKING TASKS COMPLETE
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
                );
              },
            ),
          );
        },
      ),
    );
  }
}
