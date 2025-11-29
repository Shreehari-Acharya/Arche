import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/learning_journey_model.dart';

class LearningRepository {
  // ⚠️ Use 10.0.2.2 for Android Emulator. Use localhost for iOS Simulator/Web.
  final String baseUrl = "http://localhost:5000/api";
  final String? authToken;

    LearningRepository({this.authToken});


  // 1. Fetch ALL Learning Journeys for the User
  Future<List<LearningJourney>> getAllJourneys(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/learning-journeys?userId=$userId'),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // Ensure 'data' exists and is a list
        if (jsonResponse['success'] == true && jsonResponse['data'] is List) {
          return (jsonResponse['data'] as List)
              .map((item) => LearningJourney.fromJson(item))
              .toList();
        }
        return [];
      } else {
        throw Exception('Failed to load journeys: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error connecting to server: $e');
    }
  }

  // 2. Fetch DETAILS of a specific Journey (with subtopics)
  Future<LearningJourney> getJourneyDetails(
    String userId,
    String journeyId,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/learning-journeys?userId=$userId&learningJourneyId=$journeyId',
        ),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['success'] == true) {
          return LearningJourney.fromJson(jsonResponse['data']);
        }
        throw Exception('API Error: ${jsonResponse}');
      } else {
        throw Exception('Failed to load journey details');
      }
    } catch (e) {
      throw Exception('Error connecting to server: $e');
    }
  }

  // 3. Create a new Learning Journey (POST)
  Future<String> createJourney({
    required String userId,
    required String topicName,
    required String skillLevel,
    required String language,
    required int hoursPerDay,
    required double monthsToComplete,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/learning-journeys'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'userId': userId,
          'topicName': topicName,
          'skillLevel': skillLevel,
          'language': language,
          'hoursPerDay': hoursPerDay,
          'monthsToComplete': monthsToComplete,
        }),
      );

      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['success'] == true) {
          return jsonResponse['data']['id'] as String;
        }
        throw Exception('API Error: ${jsonResponse}');
      } else {
        throw Exception('Failed to create journey: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error connecting to server: $e');
    }
  }
}
