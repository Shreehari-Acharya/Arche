import 'package:flutter/material.dart';
import '../../../auth/presentation/bloc/auth_local.dart';
import '../../data/repositories/learning_repository.dart';
import 'generated_roadmap_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

double _mapTimePeriodToMonths(String period) {
  switch (period) {
    case '1 Week':
      return 0.25;
    case '2 Weeks':
      return 0.5;
    case '1 Month':
      return 1.0;
    default:
      return 1.0;
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String? _userId;
  String? _token;

  @override
  void initState() {
    super.initState();
    _loadCreds();
  }

  Future<void> _loadCreds() async {
    //final uid = await AuthLocal.getUserId();
    final tok = await AuthLocal.getToken();
    if (!mounted) return;
    setState(() {
      _userId = "cmikhub6a00bh6mmvazs2emim";
      _token = tok;
    });
    // print('DEBUG loaded uid=$_userId tok=$_token');
  }

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
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),

                  // Progress Bar
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

                  _buildCard(),
                  const SizedBox(height: 25),
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

  // ... (Step 1 to Step 5 code remains exactly the same as your previous version) ...
  // Keeping them brief here to save space, assuming they are unchanged.

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
        const Text(
          "What do you want to learn today?",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: interestController,
          decoration: InputDecoration(
            hintText: "e.g., Python",
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
          onSubmitted: (v) {
            if (v.isNotEmpty) {
              setState(() {
                selectedInterests = [v];
                interestController.clear();
              });
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
              onTap: () => setState(() {
                // Only one chip can be selected at a time
                if (selected) {
                  selectedInterests.clear();
                } else {
                  selectedInterests = [item];
                }
              }),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
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

  Widget _step2() {
    return _radioGroup(
      title: "Your skill level",
      options: ["BEGINNER", "INTERMEDIATE", "ADVANCE"],
      selectedValue: skillLevel,
      onChanged: (v) => setState(() => skillLevel = v),
    );
  }

  Widget _step3() {
    return _radioGroup(
      title: "Preferred language",
      options: ["ENGLISH", "HINDI"],
      selectedValue: language,
      onChanged: (v) => setState(() => language = v),
    );
  }

  Widget _step4() {
    return Column(
      children: [
        const Text(
          "How many hours per day?",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        Slider(
          value: studyHours.toDouble(),
          min: 1,
          max: 10,
          divisions: 9,
          label: "$studyHours hrs",
          onChanged: (v) => setState(() => studyHours = v.toInt()),
        ),
      ],
    );
  }

  Widget _step5() {
    return _radioGroup(
      title: "Time period",
      options: ["1 Week", "2 Weeks", "1 Month"],
      selectedValue: timePeriod,
      onChanged: (v) => setState(() => timePeriod = v),
    );
  }

  Widget _step6Summary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Your Learning Profile",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
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
            style: const TextStyle(fontFamily: "Courier New", fontSize: 14),
          ),
        ),
      ],
    );
  }

  String _generateSummaryJson() {
    return """
{
  "topics": ${selectedInterests},
  "skilllevel": "$skillLevel",
  "language": "$language",
  "duration": "$timePeriod"
}
""";
  }

  Widget _radioGroup({
    required String title,
    required List<String> options,
    required String selectedValue,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        ...options.map(
          (item) => RadioListTile(
            title: Text(item),
            value: item,
            groupValue: selectedValue,
            onChanged: (v) => onChanged(v!),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (currentStep > 1)
          GestureDetector(
            onTap: () {
              setState(() => currentStep--);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
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
          )
        else
          const SizedBox(width: 1),

        GestureDetector(
          onTap: () async {
            if (currentStep < 6) {
              setState(() => currentStep++);
            } else {
              var uid = _userId ?? '';
              var tok = _token ?? '';

              if (uid.isEmpty || tok.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please login first')),
                );
                return;
              }
              final repo = LearningRepository(authToken: tok);
              final topicName = selectedInterests.isNotEmpty
                  ? selectedInterests.first
                  : 'Untitled';
              final months = _mapTimePeriodToMonths(timePeriod);

              try {
                final createdId = await repo.createJourney(
                  userId: uid,
                  topicName: topicName,
                  skillLevel: skillLevel,
                  language: language,
                  hoursPerDay: studyHours,
                  monthsToComplete: months,
                );
                final detailed = await repo.getJourneyDetails(uid, createdId);
                if (!mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GeneratedRoadmapScreen(journey: detailed),
                  ),
                );
              } catch (e) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to generate roadmap: $e')),
                );
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
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
                const Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
