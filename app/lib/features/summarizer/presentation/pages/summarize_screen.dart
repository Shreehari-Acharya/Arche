import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'processing_screen.dart';

class SummarizeScreen extends StatefulWidget {
  const SummarizeScreen({super.key});

  @override
  State<SummarizeScreen> createState() => _SummarizeScreenState();
}

class _SummarizeScreenState extends State<SummarizeScreen> {
  String? _selectedFileName;

  // ================= FILE PICKER ==================
  Future<void> _pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'ppt', 'pptx'],
      );

      if (result != null && result.files.isNotEmpty) {
        final fileName = result.files.first.name;

        setState(() {
          _selectedFileName = fileName;
        });

        // After selecting file, go to processing screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProcessingScreen(fileName: fileName),
          ),
        );
      }
    } catch (e) {
      print("File picking failed: $e");
    }
  }

  // ================= UI COMPONENT ==================
  Widget _purpleCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFA46CFF), Color(0xFF617AFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 4)),
          ],
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              child: Icon(icon, color: Colors.deepPurple, size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 13, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _uploadCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.deepPurple.withOpacity(0.3)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const Icon(Icons.cloud_upload_outlined, color: Colors.deepPurple, size: 60),
          const SizedBox(height: 16),

          const Text(
            "Drag & drop your file here",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 12),

          ElevatedButton(
            onPressed: _pickFile,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("Browse Files"),
          ),

          const SizedBox(height: 10),
          const Text("PDF • PowerPoint", style: TextStyle(color: Colors.black54)),

          if (_selectedFileName != null) ...[
            const SizedBox(height: 20),
            Text(
              "Selected: $_selectedFileName",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ================= MAIN UI ==================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F2FF),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: const Text("Upload Your Study Material"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: _uploadCard()),
            const SizedBox(height: 30),

            _purpleCard(
              icon: Icons.article,
              title: "Smart Notes",
              subtitle: "Auto-generated summaries",
              onTap: () {},
            ),
            _purpleCard(
              icon: Icons.calendar_month,
              title: "Study Plans",
              subtitle: "Personalized schedules",
              onTap: () {},
            ),
            _purpleCard(
              icon: Icons.quiz,
              title: "Revision Quizzes",
              subtitle: "Instant practice tests",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
