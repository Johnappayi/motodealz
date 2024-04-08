import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:motodealz/features/chat/model/chat_room.dart';
import 'package:motodealz/features/chat/model/message_model.dart';

class ChatRoomController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<List<ChatRoom>> getAllChatRooms(String userId) {
    return _firestore.collection("ChatRoom").snapshots().map((snapshot) =>
        snapshot.docs
            .map((doc) => ChatRoom.fromFirestore(doc))
            .where((chatRoom) =>
                chatRoom.buyerId == userId || chatRoom.sellerId == userId)
            .toList());
  }

  Stream<List<ChatRoom>> getBuyingChatRooms(String userId) {
    return _firestore
        .collection("ChatRoom")
        .where('BuyerId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => ChatRoom.fromFirestore(doc)).toList());
  }

  Stream<List<ChatRoom>> getSellingChatRooms(String userId) {
    return _firestore
        .collection("ChatRoom")
        .where('SellerId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => ChatRoom.fromFirestore(doc)).toList());
  }

  Future<String> createChatRoom(String buyerId, String sellerId) async {
    try {
      String roomId = appendAndSortStrings(buyerId, sellerId);

      // Check if the chat room already exists
      DocumentSnapshot roomSnapshot =
          await _firestore.collection("ChatRoom").doc(roomId).get();
      if (roomSnapshot.exists) {
        // Chat room already exists, return the existing room ID
        return roomSnapshot.id;
      }

      // Chat room doesn't exist, create it
      await _firestore.collection("ChatRoom").doc(roomId).set({
        'BuyerId': buyerId,
        'SellerId': sellerId,
        'LastMsg': '', // Initialize with empty string
        'LastMsgTime': DateTime.now(), // Initialize with current time
        'UnreadCount': 0, // Initialize with 0
        // You can add more properties if needed, such as timestamps, etc.
      });

      // Return the newly created room ID
      return roomId;
    } catch (e) {
      // Handle error
      // print('Error creating chat room: $e');
      return ''; // Return empty string in case of error
    }
  }

// Inside _onChatPressed function
  Future<void> sendMessage(String text, String senderId, String roomId) async {
    try {
      await _firestore.collection('ChatRoom').doc(roomId).update({
        'LastMsg': text,
        'LastMsgTime': DateTime.now(),
        'UnreadCount': FieldValue.increment(1),
      }).then((value) => _firestore
              .collection('ChatRoom')
              .doc(roomId)
              .collection('Messages')
              .add({
            'SenderId': senderId,
            'Text': text,
            'Timestamp': DateTime.now(),
          }));
    } catch (e) {
      // Handle error
    }
  }

  Stream<List<Message>> getMessages(String roomId) {
    return _firestore
        .collection('ChatRoom')
        .doc(roomId)
        .collection('Messages')
        .orderBy('Timestamp')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Message.fromFirestore(doc)).toList());
  }

  Future<ChatRoom?> getChatRoomDetails(String roomId) async {
    try {
      DocumentSnapshot roomSnapshot =
          await _firestore.collection("ChatRoom").doc(roomId).get();

      if (roomSnapshot.exists) {
        // Chat room exists, parse its details
        return ChatRoom.fromFirestore(roomSnapshot);
      } else {
        // Chat room doesn't exist
        return ChatRoom.empty();
      }
    } catch (e) {
      // Handle error
      // print('Error getting chat room details: $e');
      return null;
    }
  }

  String appendAndSortStrings(String str1, String str2) {
    List<String> ids = [str1, str2];
    ids.sort();
    return ids.join('_');
  }
}
