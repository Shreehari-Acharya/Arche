import 'package:flutter/material.dart';
import '../../../auth/presentation/bloc/auth_local.dart';
import '../../data/repositories/learning_repository.dart';
import 'Course_screen.dart';

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
  bool _isLoading = false; // loading state

  @override
  void initState() {
    super.initState();
    _loadCreds();
  }

  Future<void> _loadCreds() async {
    final tok = await AuthLocal.getToken();
    final uid = await AuthLocal.getUserId();
    if (!mounted) return;
    setState(() {
      _userId = uid ?? ''; // read from secure storage
      _token = tok ?? '';
    });
  }

  int currentStep = 1;

  List<String> selectedInterests = [];
  String skillLevel = "";
  String language = "";
  int studyHours = 1;
  String timePeriod = "";

  final TextEditingController interestController = TextEditingController();

  Future<bool> _handleBack() async {
    if (currentStep > 1) {
      setState(() => currentStep--);
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    interestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleBack,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),

                /// ✅ Progress Bar
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
                Text("Step $currentStep of 6"),
                const SizedBox(height: 20),

                _buildCard(),
                const SizedBox(height: 25),
                _buildNavigationButtons(),
              ],
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

  /// ✅ STEP 1
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
        const Text("What do you want to learn today?"),
        const SizedBox(height: 16),

        // ✅ Custom topic input
        TextField(
          controller: interestController,
          decoration: InputDecoration(
            hintText: "Type your own topic (e.g., Cybersecurity)",
            hintStyle: const TextStyle(fontSize: 12),
            border: const OutlineInputBorder(),
          ),
          textInputAction: TextInputAction.done,
          onSubmitted: (val) {
            final text = val.trim();
            if (text.isNotEmpty) {
              setState(() => selectedInterests = [text]);
            }
          },
          onChanged: (val) {
            final text = val.trim();
            setState(() {
              if (text.isNotEmpty && selectedInterests.isNotEmpty) {
                selectedInterests = [];
              }
              // Calling setState ensures the Next button re-evaluates `hasTopic`
            });
          },
        ),
        const SizedBox(height: 12),

        Wrap(
          spacing: 8,
          children: interests.map((item) {
            final selected = selectedInterests.contains(item);
            return ChoiceChip(
              label: Text(item),
              selected: selected,
              onSelected: (_) {
                // ✅ Clear text when choosing a chip
                interestController.clear();
                setState(() => selectedInterests = [item]);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  /// ✅ STEP 2
  Widget _step2() {
    return _radioGroup(
      title: "Your skill level",
      options: ["BEGINNER", "INTERMEDIATE", "ADVANCED"],
      selectedValue: skillLevel,
      onChanged: (v) => setState(() => skillLevel = v),
    );
  }

  /// ✅ STEP 3
  Widget _step3() {
    return _radioGroup(
      title: "Preferred language",
      options: ["ENGLISH", "HINDI"],
      selectedValue: language,
      onChanged: (v) => setState(() => language = v),
    );
  }

  /// ✅ STEP 4
  Widget _step4() {
    return Column(
      children: [
        const Text("How many hours per day?"),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            showValueIndicator: ShowValueIndicator.onDrag, // always show popup
          ),
          child: Slider(
            value: studyHours.toDouble(),
            min: 1,
            max: 10,
            divisions: 9,
            label: "$studyHours h", // value shown in the indicator
            onChanged: (v) => setState(() => studyHours = v.toInt()),
          ),
        ),
      ],
    );
  }

  /// ✅ STEP 5
  Widget _step5() {
    return _radioGroup(
      title: "Time period",
      options: ["1 Week", "2 Weeks", "1 Month"],
      selectedValue: timePeriod,
      onChanged: (v) => setState(() => timePeriod = v),
    );
  }

  /// ✅ STEP 6
  Widget _step6Summary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [Text("Ready to generate your roadmap")],
    );
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
        Text(title),
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

  /// ✅ ✅ ✅ FINAL FIX: PASS repository & userId
  Widget _buildNavigationButtons() {
    final hasTopic =
        selectedInterests.isNotEmpty ||
        interestController.text.trim().isNotEmpty;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AbsorbPointer(
          absorbing: _isLoading || (!hasTopic && currentStep == 1),
          child: GestureDetector(
            onTap: () async {
              // Block progression from Step 1 if no topic
              if (currentStep == 1 && !hasTopic) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please set a topic to continue'),
                  ),
                );
                return;
              }

              if (currentStep < 6) {
                setState(() => currentStep++);
              } else {
                setState(() => _isLoading = true);
                try {
                  final uid = _userId ?? '';
                  final tok = _token ?? '';

                  final repo = LearningRepository(authToken: tok);

                  // Prefer typed text, fallback to selected chip, then default
                  final typed = interestController.text.trim();
                  final topicName = typed.isNotEmpty
                      ? typed
                      : (selectedInterests.isNotEmpty
                            ? selectedInterests.first
                            : 'Untitled');

                  final months = _mapTimePeriodToMonths(timePeriod);

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
                      builder: (_) => GeneratedRoadmapScreen(
                        journey: detailed,
                        repository: repo,
                        userId: uid,
                      ),
                    ),
                  );
                } catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Failed to generate roadmap'),
                      ),
                    );
                  }
                } finally {
                  if (mounted) setState(() => _isLoading = false);
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
              decoration: BoxDecoration(
                color: (_isLoading || (!hasTopic && currentStep == 1))
                    ? Colors.grey
                    : Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: _isLoading
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Generating...",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  : Text(
                      currentStep == 6 ? "Generate Roadmap" : "Next",
                      style: const TextStyle(color: Colors.white),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
