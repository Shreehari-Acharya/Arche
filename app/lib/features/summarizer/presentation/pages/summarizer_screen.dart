import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../data/datasources/document_remote_datasource.dart';
import '../../data/datasources/chat_remote_datasource.dart';
import '../../data/repositories/document_repository_impl.dart';
import '../../data/repositories/chat_repository_impl.dart';
import '../../domain/entities/document.dart';
import '../widgets/history_card.dart';
import '../widgets/upload_card.dart';
import '../../../auth/presentation/bloc/auth_local.dart';
import 'summary_page.dart';

class SummarizerScreen extends StatefulWidget {
  const SummarizerScreen({super.key});

  @override
  State<SummarizerScreen> createState() => _SummarizerScreenState();
}

class _SummarizerScreenState extends State<SummarizerScreen> {
  final http.Client _httpClient = http.Client();
  late final DocumentRepositoryImpl _documentRepository;
  late final ChatRepositoryImpl _chatRepository;
  
  List<Document> _documentHistory = [];
  bool _isLoadingHistory = false;
  String? _userId;

  @override
  void initState() {
    super.initState();
    _initializeRepositories();
    _loadUserIdAndHistory();
  }

  void _initializeRepositories() {
    _documentRepository = DocumentRepositoryImpl(
      remoteDataSource: DocumentRemoteDataSourceImpl(client: _httpClient),
    );
    _chatRepository = ChatRepositoryImpl(
      remoteDataSource: ChatRemoteDataSourceImpl(client: _httpClient),
    );
  }

  Future<void> _loadUserIdAndHistory() async {
    final userId = await AuthLocal.getUserId();
    if (userId != null && mounted) {
      setState(() {
        _userId = userId;
      });
      await _fetchDocumentHistory();
    }
  }

  Future<void> _fetchDocumentHistory() async {
    if (_userId == null) return;

    setState(() {
      _isLoadingHistory = true;
    });

    try {
      final history = await _documentRepository.getDocumentHistory(_userId!);
      if (mounted) {
        setState(() {
          _documentHistory = history;
          _isLoadingHistory = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingHistory = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load history: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _openSummary(Document document) async {
    if (_userId == null) return;

    try {
      // Show loading
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      // Fetch the summary
      final summary = await _documentRepository.getSummary(
        document.id,
        _userId!,
      );

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
              userId: _userId!,
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
    const Color deepIndigo = Color(0xFF3F51B5);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [deepIndigo.withValues(alpha: 0.9), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.6],
          ),
        ),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: _fetchDocumentHistory,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Main Header
                  const Text(
                    "Upload & Summarize",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // 2. Upload Section Card
                  UploadCard(
                    brandColor: deepIndigo,
                    repository: _documentRepository,
                    chatRepository: _chatRepository,
                    onUploadComplete: _fetchDocumentHistory, // Pass callback to refresh history
                  ),

                  const SizedBox(height: 24),

                  // 3. History Section Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Previous Summaries",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      if (_isLoadingHistory)
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // 4. History List
                  if (_documentHistory.isEmpty && !_isLoadingHistory)
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
                    ..._documentHistory.map((document) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: HistoryCard(
                          document: document,
                          brandColor: deepIndigo,
                          onTap: () => _openSummary(document),
                        ),
                      );
                    }).toList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
