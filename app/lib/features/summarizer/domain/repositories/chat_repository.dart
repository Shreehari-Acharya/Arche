abstract class ChatRepository {
  Stream<Map<String, dynamic>> connectToChat(String documentId);
  void sendMessage(String message);
  void disconnect();
}