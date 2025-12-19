import '../../domain/entities/document.dart';

class DocumentModel extends Document {
  DocumentModel({
    required super.id,
    required super.fileName,
    required super.mimeType,
    required super.size,
    required super.createdAt,
    super.summary,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      id: json['id'] as String,
      fileName: json['originalName'] as String,
      mimeType: json['mimeType'] as String,
      size: json['size'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      summary: null, // Summary is fetched separately
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'originalName': fileName,
      'mimeType': mimeType,
      'size': size,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
