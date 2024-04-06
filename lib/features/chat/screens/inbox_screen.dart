
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:motodealz/common/styles/text_style.dart';
import 'package:motodealz/features/chat/model/chat_room.dart';
import 'package:motodealz/features/chat/screens/inbox_item.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
// mport 'package:motodealz/features/chat/controller/chat_controller.dart';

class InboxScreen extends StatefulWidget {
  // final ChatController chatController = Get.put(ChatController());
  const InboxScreen({super.key});

  @override
  InboxScreenState createState() => InboxScreenState();
}

class InboxScreenState extends State<InboxScreen>
    with AutomaticKeepAliveClientMixin<InboxScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<ChatRoom> allChatItems = [
    ChatRoom(
      sender: 'Aadit Viji',
      lastMsg: 'Hey there! Is the vehicle still available?',
      lastMsgTime: DateTime.now(),
      timestamp: DateTime.now(),
      unreadCount: '12',
      profilePicture: MImages.sampleUser1,
      buyer: "",
      seller:""
    ),
    ChatRoom(
      sender: 'Aaron peter',
      lastMsg: 'Hey there! Is the vehicle still available?',
      lastMsgTime: DateTime.now(),
      timestamp: DateTime.now(),
      unreadCount: '12',
      profilePicture: MImages.sampleUser1,
      buyer: "",
      seller:""
    ),
    ChatRoom(
      sender: 'Adithi Viji',
      lastMsg: 'Hey there! Is the vehicle still available?',
      lastMsgTime: DateTime.now(),
      timestamp: DateTime.now(),
      unreadCount: '12',
      profilePicture: MImages.sampleUser1,
      buyer: "",
      seller:""
    ),
    ChatRoom(
      sender: 'Aaron peter',
      lastMsg: 'Hey there! Is the vehicle still available?',
      lastMsgTime: DateTime.now(),
      timestamp: DateTime.now(),
      unreadCount: '12',
      profilePicture: MImages.sampleUser1,
      buyer: "",
      seller:""
    ),
    ChatRoom(
      sender: 'Adithi Viji',
      lastMsg: 'Hey there! Is the vehicle still available?',
      lastMsgTime: DateTime.now(),
      timestamp: DateTime.now(),
      unreadCount: '12',
      profilePicture: MImages.sampleUser1,
      buyer: "",
      seller:""
    ),
  ];

  List<ChatRoom> buyingChatItems = [
    ChatRoom(
      sender: 'Adithi Viji',
      lastMsg: 'Hey there! Is the vehicle still available?',
      lastMsgTime: DateTime.now(),
      timestamp: DateTime.now(),
      unreadCount: '12',
      profilePicture: MImages.sampleUser1,
      buyer: "",
      seller:""
    ),
    ChatRoom(
      sender: 'Adithi Viji',
      lastMsg: 'Hey there! Is the vehicle still available?',
      lastMsgTime: DateTime.now(),
      timestamp: DateTime.now(),
      unreadCount: '12',
      profilePicture: MImages.sampleUser1,
      buyer: "",
      seller:""
    ),
    ChatRoom(
      sender: 'Adithi Viji',
      lastMsg: 'Hey there! Is the vehicle still available?',
      lastMsgTime: DateTime.now(),
      timestamp: DateTime.now(),
      unreadCount: '12',
      profilePicture: MImages.sampleUser1,
      buyer: "",
      seller:""
    ),
  ];

  List<ChatRoom> sellingChatItems = [
    ChatRoom(
      sender: 'Aaron peter',
      lastMsg: 'Hey there! Is the vehicle still available?',
      lastMsgTime: DateTime.now(),
      timestamp: DateTime.now(),
      unreadCount: '12',
      profilePicture: MImages.sampleUser1,
      buyer: "",
      seller:""
    ),
    ChatRoom(
      sender: 'Aaron peter',
      lastMsg: 'Hey there! Is the vehicle still available?',
      lastMsgTime: DateTime.now(),
      timestamp: DateTime.now() ,
      unreadCount: '12',
      profilePicture: MImages.sampleUser1, buyer: '', seller: '',
    ),
  ];

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    // List<ChatRoom> selectedChatItems = _getSelectedChatItems();

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            color: darkMode ? MColors.primaryBackground : MColors.primary),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: MSizes.defaultSpace, vertical: MSizes.md),
              decoration: BoxDecoration(
                  color:
                      darkMode ? MColors.primaryBackground : MColors.primary),
              child: 
              Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  "Messages",
                  style: MFonts.fontAH1.copyWith(
                      color: darkMode ? MColors.primary : MColors.white),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: darkMode
                          ? MColors.primary
                          : MColors.white, // specify the color here
                      width: 3.0, // specify the width here
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage(MImages.sampleUser1),
                  ),
                )
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                border:  Border(
                  bottom: BorderSide(
                    color: darkMode ? MColors.black : MColors.primary2Light, // specify the color here
                    width: 1.0, // specify the width here
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
                  Container(
                    color: darkMode
                        ? MColors.darkerGrey
                        : MColors.primaryBackground,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InboxItem(
                            chatItem: _getSelectedChatItems()[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Divider(),
                        );
                      },
                      itemCount: _getSelectedChatItems().length,
                    ),
                  ),
                  Container(
                    color: darkMode
                        ? MColors.darkerGrey
                        : MColors.primaryBackground,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InboxItem(
                            chatItem: _getSelectedChatItems()[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Divider(),
                        );
                      },
                      itemCount: _getSelectedChatItems().length,
                    ),
                  ),
                  Container(
                    color: darkMode
                        ? MColors.darkerGrey
                        : MColors.primaryBackground,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InboxItem(
                            chatItem: _getSelectedChatItems()[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Divider(),
                        );
                      },
                      itemCount: _getSelectedChatItems().length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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

  List<ChatRoom> _getSelectedChatItems() {
    switch (_selectedIndex) {
      case 0:
        return allChatItems;
      case 1:
        return buyingChatItems;
      case 2:
        return sellingChatItems;
      default:
        return allChatItems;
    }
  }
}
