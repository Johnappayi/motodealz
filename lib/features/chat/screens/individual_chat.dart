import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/widgets/custom_indicator.dart';
import 'package:motodealz/features/chat/controller/chat_room_controller.dart';
import 'package:motodealz/features/chat/model/message_model.dart';
import 'package:motodealz/utils/constants/sizes.dart';
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.receiverUserId});

  final String receiverUserId;

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final ChatRoomController _chatController = Get.put(ChatRoomController());
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  late Stream<List<MessageModel>> _messagesStream;

  @override
  void initState() {
    super.initState();
    _messagesStream = _chatController.getMessages(widget.receiverUserId) as Stream<List<MessageModel>>;
  }

  @override
  Widget build(BuildContext context) {
    // final darkMode = MHelperFunctions.isDarkMode(context);
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<MessageModel>>(
                stream: _messagesStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CustomIndicator();
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final message = snapshot.data![index];
                        final isCurrentUserMessage =
                            message.senderId == user?.uid;

                        return Align(
                          alignment: isCurrentUserMessage
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(message.message),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("No messages here"),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MSizes.md, vertical: MSizes.md),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      _sendMessage(_messageController.text.trim(), user?.uid);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String message, String? userId) {
    if (message.isNotEmpty && userId != null) {
      _chatController.sendMessage(message, userId);
      _messageController.clear();
    }
  }
}
