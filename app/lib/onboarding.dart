import 'package:flutter/material.dart';


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
    final interests = ["Python", "Linux", "AI/ML", "Web Development", "Data Science", "DevOps"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("What do you want to learn today?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
        const SizedBox(height: 16),
        TextField(
          controller: interestController,
          decoration: InputDecoration(
            hintText: "e.g., Python", filled: true, fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          ),
          onSubmitted: (v) { if(v.isNotEmpty) setState(() { selectedInterests.add(v); interestController.clear(); }); },
        ),
        const SizedBox(height: 14),
        Wrap(spacing: 8, runSpacing: 8, children: interests.map((item) {
          final selected = selectedInterests.contains(item);
          return GestureDetector(
            onTap: () => setState(() => selected ? selectedInterests.remove(item) : selectedInterests.add(item)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: selected ? const Color(0xFFEDE4FF) : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(item),
            ),
          );
        }).toList()),
      ],
    );
  }

  Widget _step2() {
    return _radioGroup(title: "Your skill level", options: ["Beginner", "Intermediate", "Advanced"], selectedValue: skillLevel, onChanged: (v) => setState(() => skillLevel = v));
  }
  Widget _step3() {
    return _radioGroup(title: "Preferred language", options: ["English", "Hindi"], selectedValue: language, onChanged: (v) => setState(() => language = v));
  }
  Widget _step4() {
    return Column(children: [
      const Text("How many hours per day?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
      Slider(value: studyHours.toDouble(), min: 1, max: 10, divisions: 9, label: "$studyHours hrs", onChanged: (v) => setState(() => studyHours = v.toInt())),
    ]);
  }
  Widget _step5() {
    return _radioGroup(title: "Time period", options: ["1 Week", "2 Weeks", "1 Month"], selectedValue: timePeriod, onChanged: (v) => setState(() => timePeriod = v));
  }

  Widget _step6Summary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Your Learning Profile", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
        const SizedBox(height: 18),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(color: const Color(0xFFF3F6FF), borderRadius: BorderRadius.circular(16)),
          child: Text(_generateSummaryJson(), style: const TextStyle(fontFamily: "Courier New", fontSize: 14)),
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

  Widget _radioGroup({required String title, required List<String> options, required String selectedValue, required Function(String) onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
        const SizedBox(height: 16),
        ...options.map((item) => RadioListTile(title: Text(item), value: item, groupValue: selectedValue, onChanged: (v) => onChanged(v!))),
      ],
    );
  }

  // -------------------- NAVIGATION BUTTONS --------------------
  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            if (currentStep > 1) {
              setState(() => currentStep--);
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: const Offset(0, 3))]),
            child: const Row(children: [Icon(Icons.arrow_back, size: 18), SizedBox(width: 6), Text("Back", style: TextStyle(fontSize: 15))]),
          ),
        ),

        GestureDetector(
          onTap: () {
            if (currentStep < 6) {
              setState(() => currentStep++);
            } else {
              // ---------------------------------------------------------
              // 🚀 FINISH ACTION: Create a MOCK Learning Journey Object
              // ---------------------------------------------------------
              // Since we don't have the POST API connected yet, we manually
              // create the object using the Form Data so the next screen works.
              
              final mockJourney = LearningJourney(
                id: "temp_id_123",
                topicName: selectedInterests.isNotEmpty ? selectedInterests.first : "General Learning",
                userId: "current_user",
                createdAt: DateTime.now().toIso8601String(),
                subTopics: [
                  SubTopic(
                    id: "st_1",
                    description: "Day 1: Introduction to ${selectedInterests.isNotEmpty ? selectedInterests.first : 'Topic'}",
                    videoResources: [
                      VideoResource(id: "v1", title: "Getting Started", url: "https://youtube.com", duration: 10),
                      VideoResource(id: "v2", title: "Core Concepts", url: "https://youtube.com", duration: 15),
                    ],
                  ),
                  SubTopic(
                    id: "st_2",
                    description: "Day 2: Advanced Concepts",
                    videoResources: [],
                  ),
                ],
              );

              // Navigate to Result Screen with the mock object
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => GeneratedRoadmapScreen(
                    journey: mockJourney,
                  ),
                ),
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
            decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF628BFF), Color(0xFFA66DFF)]), borderRadius: BorderRadius.circular(30)),
            child: Row(children: [
              Text(currentStep == 6 ? "Generate Roadmap" : "Next", style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
              const SizedBox(width: 6),
              const Icon(Icons.arrow_forward_sharp, color: Colors.white, size: 18),
            ]),
          ),
        ),
      ],
    );
  }
}

class LearningJourney {
  final String id;
  final String topicName;
  final String userId;
  final String createdAt;
  final List<SubTopic> subTopics;

  LearningJourney({
    required this.id,
    required this.topicName,
    required this.userId,
    required this.createdAt,
    required this.subTopics,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "topicName": topicName,
        "userId": userId,
        "createdAt": createdAt,
        "subTopics": subTopics.map((s) => s.toJson()).toList(),
      };
}

class SubTopic {
  final String id;
  final String description;
  final List<VideoResource> videoResources;

  SubTopic({
    required this.id,
    required this.description,
    required this.videoResources,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "videoResources": videoResources.map((v) => v.toJson()).toList(),
      };
}

class VideoResource {
  final String id;
  final String title;
  final String url;
  final int duration; // minutes

  VideoResource({
    required this.id,
    required this.title,
    required this.url,
    required this.duration,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "duration": duration,
      };
}

class GeneratedRoadmapScreen extends StatelessWidget {
  final LearningJourney journey;

  const GeneratedRoadmapScreen({Key? key, required this.journey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Roadmap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              journey.topicName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Created: ${journey.createdAt}'),
            const SizedBox(height: 12),
            ...journey.subTopics.map((sub) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(sub.description, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      if (sub.videoResources.isNotEmpty)
                        ...sub.videoResources.map((v) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Text(v.title)),
                                  const SizedBox(width: 8),
                                  Text('${v.duration}m', style: const TextStyle(color: Colors.black54)),
                                ],
                              ),
                            )),
                      if (sub.videoResources.isEmpty)
                        const Text('No video resources', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 16),
            const Text('Raw JSON', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F6FF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                journey.toJson().toString(),
                style: const TextStyle(fontFamily: "Courier New", fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}