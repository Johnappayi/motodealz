// chat_room.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoom {
  final String chatRoomId;
  final String buyerId;
  final String sellerId;
  final String lastMsg;
  final DateTime lastMsgTime;
  final int unreadCount;
  final String profilePicture;

  ChatRoom({
    required this.chatRoomId,
    required this.buyerId,
    required this.sellerId,
    required this.lastMsg,
    required this.lastMsgTime,
    required this.unreadCount,
    required this.profilePicture,
  });

  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

factory ChatRoom.fromFirestore(DocumentSnapshot doc) {
  if (doc.exists) {
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

    if (data != null) {
      return ChatRoom(
        chatRoomId: doc.id,
        buyerId: data['BuyerId'] ?? '', // Update field name and handle null case
        sellerId: data['SellerId'] ?? '', // Update field name and handle null case
        lastMsg: data['LastMsg'] ?? '',
        lastMsgTime: (data['LastMsgTime'] as Timestamp?)?.toDate() ?? DateTime.now(),
        unreadCount: data['UnreadCount'] ?? 0,
        profilePicture: '', // You can add the profile picture logic here
      );
    }
  }
  // Return an empty ChatRoom instance if the document doesn't exist or data is null
  return ChatRoom.empty();
}
static ChatRoom empty() => ChatRoom(
        chatRoomId: '',
        buyerId: '',
        sellerId: '',
        lastMsg: '',
        lastMsgTime: DateTime.now(), // Use current time for empty creation
        unreadCount: 0,
        profilePicture: '', // Consider adding profile picture logic here
      );
}
