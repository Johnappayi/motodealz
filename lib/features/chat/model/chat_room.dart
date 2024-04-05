import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoom {
  final String buyer;
  final String seller;
  // List<MessageModel> messages;

  final DateTime? timestamp;
  final String? sender;
  final String lastMsg;

  final DateTime lastMsgTime;
  final String unreadCount;
  final String profilePicture;

  ChatRoom({
    required this.lastMsgTime,
    required this.unreadCount,
    required this.profilePicture,
    required this.sender,
    required this.lastMsg,
    required this.timestamp,
    required this.buyer,
    required this.seller,
  });

  factory ChatRoom.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ChatRoom(
      sender: data['sender'],
      lastMsg: data['lastMsg'] ?? '',
      timestamp: data['timestamp'] ?? Timestamp.now(),
      lastMsgTime: data['lastMsgTime'] ?? Timestamp.now(),
      unreadCount: '',
      profilePicture: '', buyer: '', seller: '',
    );
  }
}
