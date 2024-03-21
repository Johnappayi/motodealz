import 'package:cloud_firestore/cloud_firestore.dart';

class ChatItem {
  const ChatItem({
    required this.name,
    required this.lastMsg,
    required this.lastMsgTime,
    required this.unreadCount,
    required this.dp,
  });

  final String name;
  final String lastMsg;
  final String lastMsgTime;
  final String unreadCount;
  final String dp;

  // Factory method to convert Firestore snapshot to ChatMessage object
  factory ChatItem.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ChatItem(
      name: doc.id, // Assuming the name is the document ID
      lastMsg: data['text'] ?? '',
      lastMsgTime: (data['timestamp'] as Timestamp).toDate().toString(),
      unreadCount: '', // Add your logic to retrieve unread count
      dp: '', // Add your logic to retrieve user's profile image URL
    );
  }
}
