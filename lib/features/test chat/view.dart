import 'package:flutter/material.dart';
import 'package:motodealz/features/test%20chat/controller.dart';
import 'package:motodealz/features/test%20chat/model.dart';

class ChatRoomView extends StatefulWidget {
  final String roomId;
  final String userId;

  const ChatRoomView({super.key, required this.roomId, required this.userId});

  @override
  ChatRoomViewState createState() => ChatRoomViewState();
}

class ChatRoomViewState extends State<ChatRoomView> {
  final ChatController _chatController = ChatController();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Room'),
      ),
      body: Column(
        children: [
          Expanded(
            child:
             StreamBuilder<List<Message>>(
              stream: _chatController.getMessages(widget.roomId),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<Message> messages = snapshot.data!;

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    Message message = messages[index];
                    return ListTile(
                      title: Text(message.text),
                      subtitle: Text(message.senderId),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(labelText: 'Enter your message'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _chatController.sendMessage(widget.roomId, widget.userId, _textController.text);
                    _textController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatRoomSelectionScreen extends StatelessWidget {
  const ChatRoomSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Chat Room'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Chat Room 1'),
            onTap: () {
              // Navigate to ChatRoomView with roomId and userId parameters
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatRoomView(roomId: 'room1', userId: 'user1'),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Chat Room 2'),
            onTap: () {
              // Navigate to ChatRoomView with roomId and userId parameters
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatRoomView(roomId: 'room2', userId: 'user1'),
                ),
              );
            },
          ),
          // Add more chat room options as needed
        ],
      ),
    );
  }
}
