import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/common/styles/text_style.dart';
import 'package:motodealz/data/repositories/authentication/authentication_repository.dart';
import 'package:motodealz/features/chat/controller/chat_room_controller.dart';
import 'package:motodealz/features/chat/model/chat_room.dart';
import 'package:motodealz/features/chat/screens/inbox_item.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  InboxScreenState createState() => InboxScreenState();
}

class InboxScreenState extends State<InboxScreen>
    with AutomaticKeepAliveClientMixin<InboxScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final ChatRoomController _chatRoomController = Get.put(ChatRoomController());
  final authController = Get.put(AuthenticationRepository());

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    final user = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: darkMode ? MColors.primaryBackground : MColors.primary,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: MSizes.defaultSpace,
                vertical: MSizes.md,
              ),
              decoration: BoxDecoration(
                color: darkMode ? MColors.primaryBackground : MColors.primary,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Messages",
                    style: MFonts.fontAH1.copyWith(
                      color: darkMode ? MColors.primary : MColors.white,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: darkMode ? MColors.primary : MColors.white,
                        width: 3.0,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage(MImages.sampleUser1),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: darkMode ? MColors.black : MColors.primary2Light,
                    width: 1.0,
                  ),
                ),
                color:
                    darkMode ? MColors.darkerGrey : MColors.primaryBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildTabItem("All", 0, _selectedIndex == 0),
                  buildTabItem("Buying", 1, _selectedIndex == 1),
                  buildTabItem("Selling", 2, _selectedIndex == 2),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                children: [
                  _buildChatList(
                      _chatRoomController.getAllChatRooms(user!.uid)),
                  _buildChatList(
                      _chatRoomController.getBuyingChatRooms(user.uid)),
                  _buildChatList(
                      _chatRoomController.getSellingChatRooms(user.uid)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatList(Stream<List<ChatRoom>> chatRoomsStream) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return Container(
      color: darkMode ? MColors.darkerGrey : MColors.primaryBackground,
      child: StreamBuilder<List<ChatRoom>>(
        stream: chatRoomsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error: edaa mandaa'),
              // ${snapshot.error}
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No chat rooms available'),
            );
          } else {
            List<ChatRoom> chatRooms = snapshot.data!;
            return ListView.separated(
              itemBuilder: (context, index) {
                return InboxItem(chatItem: chatRooms[index]);
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(),
                );
              },
              itemCount: chatRooms.length,
            );
          }
        },
      ),
    );
  }

  Widget buildTabItem(String title, int index, bool isSelected) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: MSizes.md),
        decoration: BoxDecoration(
          border: isSelected
              ? Border(
                  bottom: BorderSide(
                    color: darkMode ? MColors.secondary : MColors.primary,
                    width: 2,
                  ),
                )
              : null,
        ),
        child: Text(
          title,
          style: MTextStyles.tabHead(isSelected, darkMode),
        ),
      ),
    );
  }
}
