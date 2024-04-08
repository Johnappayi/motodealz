// inbox_item.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/features/chat/controller/chat_room_controller.dart';
import 'package:motodealz/features/chat/model/chat_room.dart';
import 'package:motodealz/features/chat/screens/individual_chat.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class InboxItem extends StatelessWidget {
  final ChatRoom chatItem;

  const InboxItem({super.key, required this.chatItem});

  @override
  Widget build(BuildContext context) {
    final ChatRoomController chatController = Get.put(ChatRoomController());

    final bool darkMode = MHelperFunctions.isDarkMode(context);
    User? user = FirebaseAuth.instance.currentUser;
    String displayId;
    if (chatItem.buyerId == user?.uid) {
      displayId = chatItem.sellerId;
    } else {
      displayId = chatItem.buyerId;
    }

    return FutureBuilder<String?>(
      future: chatController.getUserName(displayId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator while waiting for the display name
          return const ListTile(
            title: SizedBox(),
          );
        } else if (snapshot.hasError) {
          // Handle error if any
          return const ListTile(
            title: Text('Error loading display name'),
          );
        } else {
          // Display the ListTile with the fetched display name
          return GestureDetector(
            onTap: () {
              MHelperFunctions.navigateToScreen(
                  context, ChatScreen(roomId: chatItem.chatRoomId, displayName: snapshot.data ?? '',));
            },
            child: ListTile(
              title: Text(
                snapshot.data ?? '', // Use snapshot.data as the display name
                style: MFonts.fontCH2,
              ),
              subtitle: Text(
                chatItem.lastMsg,
                overflow: TextOverflow.ellipsis,
                style: MFonts.fontCB1.copyWith(
                  color: darkMode ? MColors.darkGrey : MColors.lightGrey,
                ),
              ),
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(MImages.sampleUser1),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    MHelperFunctions.getFormattedTime(chatItem.lastMsgTime),
                    style: MFonts.fontCB3.copyWith(
                      color: darkMode ? MColors.darkGrey : MColors.lightGrey,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: MColors.secondary,
                    ),
                    child: Center(
                      child: Text(
                        chatItem.unreadCount.toString(),
                        style: MFonts.fontCB4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
