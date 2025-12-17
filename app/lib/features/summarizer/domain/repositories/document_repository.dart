import 'dart:io';
import '../entities/document.dart';
import '../entities/upload_result.dart';

abstract class DocumentRepository {
  Future<UploadResult> uploadDocument(File file, String fileName);
  Future<Document?> getDocument(String documentId);
  Future<List<Document>> getDocumentHistory();
}