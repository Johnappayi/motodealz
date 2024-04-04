import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:motodealz/features/chat/model/chat_item.dart';

class ChatController extends GetxController {
  final CollectionReference _chatCollection =
      FirebaseFirestore.instance.collection('chats');

  // Stream of chat messages
  Stream<List<ChatItem>> getMessages() {
    return _chatCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ChatItem.fromFirestore(doc))
            .toList());
  }

  // Method to send a message
  Future<void> sendMessage(String text, String senderId) async {
    try {
      await _chatCollection.add({
        'text': text,
        'senderId': senderId,
        'timestamp': Timestamp.now(),
      });
    } catch (e) {
      // print('Error sending message: $e');
      // Handle the error accordingly, such as showing a snackbar or logging
    }
  }
}
