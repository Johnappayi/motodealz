import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motodealz/features/test%20chat/model.dart';
class ChatController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String roomId, String senderId, String text) async {
    try {
      await _firestore.collection('rooms').doc(roomId).collection('messages').add({
        'senderId': senderId,
        'text': text,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      // print('Error sending message: $e');
    }
  }

  Stream<List<Message>> getMessages(String roomId) {
    return _firestore.collection('rooms').doc(roomId).collection('messages').orderBy('timestamp').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return Message(
          senderId: data['senderId'],
          text: data['text'],
          timestamp: data['timestamp'].toDate(),
        );
      }).toList();
    });
  }
}