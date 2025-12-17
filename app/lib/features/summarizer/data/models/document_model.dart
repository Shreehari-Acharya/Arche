import '../../domain/entities/document.dart';

class DocumentModel extends Document {
  DocumentModel({
    required super.id,
    required super.fileName,
    required super.fileType,
    required super.uploadedAt,
    super.summary,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      id: json['id'] as String,
      fileName: json['fileName'] as String,
      fileType: json['fileType'] as String,
      uploadedAt: DateTime.parse(json['uploadedAt'] as String),
      summary: json['summary'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fileName': fileName,
      'fileType': fileType,
      'uploadedAt': uploadedAt.toIso8601String(),
      'summary': summary,
    };
  }
}