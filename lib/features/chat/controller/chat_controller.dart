// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:motodealz/features/chat/model/chat_item.dart';

// class ChatController extends GetxController {

//   // Get instance of firestore
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Get user stream
//   Stream<List<Map<String,dynamic>>> getUsersStream() {
//     return _firestore.collection("Users").snapshots().map((snapshot) {
//       return snapshot.docs.map((doc){
//         // go through each individual user
//         final user = doc.data();

//         // return user
//         return user;
//       }).toList();
//     });
//   }

//   // Stream of chat messages
//   Stream<List<ChatItem>> getMessages() {
//     return _chatCollection
//         .orderBy('timestamp', descending: true)
//         .snapshots()
//         .map((snapshot) => snapshot.docs
//             .map((doc) => ChatItem.fromFirestore(doc))
//             .toList());
//   }

//   // Method to send a message
//   Future<void> sendMessage(String text, String senderId) async {
//     try {
//       await _chatCollection.add({
//         'text': text,
//         'senderId': senderId,
//         'timestamp': Timestamp.now(),
//       });
//     } catch (e) {
//       // print('Error sending message: $e');
//       // Handle the error accordingly, such as showing a snackbar or logging
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:motodealz/features/chat/model/chat_item.dart';

class ChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ChatItem>> getMessages() {
    return _firestore
        .collection("Messages")
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ChatItem.fromFirestore(doc))
            .toList());
  }

  Future<void> sendMessage(String text, String senderId) async {
    try {
      await _firestore.collection("Messages").add({
        'text': text,
        'senderId': senderId,
        'timestamp': Timestamp.now(),
      });
    } catch (e) {
      print('Error sending message: $e');
    }
  }
}
