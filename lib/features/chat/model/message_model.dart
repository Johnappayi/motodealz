class MessageModel {
  String message;
  final DateTime timestamp;
  String senderId;
  MessageModel({required this.message, required this.timestamp, required this.senderId});
}
