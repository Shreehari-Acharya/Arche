import 'package:flutter/material.dart';
import '../../data/models/learning_journey_model.dart';
import '../../data/repositories/learning_repository.dart';
import 'daily_task_screen.dart';

class GeneratedRoadmapScreen extends StatefulWidget {
  final LearningJourney journey;
  final LearningRepository repository;
  final String userId;

  const GeneratedRoadmapScreen({
    super.key,
    required this.journey,
    required this.repository,
    required this.userId,
  });

  @override
  State<GeneratedRoadmapScreen> createState() =>
      _GeneratedRoadmapScreenState();
}

class _GeneratedRoadmapScreenState extends State<GeneratedRoadmapScreen> {
  late LearningJourney _journey;

  @override
  void initState() {
    super.initState();
    _journey = widget.journey;
  }

  /// ✅ Reload Journey After Task Completion
  Future<void> _reloadJourney() async {
    final updated = await widget.repository.getJourneyDetails(
      widget.userId,
      _journey.id,
    );

    if (!mounted) return;

    setState(() {
      _journey = updated;
    });
  }

  @override
  Widget build(BuildContext context) {
    final subTopics = _journey.subTopics ?? [];

    final completedCount =
        subTopics.where((task) => task.isCompleted).length;

    final totalCount = subTopics.length;

    final progress =
        totalCount == 0 ? 0.0 : completedCount / totalCount;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F0FF),
      appBar: AppBar(
        title: Text(_journey.topicName),
        backgroundColor: const Color(0xFF6A5AE0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Column(
        children: [
          /// ✅ PROGRESS HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6A5AE0), Color(0xFF9D6CFF)],
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(28),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Roadmap",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$completedCount / $totalCount days completed",
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white24,
                  color: Colors.white,
                  minHeight: 6,
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// ✅ TASK LIST
          Expanded(
            child: subTopics.isEmpty
                ? const Center(child: Text("No roadmap generated yet."))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: subTopics.length,
                    itemBuilder: (context, index) {
                      final task = subTopics[index];
                      final isDone = task.isCompleted;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: isDone
                                ? Colors.green
                                : Colors.deepPurple.shade100,
                            child: Icon(
                              isDone ? Icons.check : Icons.play_arrow,
                              color: isDone
                                  ? Colors.white
                                  : Colors.deepPurple,
                            ),
                          ),

                          title: Text(
                            "Day ${index + 1}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          subtitle: Text(task.description),

                          trailing: const Icon(Icons.chevron_right),

                          enabled: !isDone,

                          /// ✅ OPEN DAILY TASK PAGE
                          onTap: isDone
                              ? null
                              : () async {
                                  final refresh =
                                      await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => DailyTaskScreen(
                                        subTopic: task,
                                        userId: widget.userId,
                                        journeyId: _journey.id,
                                        repository:
                                            widget.repository,
                                      ),
                                    ),
                                  );

                                  /// ✅ AUTO-REFRESH WHEN COMING BACK
                                  if (refresh == true) {
                                    await _reloadJourney();
                                  }
                                },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
