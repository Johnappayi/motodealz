// inbox_item.dart

import 'package:flutter/material.dart';
import 'package:motodealz/features/chat/model/chat_item.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart'; // Import the ChatItem model

class InboxItem extends StatelessWidget {
  final ChatItem chatItem; // Receive ChatItem as a parameter

  const InboxItem({Key? key, required this.chatItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);

    // Build UI using chatItem
    return ListTile(
      title: Text(
        chatItem.name,
        style: MFonts.fontCH2,
      ),
      subtitle: Text(
        chatItem.lastMsg,
        overflow: TextOverflow.ellipsis,
        style: MFonts.fontCB1
            .copyWith(color: darkMode ? MColors.darkGrey : MColors.lightGrey),
      ),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(chatItem.dp),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(chatItem.lastMsgTime,style: MFonts.fontCB3.copyWith(color: darkMode ? MColors.darkGrey : MColors.lightGrey),),
          Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: MColors.secondary),
              child: Center(
                  child: Text(
                chatItem.unreadCount,
                style: MFonts.fontCB4,
              )))
        ],
      ),
    );
  }
}
