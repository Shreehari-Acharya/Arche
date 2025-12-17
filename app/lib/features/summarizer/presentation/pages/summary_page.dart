import 'package:flutter/material.dart';
import '../../domain/repositories/chat_repository.dart';
import 'dart:async';

class SummaryPage extends StatefulWidget {
  final String fileName;
  final String documentId;
  final ChatRepository chatRepository;

  const SummaryPage({
    super.key,
    required this.fileName,
    required this.documentId,
    required this.chatRepository,
  });

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  StreamSubscription? _chatSubscription;
  bool _isAiTyping = false;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _connectToChat();
  }

  void _connectToChat() {
    try {
      _chatSubscription = widget.chatRepository
          .connectToChat(widget.documentId)
          .listen(
            _handleIncomingMessage,
            onError: (error) {
              debugPrint('WebSocket error: $error');
              _showError('Connection error. Please try again.');
            },
          );
    } catch (e) {
      debugPrint('Failed to connect: $e');
      _showError('Failed to connect to chat');
    }
  }

  void _handleIncomingMessage(Map<String, dynamic> data) {
    final type = data['type'] as String?;

    switch (type) {
      case 'connection_established':
        setState(() {
          _isConnected = true;
          _messages.add(
            ChatMessage(
              text: data['message'] as String? ?? 'Connected to Arche AI',
              isUser: false,
              timestamp: DateTime.now(),
              isSystem: true,
            ),
          );
        });
        break;

      case 'summary_ready':
        setState(() {
          _messages.add(
            ChatMessage(
              text: data['summary'] as String,
              isUser: false,
              timestamp: DateTime.parse(data['timestamp'] as String),
            ),
          );
        });
        _scrollToBottom();
        break;

      case 'ai_response':
        setState(() {
          _isAiTyping = false;
          _messages.add(
            ChatMessage(
              text: data['message'] as String,
              isUser: false,
              timestamp: DateTime.parse(data['timestamp'] as String),
            ),
          );
        });
        _scrollToBottom();
        break;

      case 'typing':
        setState(() {
          _isAiTyping = data['isTyping'] as bool? ?? false;
        });
        break;

      case 'error':
        _showError(data['message'] as String? ?? 'An error occurred');
        setState(() {
          _isAiTyping = false;
        });
        break;

      case 'connection_closed':
        setState(() {
          _isConnected = false;
        });
        _showError('Connection closed');
        break;
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty || !_isConnected) return;

    final messageText = _messageController.text.trim();

    setState(() {
      _messages.add(
        ChatMessage(text: messageText, isUser: true, timestamp: DateTime.now()),
      );
      _isAiTyping = true;
    });

    widget.chatRepository.sendMessage(messageText);
    _messageController.clear();
    _scrollToBottom();
  }

  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }
  }

  @override
  void dispose() {
    _chatSubscription?.cancel();
    widget.chatRepository.disconnect();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color deepIndigo = Color(0xFF3F51B5);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: deepIndigo,
        elevation: 2,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Arche AI',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              widget.fileName,
              style: const TextStyle(fontSize: 12, color: Colors.white70),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _isConnected ? Colors.greenAccent : Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length + (_isAiTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _messages.length && _isAiTyping) {
                  return _buildTypingIndicator(deepIndigo);
                }
                return _buildMessageBubble(_messages[index], deepIndigo);
              },
            ),
          ),

          // Input field
          _buildMessageInput(deepIndigo),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message, Color brandColor) {
    if (message.isSystem) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message.text,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: message.isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            CircleAvatar(
              backgroundColor: brandColor.withOpacity(0.1),
              radius: 16,
              child: Icon(
                Icons.smart_toy_outlined,
                size: 18,
                color: brandColor,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: message.isUser ? brandColor : Colors.grey[100],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(message.isUser ? 16 : 4),
                  bottomRight: Radius.circular(message.isUser ? 4 : 16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  fontSize: 15,
                  color: message.isUser ? Colors.white : Colors.black87,
                  height: 1.4,
                ),
              ),
            ),
          ),
          if (message.isUser) ...[
            const SizedBox(width: 8),
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 16,
              child: Icon(
                Icons.person_outline,
                size: 18,
                color: Colors.grey[700],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTypingIndicator(Color brandColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: brandColor.withOpacity(0.1),
            radius: 16,
            child: Icon(Icons.smart_toy_outlined, size: 18, color: brandColor),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                _buildDot(0),
                const SizedBox(width: 4),
                _buildDot(1),
                const SizedBox(width: 4),
                _buildDot(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      builder: (context, value, child) {
        final delay = index * 0.2;
        final animValue = (value - delay).clamp(0.0, 1.0);
        return Opacity(
          opacity: 0.3 + (animValue * 0.7),
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
      onEnd: () {
        if (mounted) setState(() {});
      },
    );
  }

  Widget _buildMessageInput(Color brandColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  controller: _messageController,
                  enabled: _isConnected,
                  decoration: InputDecoration(
                    hintText: _isConnected
                        ? 'Ask about your document...'
                        : 'Connecting...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: _isConnected ? brandColor : Colors.grey,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white, size: 20),
                onPressed: _isConnected ? _sendMessage : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final bool isSystem;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.isSystem = false,
  });
}
