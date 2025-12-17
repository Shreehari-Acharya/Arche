import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/document_model.dart';

abstract class DocumentRemoteDataSource {
  Future<Map<String, dynamic>> uploadDocument(File file, String fileName);
  Future<DocumentModel> getDocument(String documentId);
  Future<List<DocumentModel>> getDocumentHistory();
}

class DocumentRemoteDataSourceImpl implements DocumentRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  DocumentRemoteDataSourceImpl({
    required this.client,
    this.baseUrl = 'https://localhost:5000/api', 
  });

  @override
  Future<Map<String, dynamic>> uploadDocument(File file, String fileName) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/documents/upload'),
      );

      // Add the file
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
          filename: fileName,
        ),
      );

      // Add additional fields if needed
      request.fields['fileName'] = fileName;

      // Send request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to upload document: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Upload error: $e');
    }
  }

  @override
  Future<DocumentModel> getDocument(String documentId) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/documents/$documentId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return DocumentModel.fromJson(
          json.decode(response.body) as Map<String, dynamic>,
        );
      } else {
        throw Exception('Failed to get document: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Get document error: $e');
    }
  }

  @override
  Future<List<DocumentModel>> getDocumentHistory() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/documents/history'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body) as List;
        return jsonList
            .map((json) => DocumentModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to get history: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Get history error: $e');
    }
  }
}