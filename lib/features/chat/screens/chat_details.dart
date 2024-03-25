// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:motodealz/features/chat/controller/chat_controller.dart';
// import 'package:motodealz/features/chat/model/chat_item.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class ChatScreen extends StatelessWidget {
//   final ChatController _chatController = Get.put(ChatController());
//   final TextEditingController _messageController = TextEditingController();

//   ChatScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     User? user = FirebaseAuth.instance.currentUser;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<List<ChatItem>>(
//               stream: _chatController.getMessages(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   List<ChatItem> messages = snapshot.data!;
//                   return ListView.builder(
//                     itemCount: messages.length,
//                     itemBuilder: (context, index) {
//                       ChatItem message = messages[index];
//                       return ListTile(
//                         title: Text(message.lastMsg),
//                         subtitle: Text(message.lastMsgTime.toString()),
//                       );
//                     },
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else {
//                   return const CircularProgressIndicator();
//                 }
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: _messageController,
//                     decoration: const InputDecoration(
//                       hintText: 'Type a message...',
//                     ),
//                     onFieldSubmitted: (value) {
//                       _sendMessage(value, user?.uid);
//                     },
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: () {
//                     _sendMessage(_messageController.text.trim(), user?.uid);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _sendMessage(String message, String? userId) {
//     if (message.isNotEmpty && userId != null) {
//       _chatController.sendMessage(message, userId);
//       _messageController.clear();
//     }
//   }
// }
