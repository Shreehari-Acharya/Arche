import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/learning_journey_model.dart';

class LearningRepository {
  final String baseUrl = "http://localhost:5000/api";
  final String? authToken;

  LearningRepository({this.authToken});

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        if (authToken != null) 'Authorization': 'Bearer $authToken',
      };

  // ✅ 1. FETCH ALL JOURNEYS
  Future<List<LearningJourney>> getAllJourneys(String userId) async {
    final res = await http.get(
      Uri.parse("$baseUrl/learning-journeys?userId=$userId"),
      headers: _headers,
    );

    if (res.statusCode != 200) {
      throw Exception("Failed to fetch journeys");
    }

    final data = json.decode(res.body);

    return (data['data'] as List)
        .map((e) => LearningJourney.fromJson(e))
        .toList();
  }

  // ✅ 2. FETCH SINGLE JOURNEY DETAILS (WITH VIDEOS)
  Future<LearningJourney> getJourneyDetails(
    String userId,
    String journeyId,
  ) async {
    final res = await http.get(
      Uri.parse(
        "$baseUrl/learning-journeys?userId=$userId&learningJourneyId=$journeyId",
      ),
      headers: _headers,
    );

    if (res.statusCode != 200) {
      throw Exception("Failed to fetch journey details");
    }

    final data = json.decode(res.body);
    return LearningJourney.fromJson(data['data']);
  }

  // ✅ 3. CREATE LEARNING JOURNEY
  Future<String> createJourney({
    required String userId,
    required String topicName,
    required String skillLevel,
    required String language,
    required int hoursPerDay,
    required double monthsToComplete,
  }) async {
    final res = await http.post(
      Uri.parse("$baseUrl/learning-journeys"),
      headers: _headers,
      body: json.encode({
        "userId": userId,
        "topicName": topicName,
        "skillLevel": skillLevel,
        "language": language,
        "hoursPerDay": hoursPerDay,
        "monthsToComplete": monthsToComplete,
      }),
    );

    if (res.statusCode != 201) {
      throw Exception("Failed to create journey");
    }

    final data = json.decode(res.body);
    return data['data']['id'];
  }

  // ✅ ✅ ✅ 4. REAL BACKEND MARK AS COMPLETE (FIXED)
  Future<void> markTaskComplete({
    required String journeyId,
    required String subTopicId,
  }) async {
    final res = await http.put(
      Uri.parse("$baseUrl/learning-journeys/update-progress"),
      headers: _headers,
      body: json.encode({
        "learningJourneyId": journeyId, // ✅ REQUIRED BY PRISMA
        "subTopicId": subTopicId,        // ✅ REQUIRED BY PRISMA
      }),
    );

    if (res.statusCode != 200) {
      throw Exception("Failed to mark task complete");
    }
  }
}
