import 'dart:io';
import '../../domain/entities/document.dart';
import '../../domain/entities/upload_result.dart';
import '../../domain/repositories/document_repository.dart';
import '../datasources/document_remote_datasource.dart';

class DocumentRepositoryImpl implements DocumentRepository {
  final DocumentRemoteDataSource remoteDataSource;

  DocumentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UploadResult> uploadDocument(File file, String fileName) async {
    try {
      final result = await remoteDataSource.uploadDocument(file, fileName);

      return UploadResult(
        success: true,
        documentId: result['id'] as String?,
        message:
            result['message'] as String? ?? 'Document uploaded successfully',
      );
    } catch (e) {
      return UploadResult(success: false, error: e.toString());
    }
  }

  @override
  Future<Document?> getDocument(String documentId) async {
    try {
      return await remoteDataSource.getDocument(documentId);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Document>> getDocumentHistory() async {
    try {
      return await remoteDataSource.getDocumentHistory();
    } catch (e) {
      return [];
    }
  }
}
