import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../data/datasources/document_remote_datasource.dart';
import '../../data/datasources/chat_websocket_datasource.dart';
import '../../data/repositories/document_repository_impl.dart';
import '../../data/repositories/chat_repository_impl.dart';
import '../widgets/history_card.dart';
import '../widgets/upload_card.dart';

class SummarizerScreen extends StatelessWidget {
  const SummarizerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color deepIndigo = Color(0xFF3F51B5); // Royal Blue / Deep Indigo

    // Initialize repositories
    final documentRepository = DocumentRepositoryImpl(
      remoteDataSource: DocumentRemoteDataSourceImpl(client: http.Client()),
    );

    final chatRepository = ChatRepositoryImpl(
      webSocketDataSource: ChatWebSocketDataSourceImpl(),
    );

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
          child: SingleChildScrollView(
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
                  repository: documentRepository,
                  chatRepository: chatRepository,
                ),

                const SizedBox(height: 24),

                // 3. History Section
                const Text(
                  "Previous Summaries",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),

                // History List Items
                const HistoryCard(
                  fileName: "Variables.pdf",
                  date: "Oct 26",
                  brandColor: deepIndigo,
                ),
                const SizedBox(height: 12),
                const HistoryCard(
                  fileName: "Calculus_Chapter_4.ppt",
                  date: "Oct 22",
                  brandColor: deepIndigo,
                ),
                const SizedBox(height: 12),
                const HistoryCard(
                  fileName: "History_Notes_101.pdf",
                  date: "Oct 19",
                  brandColor: deepIndigo,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
