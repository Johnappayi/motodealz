import 'package:cloud_firestore/cloud_firestore.dart';

class ChatItem {
  final String sender;
  final String text;
  final Timestamp timestamp;
  final Timestamp lastMsgTime;
  final String unreadCount;
  final String profilePicture;

  ChatItem({
    required this.lastMsgTime,
    required this.unreadCount,
    required this.profilePicture,
    required this.sender,
    required this.text,
    required this.timestamp,
  });

  factory ChatItem.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ChatItem(
      sender: data['sender'],
      text: data['text'] ?? '',
      timestamp: data['timestamp'] ?? Timestamp.now(),
      lastMsgTime: data['lastMsgTime'] ?? Timestamp.now(),
      unreadCount: '',
      profilePicture: '',
    );
  }
}
