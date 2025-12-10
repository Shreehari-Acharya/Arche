import 'package:flutter/material.dart';
import 'document_view_screen.dart';

class ProcessingScreen extends StatefulWidget {
  final String fileName;        // <-- REQUIRED INPUT

  const ProcessingScreen({super.key, required this.fileName});

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<int> _dotAnimation;

  @override
  void initState() {
    super.initState();

    // Dots animation (...)
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..repeat();

    _dotAnimation = StepTween(begin: 1, end: 3).animate(_controller);

    // Redirect after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DocumentViewScreen(
            fileName: widget.fileName,   // <-- PASS FILE NAME CORRECTLY
            sectionsCount: 0,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF3EFFF),
              Color(0xFFF8F4FF),
              Color(0xFFF4ECFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Center(
          child: Container(
            width: 330,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                )
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // Icon
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFB57CFF), Color(0xFF6D82FF)],
                    ),
                  ),
                  child: const Icon(
                    Icons.description_rounded,
                    size: 32,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  "Processing Your Document",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2A2A2A),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Extracting content and organizing\nsections...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 18),

                AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) {
                    String dots = "." * _dotAnimation.value;
                    return Text(
                      dots,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Color(0xFFB57CFF),
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
