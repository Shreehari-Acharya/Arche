import 'package:flutter/material.dart' hide CarouselController;
import 'package:carousel_slider/carousel_slider.dart';
import '../../../learningJourneys/data/models/learning_journey_model.dart';
import '../../../learningJourneys/data/repositories/learning_repository.dart';
import '../../../auth/presentation/bloc/auth_local.dart';
import '../../../learningJourneys/presentation/pages/daily_task_screen.dart';
import '../widgets/course_card.dart';
import '../../../summarizer/domain/entities/document.dart';
import '../../../summarizer/data/datasources/document_remote_datasource.dart';
import '../../../summarizer/data/datasources/chat_remote_datasource.dart';
import '../../../summarizer/data/repositories/document_repository_impl.dart';
import '../../../summarizer/data/repositories/chat_repository_impl.dart';
import '../../../summarizer/presentation/widgets/history_card.dart';
import '../../../summarizer/presentation/pages/summary_page.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String userId = "";
  final LearningRepository repository = LearningRepository();
  final http.Client _httpClient = http.Client();
  late final DocumentRepositoryImpl _documentRepository;
  late final ChatRepositoryImpl _chatRepository;

  /// We will store detailed journeys here
  Future<List<LearningJourney>>? _detailedJourneysFuture;
  Future<List<Document>>? _documentHistoryFuture;
  int _currentCourseIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeRepositories();
    _initDashboard();
  }

  void _initializeRepositories() {
    _documentRepository = DocumentRepositoryImpl(
      remoteDataSource: DocumentRemoteDataSourceImpl(client: _httpClient),
    );
    _chatRepository = ChatRepositoryImpl(
      remoteDataSource: ChatRemoteDataSourceImpl(client: _httpClient),
    );
  }

  Future<void> _initDashboard() async {
    final uid = await AuthLocal.getUserId() ?? "";
    if (!mounted) return;

    userId = uid;
    setState(() {
      _detailedJourneysFuture = _loadDetailedJourneys();
      _documentHistoryFuture = _loadDocumentHistory();
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

  /// Load document history for summaries
  Future<List<Document>> _loadDocumentHistory() async {
    try {
      return await _documentRepository.getDocumentHistory(userId);
    } catch (e) {
      debugPrint('Error loading document history: $e');
      return [];
    }
  }

  void _reloadDashboard() {
    setState(() {
      _detailedJourneysFuture = _loadDetailedJourneys();
      _documentHistoryFuture = _loadDocumentHistory();
    });
  }

  /// Check if all subtopics in a journey are completed
  bool _isJourneyCompleted(LearningJourney journey) {
    if (journey.subTopics.isEmpty) return false;
    return journey.subTopics.every((subTopic) => subTopic.isCompleted);
  }

  Future<void> _openSummary(Document document) async {
    try {
      // Show loading
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // Fetch the summary
      final summary = await _documentRepository.getSummary(document.id, userId);

      if (mounted) {
        // Close loading dialog
        Navigator.of(context).pop();

        // Navigate to summary page
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SummaryPage(
              fileName: document.fileName,
              fileId: document.id,
              summary: summary,
              chatRepository: _chatRepository,
              userId: userId,
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop(); // Close loading dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load summary: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _httpClient.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_detailedJourneysFuture == null || _documentHistoryFuture == null) {
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

        child: FutureBuilder<List<dynamic>>(
          future: Future.wait([
            _detailedJourneysFuture!,
            _documentHistoryFuture!,
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            final allJourneys =
                snapshot.data?[0] as List<LearningJourney>? ?? [];
            final documentHistory = snapshot.data?[1] as List<Document>? ?? [];

            // Filter out completed journeys
            final activeJourneys = allJourneys
                .where((journey) => !_isJourneyCompleted(journey))
                .toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Courses Section
                  if (activeJourneys.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.celebration,
                              size: 80,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "All courses completed! 🎉",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Great job on finishing all your learning journeys!",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  else if (activeJourneys.length == 1)
                    // Single course - no carousel
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          CourseCard(
                            journey: activeJourneys[0],
                            onContinue: (subTopic) async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DailyTaskScreen(
                                    subTopic: subTopic,
                                    journeyId: activeJourneys[0].id,
                                    userId: userId,
                                    repository: repository,
                                  ),
                                ),
                              );

                              if (result == true) {
                                _reloadDashboard();
                              }
                            },
                            onDailyTaskTapped: (subTopic) async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DailyTaskScreen(
                                    subTopic: subTopic,
                                    journeyId: activeJourneys[0].id,
                                    userId: userId,
                                    repository: repository,
                                  ),
                                ),
                              );

                              if (result == true) {
                                _reloadDashboard();
                              }
                            },
                          ),
                        ],
                      ),
                    )
                  else
                    // Multiple courses - carousel
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        CarouselSlider.builder(
                          itemCount: activeJourneys.length,
                          itemBuilder: (context, index, realIndex) {
                            final journey = activeJourneys[index];
                            return CourseCard(
                              journey: journey,
                              onContinue: (subTopic) async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DailyTaskScreen(
                                      subTopic: subTopic,
                                      journeyId: journey.id,
                                      userId: userId,
                                      repository: repository,
                                    ),
                                  ),
                                );

                                if (result == true) {
                                  _reloadDashboard();
                                }
                              },
                              onDailyTaskTapped: (subTopic) async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DailyTaskScreen(
                                      subTopic: subTopic,
                                      journeyId: journey.id,
                                      userId: userId,
                                      repository: repository,
                                    ),
                                  ),
                                );

                                if (result == true) {
                                  _reloadDashboard();
                                }
                              },
                            );
                          },
                          options: CarouselOptions(
                            height: 400,
                            viewportFraction: 0.9,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlay: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentCourseIndex = index;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(activeJourneys.length, (
                            index,
                          ) {
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 4.0,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentCourseIndex == index
                                    ? const Color(0xFF4338CA)
                                    : Colors.grey.withOpacity(0.5),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),

                  // Previous Summaries Section
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Previous Summaries",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (documentHistory.isEmpty)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.history,
                                    size: 64,
                                    color: Colors.grey[400],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'No previous summaries',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          ...documentHistory.take(5).map((document) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: HistoryCard(
                                document: document,
                                brandColor: const Color(0xFF4338CA),
                                onTap: () => _openSummary(document),
                              ),
                            );
                          }).toList(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
