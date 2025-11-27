import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            'AI Smart Notes & Mindmaps',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'Your summarized notes, mindmaps, and flashcards will appear here.',
          ),
        ],
      ),
    );
  }
}
