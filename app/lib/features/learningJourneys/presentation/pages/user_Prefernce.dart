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
    final tok = await AuthLocal.getToken();
    if (!mounted) return;
    setState(() {
      _userId = "cmieugm7s0000uye0jzmwhgut"; // TEMP USER
      _token = tok;
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

        Wrap(
          spacing: 8,
          children: interests.map((item) {
            final selected = selectedInterests.contains(item);
            return ChoiceChip(
              label: Text(item),
              selected: selected,
              onSelected: (_) {
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
        Slider(
          value: studyHours.toDouble(),
          min: 1,
          max: 10,
          divisions: 9,
          onChanged: (v) => setState(() => studyHours = v.toInt()),
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
      children: const [
        Text("Ready to generate your roadmap"),
      ],
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () async {
            if (currentStep < 6) {
              setState(() => currentStep++);
            } else {
              final uid = _userId ?? '';
              final tok = _token ?? '';

              final repo = LearningRepository(authToken: tok);

              final topicName =
                  selectedInterests.isNotEmpty ? selectedInterests.first : 'Untitled';

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

              /// ✅ ✅ ✅ THIS IS THE FIX
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
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              currentStep == 6 ? "Generate Roadmap" : "Next",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
