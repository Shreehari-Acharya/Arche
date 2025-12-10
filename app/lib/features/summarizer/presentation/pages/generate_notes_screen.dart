// lib/features/summarizer/presentation/pages/generate_notes_screen.dart
import 'package:flutter/material.dart';
import 'generate_notes_loading_screen.dart';

class GenerateNotesScreen extends StatelessWidget {
  final String fileName;
  final int sectionsCount;

  const GenerateNotesScreen({
    super.key,
    required this.fileName,
    required this.sectionsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F2FF),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Generate AI-Powered Notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 8),
            const Text(
              "Our AI will analyze your document and create concise notes for each section.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.menu_book, size: 36, color: Colors.purple),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(fileName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 6),
                              Text("$sectionsCount sections",
                                  style: const TextStyle(color: Colors.black54)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "What you'll get:\n• One-sentence summary per section\n• 3–6 key bullet points per section\n• Key terms and a downloadable version",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 26),
            ElevatedButton.icon(
              icon: const Icon(Icons.auto_awesome),
              label: const Text("Generate Notes Now"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              ),
              onPressed: () {
                // Open loading screen which will navigate to result (mocked)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GenerateNotesLoadingScreen(
                      fileName: fileName,
                      sectionsCount: sectionsCount,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
