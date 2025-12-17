import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class ChatWebSocketDataSource {
  Stream<Map<String, dynamic>> connect(String documentId);
  void sendMessage(String message);
  void disconnect();
}

class ChatWebSocketDataSourceImpl implements ChatWebSocketDataSource {
  WebSocketChannel? _channel;
  final String baseUrl;
  String? _documentId;
  final _messageController = StreamController<Map<String, dynamic>>.broadcast();

  ChatWebSocketDataSourceImpl({
    this.baseUrl = 'wss://your-api-url.com/ws/chat',
  });

  @override
  Stream<Map<String, dynamic>> connect(String documentId) {
    _documentId = documentId;
    
    try {
      _channel = WebSocketChannel.connect(
        Uri.parse('$baseUrl/$documentId'),
      );

      _channel!.stream.listen(
        (data) {
          final message = json.decode(data as String) as Map<String, dynamic>;
          _messageController.add(message);
        },
        onError: (error) {
          _messageController.addError(error);
        },
        onDone: () {
          _messageController.add({
            'type': 'connection_closed',
            'message': 'Connection closed',
          });
        },
      );

      return _messageController.stream;
    } catch (e) {
      _messageController.addError(e);
      return _messageController.stream;
    }
  }

  @override
  void sendMessage(String message) {
    if (_channel != null && _documentId != null) {
      final messageData = {
        'type': 'user_message',
        'documentId': _documentId,
        'message': message,
        'timestamp': DateTime.now().toIso8601String(),
      };
      
      _channel!.sink.add(json.encode(messageData));
    }
  }

  @override
  void disconnect() {
    _channel?.sink.close();
    _channel = null;
    _documentId = null;
  }

  void dispose() {
    disconnect();
    _messageController.close();
  }
}