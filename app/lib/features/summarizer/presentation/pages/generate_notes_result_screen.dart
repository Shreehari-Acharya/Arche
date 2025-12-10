// lib/features/summarizer/presentation/pages/generate_notes_result_screen.dart
import 'package:flutter/material.dart';
import 'generate_notes_loading_screen.dart';

class GeneratedSection {
  final String title;
  final String summary;
  final List<String> keyPoints;
  final List<String> keyTerms;

  GeneratedSection({
    required this.title,
    required this.summary,
    required this.keyPoints,
    required this.keyTerms,
  });
}

class GenerateNotesResultScreen extends StatelessWidget {
  final String fileName;
  final List<GeneratedSection> sections;

  const GenerateNotesResultScreen({
    super.key,
    required this.fileName,
    required this.sections,
  });

  void _downloadAll(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Download started (mock)."),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F2FF),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: const Text("Smart Notes"),
        actions: [
          TextButton.icon(
            onPressed: () => _downloadAll(context),
            icon: const Icon(Icons.download, color: Colors.white),
            label: const Text("Download Notes",
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header box
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Row(
                children: [
                  const Icon(Icons.menu_book, color: Colors.deepPurple, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fileName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 6),
                        const Text("Notes Generated Successfully!",
                            style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Sections list
            Column(
              children: sections.map((s) => _sectionCard(context, s)).toList(),
            ),

            const SizedBox(height: 20),
            // Regenerate + Download buttons area
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Simulate regenerate by going to loading screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GenerateNotesLoadingScreen(
                            fileName: fileName,
                            sectionsCount: sections.length,
                          ),
                        ),
                      );
                    },
                    child: const Text("Regenerate Notes"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _downloadAll(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple),
                    child: const Text("Download All Notes"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionCard(BuildContext context, GeneratedSection s) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFA46CFF), Color(0xFF617AFF)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.article, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      s.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Summary
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  s.summary,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
              const SizedBox(height: 10),
              const Text("Key Points",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: s.keyPoints
                    .asMap()
                    .entries
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.deepPurple.shade50,
                                child: Text("${e.key + 1}",
                                    style:
                                        const TextStyle(color: Colors.deepPurple)),
                              ),
                              const SizedBox(width: 8),
                              Expanded(child: Text(e.value)),
                            ],
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 8),
              const Text("Key Terms",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: s.keyTerms
                    .map((term) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.shade50,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            term,
                            style: const TextStyle(color: Colors.deepPurple),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
