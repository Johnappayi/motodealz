import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:motodealz/features/chat/model/chat_room.dart';

class ChatRoomController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ChatRoom>> getMessages(String otherUserId) {
    return _firestore
        .collection("Messages")
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => ChatRoom.fromFirestore(doc)).toList());
  }

  // Method to create a chat room
  Future<void> createChatRoom(String buyerId, String sellerId) async {
    try {
      await _firestore.collection("ChatRooms").add({
        'buyerId': buyerId,
        'sellerId': sellerId,
        'chatRoomid': appendAndSortStrings(buyerId, sellerId),
        // You can add more properties if needed, such as timestamps, etc.
      });
    } catch (e) {
      // Handle error
    }
  }

  Future<void> sendMessage(String text, String senderId) async {
    try {
      await _firestore.collection("Messages").add({
        'text': text,
        'senderId': senderId,
        'timestamp': Timestamp.now(),
      });
    } catch (e) {
      // print('Error sending message: $e');
    }
  }

  String appendAndSortStrings(String str1, String str2) {
    String appendedString = str1 + str2;
    List<String> characters = appendedString.split('');
    characters.sort();
    return characters.join();
  }
}
