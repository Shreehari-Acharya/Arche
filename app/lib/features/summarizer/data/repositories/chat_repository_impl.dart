import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_websocket_datasource.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatWebSocketDataSource webSocketDataSource;

  ChatRepositoryImpl({required this.webSocketDataSource});

  @override
  Stream<Map<String, dynamic>> connectToChat(String documentId) {
    return webSocketDataSource.connect(documentId);
  }

  @override
  void sendMessage(String message) {
    webSocketDataSource.sendMessage(message);
  }

  @override
  void disconnect() {
    webSocketDataSource.disconnect();
  }
}