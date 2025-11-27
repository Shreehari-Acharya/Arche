import 'package:flutter/material.dart';

class SummarizeScreen extends StatelessWidget {
  const SummarizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            'Summarize',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'Upload your PDFs to generate clean notes and mindmaps.',
          ),
        ],
      ),
    );
  }
}
