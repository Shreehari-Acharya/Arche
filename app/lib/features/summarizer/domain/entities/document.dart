class Document {
  final String id;
  final String fileName;
  final String fileType;
  final DateTime uploadedAt;
  final String? summary;
  Document({
    required this.id,
    required this.fileName,
    required this.fileType,
    required this.uploadedAt,
    this.summary,
  });
}
