class UploadResult {
  final bool success;
  final String? documentId;
  final String? message;
  final String? error;

  UploadResult({
    required this.success,
    this.documentId,
    this.message,
    this.error,
  });
}