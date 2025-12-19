import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/document_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb, debugPrint;
import 'package:http_parser/http_parser.dart';

abstract class DocumentRemoteDataSource {
  Future<Map<String, dynamic>> uploadDocument(
    String filePath,
    String fileName,
    String userId,
  );

  /// Generates a summary for the document
  Future<String> generateSummary(String fileId, String userId);

  /// Retrieves a previously generated summary (markdown format)
  Future<String> getSummary(String fileId, String userId);

  /// Gets list of all documents with summaries for a user
  Future<List<DocumentModel>> getDocumentHistory(String userId);
}

class DocumentRemoteDataSourceImpl implements DocumentRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  DocumentRemoteDataSourceImpl({
    required this.client,
    this.baseUrl = 'http://localhost:5000/api',
  });

  // Helper method to determine MIME type from file extension
  String _getMimeType(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return 'application/pdf';
      case 'ppt':
        return 'application/vnd.ms-powerpoint';
      case 'pptx':
        return 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
      default:
        return 'application/octet-stream';
    }
  }

  @override
  Future<Map<String, dynamic>> uploadDocument(
    String filePath,
    String fileName,
    String userId,
  ) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/summary/upload'),
      );

      if (kIsWeb) {
        throw UnimplementedError('Web upload not yet implemented');
      } else {
        final file = File(filePath);
        final bytes = await file.readAsBytes();
        final mimeType = _getMimeType(fileName);

        request.files.add(
          http.MultipartFile.fromBytes(
            'file',
            bytes,
            filename: fileName,
            contentType: MediaType.parse(mimeType),
          ),
        );
      }

      request.fields['userId'] = userId;

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      debugPrint('Upload response status: ${response.statusCode}');
      debugPrint('Upload response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        if (jsonResponse['success'] == true) {
          return jsonResponse['data'] as Map<String, dynamic>;
        } else {
          throw Exception(jsonResponse['message'] ?? 'Upload failed');
        }
      } else {
        throw Exception('Failed to upload document: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Upload error: $e');
      throw Exception('Upload error: $e');
    }
  }

  @override
  Future<String> generateSummary(String fileId, String userId) async {
    try {
      debugPrint('Generating summary for fileId: $fileId');

      final response = await client.get(
        Uri.parse('$baseUrl/summary/generate?fileId=$fileId&userId=$userId'),
      );

      debugPrint('Generate summary response status: ${response.statusCode}');
      debugPrint('Generate summary response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        if (jsonResponse['success'] == true) {
          return jsonResponse['data']['summary'] as String;
        } else {
          throw Exception(
            jsonResponse['message'] ?? 'Failed to generate summary',
          );
        }
      } else {
        throw Exception(
          'Failed to generate summary: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      debugPrint('Generate summary error: $e');
      throw Exception('Generate summary error: $e');
    }
  }

  @override
  Future<String> getSummary(String fileId, String userId) async {
    try {
      debugPrint('Fetching summary for fileId: $fileId');

      final response = await client.get(
        Uri.parse('$baseUrl/summary?fileId=$fileId&userId=$userId'),
      );

      debugPrint('Get summary response status: ${response.statusCode}');
      debugPrint('Get summary response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        if (jsonResponse['success'] == true) {
          return jsonResponse['data']['summary'] as String;
        } else {
          throw Exception(jsonResponse['message'] ?? 'Failed to fetch summary');
        }
      } else {
        throw Exception(
          'Failed to fetch summary: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      debugPrint('Get summary error: $e');
      throw Exception('Get summary error: $e');
    }
  }

  @override
  Future<List<DocumentModel>> getDocumentHistory(String userId) async {
    try {
      debugPrint('Fetching document history for userId: $userId');

      final response = await client.get(
        Uri.parse('$baseUrl/summary/list?userId=$userId'),
      );

      debugPrint('Get history response status: ${response.statusCode}');
      debugPrint('Get history response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        if (jsonResponse['success'] == true) {
          final List<dynamic> data = jsonResponse['data'] as List<dynamic>;
          return data
              .map(
                (json) => DocumentModel.fromJson(json as Map<String, dynamic>),
              )
              .toList();
        } else {
          throw Exception(
            jsonResponse['message'] ?? 'Failed to fetch document history',
          );
        }
      } else {
        throw Exception(
          'Failed to fetch document history: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      debugPrint('Get document history error: $e');
      throw Exception('Get document history error: $e');
    }
  }
}
