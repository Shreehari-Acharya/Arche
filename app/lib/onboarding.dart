import 'package:flutter/material.dart';

// ✅ AI GENERATED ROADMAP SCREEN
import './features/auth/presentation/pages/generated_roadmap_screen.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentStep = 1;

  // --- FORM DATA ---
  List<String> selectedInterests = [];
  String skillLevel = "";
  String language = "";
  int studyHours = 1;
  String timePeriod = "";
  String extraResources = "";

  final TextEditingController interestController = TextEditingController();
  final TextEditingController extraResourceController = TextEditingController();

  // ✅ BACK BUTTON HANDLING (steps + page)
  Future<bool> _handleBack() async {
    if (currentStep > 1) {
      setState(() => currentStep--);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleBack,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF3F0FF), Color(0xFFEFF4FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  // ✅ TOP BACK ARROW
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (currentStep > 1) {
                            setState(() => currentStep--);
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: const Icon(Icons.arrow_back,
                            size: 26, color: Colors.black87),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ✅ PROGRESS BAR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return Container(
                        width: 45,
                        height: 6,
                        decoration: BoxDecoration(
                          color: currentStep - 1 >= index
                              ? const Color(0xFF6A5AE0)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(40),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 14),
                  Text(
                    "Step $currentStep of 6",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ✅ MAIN CARD
                  _buildCard(),

                  const SizedBox(height: 25),

                  // ✅ BOTTOM BUTTONS
                  _buildNavigationButtons(),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // -------------------- CARD CONTAINER --------------------
  Widget _buildCard() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (currentStep == 1) _step1(),
          if (currentStep == 2) _step2(),
          if (currentStep == 3) _step3(),
          if (currentStep == 4) _step4(),
          if (currentStep == 5) _step5(),
          if (currentStep == 6) _step6Summary(),
        ],
      ),
    );
  }

  // -------------------- STEP 1 --------------------
  Widget _step1() {
    final interests = [
      "Python",
      "Linux",
      "AI/ML",
      "Web Development",
      "Data Science",
      "DevOps",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("What do you want to learn today?",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        const Text("Tell us what you're interested in",
            style: TextStyle(color: Colors.black54)),
        const SizedBox(height: 16),

        TextField(
          controller: interestController,
          decoration: InputDecoration(
            hintText: "e.g., Python, Machine Learning",
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              setState(() => selectedInterests.add(value.trim()));
              interestController.clear();
            }
          },
        ),

        const SizedBox(height: 14),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: interests.map((item) {
            final selected = selectedInterests.contains(item);
            return GestureDetector(
              onTap: () {
                setState(() {
                  selected
                      ? selectedInterests.remove(item)
                      : selectedInterests.add(item);
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: selected ? const Color(0xFFEDE4FF) : Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(item),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // -------------------- STEP 2 --------------------
  Widget _step2() {
    final levels = ["Beginner", "Intermediate", "Advanced"];
    return _radioGroup(
      title: "Your skill level",
      options: levels,
      selectedValue: skillLevel,
      onChanged: (v) => setState(() => skillLevel = v),
    );
  }

  // -------------------- STEP 3 --------------------
  Widget _step3() {
    return _radioGroup(
      title: "Preferred language",
      subtitle: "English or Hindi (video content)",
      options: ["English", "Hindi"],
      selectedValue: language,
      onChanged: (v) => setState(() => language = v),
    );
  }

  // -------------------- STEP 4 --------------------
  Widget _step4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("How many hours per day can you learn?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        const SizedBox(height: 14),

        Slider(
          value: studyHours.toDouble(),
          min: 1,
          max: 10,
          divisions: 9,
          label: "$studyHours hrs",
          onChanged: (value) {
            setState(() => studyHours = value.toInt());
          },
        ),
      ],
    );
  }

  // -------------------- STEP 5 --------------------
  Widget _step5() {
    final options = ["1 Week", "2 Weeks", "1 Month", "2 Months", "3 Months"];
    return _radioGroup(
      title: "Time period to finish learning",
      options: options,
      selectedValue: timePeriod,
      onChanged: (v) => setState(() => timePeriod = v),
    );
  }

  // -------------------- STEP 6 --------------------
  Widget _step6Summary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Your Learning Profile",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        const Text("Here's what we've set up for you",
            style: TextStyle(color: Colors.black54)),
        const SizedBox(height: 18),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F6FF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            _generateSummaryJson(),
            style: const TextStyle(
              fontFamily: "Courier New",
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  // -------------------- JSON SUMMARY --------------------
  String _generateSummaryJson() {
    return """
{
  "topics": ${selectedInterests.isEmpty ? "\"Not provided\"" : selectedInterests},
  "skilllevel": "${skillLevel.isEmpty ? "Not provided" : skillLevel}",
  "language": "${language.isEmpty ? "Not provided" : language}",
  "studyHours": "$studyHours hrs/day",
  "timePeriod": "${timePeriod.isEmpty ? "Not provided" : timePeriod}",
  "extraResources": "${extraResources.isEmpty ? "None" : extraResources}"
}
""";
  }

  // -------------------- RADIO GROUP --------------------
  Widget _radioGroup({
    required String title,
    String? subtitle,
    required List<String> options,
    required String selectedValue,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              subtitle,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        const SizedBox(height: 16),

        ...options.map((item) {
          return RadioListTile(
            title: Text(item),
            value: item,
            groupValue: selectedValue,
            onChanged: (value) => onChanged(value!),
          );
        }),
      ],
    );
  }

  // -------------------- BOTTOM BUTTONS --------------------
  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // BACK
        GestureDetector(
          onTap: () {
            if (currentStep > 1) {
              setState(() => currentStep--);
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: const Row(
              children: [
                Icon(Icons.arrow_back, size: 18),
                SizedBox(width: 6),
                Text("Back", style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ),

        // ✅ FINISH → AI GENERATED ROADMAP
        GestureDetector(
          onTap: () {
            if (currentStep < 6) {
              setState(() => currentStep++);
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => GeneratedRoadmapScreen(
                    topics: selectedInterests,
                    skillLevel: skillLevel,
                    language: language,
                    studyHours: studyHours,
                    timePeriod: timePeriod,
                  ),
                ),
              );
            }
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF628BFF), Color(0xFFA66DFF)],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Text(
                  currentStep == 6 ? "Generate Roadmap" : "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.arrow_forward_sharp,
                    color: Colors.white, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
