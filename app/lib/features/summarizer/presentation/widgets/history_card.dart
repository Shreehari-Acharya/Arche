import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/document.dart';

class HistoryCard extends StatelessWidget {
  final Document document;
  final Color brandColor;
  final VoidCallback onTap;

  const HistoryCard({
    super.key,
    required this.document,
    required this.brandColor,
    required this.onTap,
  });

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat('MMM dd').format(date);
    }
  }

  IconData _getFileIcon() {
    if (document.mimeType.contains('pdf')) {
      return Icons.picture_as_pdf;
    } else if (document.mimeType.contains('presentation') || 
               document.mimeType.contains('powerpoint')) {
      return Icons.slideshow;
    }
    return Icons.insert_drive_file;
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shadowColor: Colors.grey.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              // File icon
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: brandColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getFileIcon(),
                  color: brandColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              // File info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      document.fileName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          _formatDate(document.createdAt),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '• ${_formatFileSize(document.size)}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // View button
              Icon(
                Icons.chevron_right,
                color: brandColor,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
