import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/widgets/own_message_card.dart';
import 'package:motodealz/common/widgets/reply_card.dart';
import 'package:motodealz/features/chat/controller/chat_room_controller.dart';
import 'package:motodealz/features/chat/model/chat_room.dart';
import 'package:motodealz/features/chat/model/message_model.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.roomId});
  final String roomId;

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final ChatRoomController _chatController = Get.put(ChatRoomController());
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    User? user = FirebaseAuth.instance.currentUser;
    String displayName;

    return FutureBuilder<ChatRoom?>(
        future: _chatController.getChatRoomDetails(widget.roomId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (snapshot.hasError || snapshot.data == null) {
            // Handle error or null data
            return const Scaffold(
              body: Center(
                child: Text("Oops, something went wrong..."),
              ),
            );
          }

          // Chat room details are available
          ChatRoom chatRoom = snapshot.data!;

          // Fetch full names asynchronously
          Future<Map<String, dynamic>?> buyerNamesFuture =
              _chatController.getUserNames(chatRoom.buyerId);
          Future<Map<String, dynamic>?> sellerNamesFuture =
              _chatController.getUserNames(chatRoom.sellerId);

          return FutureBuilder<List<Map<String, dynamic>?>>(
            future: Future.wait([buyerNamesFuture, sellerNamesFuture]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (snapshot.hasError || snapshot.data == null) {
                // Handle error or null data
                return const Scaffold(
                  body: Center(
                    child: Text("Oops, something went wrong..."),
                  ),
                );
              }

              // Buyer and seller full names are available
              String buyerName = snapshot.data![0]?['Firstname' ] ?? 'Unknown';
              String sellerName = snapshot.data![1]?['FirstName'] ?? 'Unknown';

              print(snapshot.data![0]);

              // Use chatRoom details in your UI
              if (chatRoom.buyerId == user?.uid) {
                displayName = sellerName;
              } else {
                displayName = buyerName;
              }

              return Scaffold(
                body: SafeArea(
                  child: Container(
                    decoration: BoxDecoration(
                      color: darkMode
                          ? MColors.primaryBackground
                          : MColors.primary,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: MSizes.defaultSpace,
                            vertical: MSizes.md,
                          ),
                          decoration: BoxDecoration(
                            color: darkMode
                                ? MColors.primaryBackground
                                : MColors.primary,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                displayName,
                                style: MFonts.fontAH1.copyWith(
                                  color: darkMode
                                      ? MColors.primary
                                      : MColors.white,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: darkMode
                                        ? MColors.primary
                                        : MColors.white,
                                    width: 3.0,
                                  ),
                                ),
                                child: const CircleAvatar(
                                  radius: 32,
                                  backgroundImage:
                                      AssetImage(MImages.sampleUser1),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(vertical: MSizes.lg),
                            decoration: BoxDecoration(
                              color: darkMode
                                  ? MColors.darkerGrey
                                  : MColors.primaryBackground,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: StreamBuilder<List<Message>>(
                              stream:
                                  _chatController.getMessages(widget.roomId),
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
                                    if (message.senderId == user?.uid) {
                                      return OwnMessageCard(
                                        message: message.text,
                                        time: message.timestamp
                                            .toString(), // Assuming timestamp is a DateTime object
                                      );
                                    } else {
                                      return ReplyCard(
                                        message: message.text,
                                        time: message.timestamp
                                            .toString(), // Assuming timestamp is a DateTime object
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: darkMode
                                ? MColors.darkerGrey
                                : MColors.primaryBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(MSizes.md),
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
                                    _chatController.sendMessage(
                                        _messageController.text,
                                        user!.uid,
                                        widget.roomId);
                                    _messageController.clear();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
