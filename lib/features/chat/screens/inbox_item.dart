// inbox_item.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/model/user_details.dart';
import 'package:motodealz/features/chat/controller/chat_room_controller.dart';
import 'package:motodealz/features/chat/model/chat_room.dart';
import 'package:motodealz/features/chat/screens/individual_chat.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:motodealz/utils/http/http_client.dart';

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
    Future<String> convertProfilePictureUrl(String url) async {
      // Get the Future<String>
      final httpsUrl =
          await MHttpHelper.convertGCSUrlToHttps(url); // Await the Future
      // Use httpsUrl here (e.g., display in an image widget)
      return httpsUrl; // Optionally return the httpsUrl for further use
    }

    return FutureBuilder<UserModel?>(
      future: chatController.fetchUserDetails(displayId),
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
          final userModel = snapshot.data;
          final fullName = userModel != null
              ? '${userModel.firstname} ${userModel.lastname}'
              : '';
          // Display the ListTile with the fetched display name
          return GestureDetector(
            onTap: () {
              MHelperFunctions.navigateToScreen(
                  context,
                  ChatScreen(
                    roomId: chatItem.chatRoomId,
                    displayName: fullName,
                    dp: userModel.profilePicture,
                  ));
            },
            child: ListTile(
              title: Text(
                fullName, // Use snapshot.data as the display name
                style: MFonts.fontCH2,
              ),
              subtitle: Text(
                chatItem.lastMsg,
                overflow: TextOverflow.ellipsis,
                style: MFonts.fontCB1.copyWith(
                  color: darkMode ? MColors.darkGrey : MColors.lightGrey,
                ),
              ),
              leading: FutureBuilder<String>(
                future: convertProfilePictureUrl(
                    userModel!.profilePicture), // Get the Future<String>
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CircleAvatar(
                        radius: 30,
                        backgroundColor: MColors.darkGrey,
                        backgroundImage: AssetImage(MImages.sampleUser1),
                      ); // Show loading indicator
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}'); // Handle error
                      } else {
                        final httpsUrl = snapshot.data!;
                        return CircleAvatar(
                          radius: 30,
                          backgroundColor: MColors.darkGrey,
                          backgroundImage: NetworkImage(httpsUrl),
                        );
                      }
                    default:
                      return const CircleAvatar(
                        radius: 30,
                        backgroundColor: MColors.darkGrey,
                        backgroundImage: AssetImage(MImages.sampleUser1),
                      ); // Handle unexpected states (optional)
                  }
                },
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
                  // Container(
                  //   height: 20,
                  //   width: 20,
                  //   decoration: const BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: MColors.secondary,
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       chatItem.unreadCount.toString(),
                  //       style: MFonts.fontCB4,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
