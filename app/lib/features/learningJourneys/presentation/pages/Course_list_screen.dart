import 'package:flutter/material.dart';
import '../../data/repositories/learning_repository.dart';
import '../../data/models/learning_journey_model.dart';
import '../../../auth/presentation/bloc/auth_local.dart';
import '../widgets/Course_card.dart';

class CourseListScreen extends StatefulWidget {
  final String userId = "cmikhub6a00bh6mmvazs2emim";
  final LearningRepository repository;

  const CourseListScreen({super.key, required this.repository});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  late Future<List<LearningJourney>> _journeysFuture;

  @override
  void initState() {
    super.initState();
    _journeysFuture = widget.repository.getAllJourneys(widget.userId);
  }

  Future<void> _refresh() async {
    setState(() {
      _journeysFuture = widget.repository.getAllJourneys(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ongoing Courses')),
      body: FutureBuilder<List<LearningJourney>>(
        future: _journeysFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Failed to load courses.\n${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          final journeys = snapshot.data ?? [];
          if (journeys.isEmpty) {
            return const Center(child: Text('No ongoing courses.'));
          }
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              itemCount: journeys.length,
              itemBuilder: (context, index) {
                final journey = journeys[index];
                return CourseCard(
                  journey: journey,
                  onTap: () async {
                    // Optionally fetch details on tap using repository route
                    try {
                      final details = await widget.repository.getJourneyDetails(
                        widget.userId,
                        journey.id,
                      );
                      // Navigate to a detail page if you have one
                      // Navigator.pushNamed(context, '/journeyDetail', arguments: details);
                      // For now, show a simple bottom sheet with summary
                      if (!mounted) return;
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  details.topicName,
                                  style: Theme.of(ctx).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 8),
                                Text('Created: ${details.createdAt}'),
                                const SizedBox(height: 12),
                                Text(
                                  'Subtopics: ${details.subTopics?.length ?? 0}',
                                ),
                                const SizedBox(height: 12),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () => Navigator.pop(ctx),
                                    child: const Text('Close'),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } catch (e) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error fetching details: $e')),
                      );
                    }
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
