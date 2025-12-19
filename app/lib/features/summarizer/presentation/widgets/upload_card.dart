import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../domain/repositories/document_repository.dart';
import '../../domain/repositories/chat_repository.dart';
import '../pages/summary_page.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../auth/presentation/bloc/auth_local.dart';

class UploadCard extends StatefulWidget {
  final Color brandColor;
  final DocumentRepository repository;
  final ChatRepository chatRepository;
  final VoidCallback? onUploadComplete; // Add callback

  const UploadCard({
    super.key,
    required this.brandColor,
    required this.repository,
    required this.chatRepository,
    this.onUploadComplete, // Add this
  });

  @override
  State<UploadCard> createState() => _UploadCardState();
}

class _UploadCardState extends State<UploadCard> {
  PlatformFile? _pickedFile;
  bool _isUploading = false;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final userId = await AuthLocal.getUserId();
    if (mounted && userId != null) {
      setState(() {
        _userId = userId;
      });
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'ppt', 'pptx'],
    );

    if (result != null) {
      setState(() {
        _pickedFile = result.files.first;
      });
      debugPrint('File picked: ${_pickedFile?.name}');
    } else {
      debugPrint('User canceled the file picker.');
    }
  }

  Future<void> _uploadAndNavigate() async {
    if (_pickedFile == null) return;

    setState(() {
      _isUploading = true;
    });

    try {
      // Get file data based on platform
      dynamic fileData;
      if (kIsWeb) {
        // For web, use bytes
        fileData = _pickedFile!.bytes;
        if (fileData == null) {
          throw Exception('Failed to read file bytes');
        }
      } else {
        // For mobile/desktop, use File
        if (_pickedFile!.path == null) {
          throw Exception('File path is null');
        }
        fileData = File(_pickedFile!.path!);
      }

      final uploadResult = await widget.repository.uploadDocument(
        fileData,
        _pickedFile!.name,
        _userId,
      );

      if (!mounted) return;

      if (uploadResult.success && uploadResult.fileId != null) {
        // Generate summary
        try {
          final summary = await widget.repository.generateSummary(
            uploadResult.fileId!,
            _userId,
          );

          if (mounted) {
            setState(() {
              _isUploading = false;
            });

            // Notify parent to refresh history
            widget.onUploadComplete?.call();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SummaryPage(
                  fileName: _pickedFile!.name,
                  fileId: uploadResult.fileId!,
                  summary: summary,
                  chatRepository: widget.chatRepository,
                  userId: _userId,
                ),
              ),
            );
          }
        } catch (e) {
          if (mounted) {
            setState(() {
              _isUploading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to generate summary: $e'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      } else {
        setState(() {
          _isUploading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(uploadResult.error ?? 'Upload failed'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  IconData _getFileIcon(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow;
      default:
        return Icons.insert_drive_file;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shadowColor: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_pickedFile == null)
              // Initial State
              ..._buildInitialContent()
            else
              // File Picked State
              ..._buildFilePickedContent(),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isUploading
                    ? null
                    : (_pickedFile == null ? _pickFile : _uploadAndNavigate),
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.brandColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: _isUploading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        _pickedFile == null
                            ? "Choose File"
                            : "Generate Summary",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildInitialContent() {
    return [
      const Icon(Icons.cloud_upload_outlined, size: 64, color: Colors.grey),
      const SizedBox(height: 4),
      const Text(
        "Upload New Material",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      const SizedBox(height: 4),
      const Text(
        "Drag & Drop PDF/PPT here",
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    ];
  }

  List<Widget> _buildFilePickedContent() {
    return [
      Icon(_getFileIcon(_pickedFile!.name), size: 64, color: widget.brandColor),
      const SizedBox(height: 8),
      Text(
        _pickedFile!.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    ];
  }
}
