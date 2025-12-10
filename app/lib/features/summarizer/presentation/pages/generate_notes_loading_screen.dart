// lib/features/summarizer/presentation/pages/generate_notes_loading_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'generate_notes_result_screen.dart';

class GenerateNotesLoadingScreen extends StatefulWidget {
  final String fileName;
  final int sectionsCount;

  const GenerateNotesLoadingScreen({
    super.key,
    required this.fileName,
    required this.sectionsCount,
  });

  @override
  State<GenerateNotesLoadingScreen> createState() =>
      _GenerateNotesLoadingScreenState();
}

class _GenerateNotesLoadingScreenState
    extends State<GenerateNotesLoadingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _dots;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900))
      ..repeat();
    _dots = StepTween(begin: 1, end: 3).animate(_controller);

    // Mock processing delay, then navigate to result screen with mock data
    Timer(const Duration(seconds: 2), _onProcessingComplete);
  }

  void _onProcessingComplete() {
    // Create mock generated notes data:
    final mockSections = List.generate(widget.sectionsCount, (index) {
      final idx = index + 1;
      return GeneratedSection(
        title: "Section $idx: Example Title",
        summary:
            "One-sentence summary for section $idx. This captures the main idea succinctly.",
        keyPoints: [
          "Key point 1 for section $idx",
          "Key point 2 for section $idx",
          "Key point 3 for section $idx",
        ],
        keyTerms: ["term${idx}A", "term${idx}B"],
      );
    });

    // Navigate (replace) to result page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => GenerateNotesResultScreen(
          fileName: widget.fileName,
          sections: mockSections,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCardContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFFB57CFF), Color(0xFF6D82FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(Icons.auto_awesome, color: Colors.white, size: 32),
        ),
        const SizedBox(height: 18),
        const Text(
          "Generating Smart Notes",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "AI is analyzing your document and creating comprehensive study notes...",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 18),
        AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            final dots = "." * _dots.value;
            return Text(
              dots,
              style: const TextStyle(
                fontSize: 28,
                color: Color(0xFFB57CFF),
                fontWeight: FontWeight.bold,
                letterSpacing: 6,
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F2FF),
      body: Center(
        child: Container(
          width: 330,
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 10))
            ],
          ),
          child: _buildCardContent(),
        ),
      ),
    );
  }
}
