// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // // import 'package:get/get.dart';
// // import 'package:motodealz/common/styles/text_style.dart';
// // import 'package:motodealz/features/chat/controller/chat_controller.dart';
// // import 'package:motodealz/features/chat/model/chat_item.dart';
// // import 'package:motodealz/features/chat/screens/inbox_item.dart';
// // import 'package:motodealz/utils/constants/colors.dart';
// // import 'package:motodealz/utils/constants/fonts.dart';
// // import 'package:motodealz/utils/constants/image_strings.dart';
// // import 'package:motodealz/utils/constants/sizes.dart';
// // import 'package:motodealz/utils/helpers/helper_functions.dart';
// // // mport 'package:motodealz/features/chat/controller/chat_controller.dart';

// // class InboxScreen extends StatefulWidget {
// //   final ChatController chatController = Get.put(ChatController());
// //   InboxScreen({Key? key}) : super(key: key);

// //   @override
// //   InboxScreenState createState() => InboxScreenState();
// // }

// // class InboxScreenState extends State<InboxScreen>
// //     with AutomaticKeepAliveClientMixin<InboxScreen> {
// //   int _selectedIndex = 0;
// //   final PageController _pageController = PageController(initialPage: 0);
// //   final _auth = FirebaseAuth.instance;

// //   Widget _buildUserList() {
// //     return StreamBuilder<QuerySnapshot>(
// //       stream: FirebaseFirestore.instance.collection('users').snapshots(),
// //       builder: (context,snapshot){
// //       if(snapshot.hasError) {
// //         return const Text('error');
// //       }

// //       if(snapshot.connectionState == ConnectionState.waiting) {
// //         return const Text('Loading....');
// //       }

// //       return ListView(
// //         children: snapshot.data!.docs.map<Widget>((doc) => _buildUserList(doc)).toList(),
// //       );
// //       },
// //     );
// //      }

// //      // build indivdual user list items
// //      Widget _buildUserListItem(DocumentSnapshot document) {
// //       Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

// //       //display all users except current user
// //       if(_auth.currentUser!.email != data['Receiver']) {
// //         title: data['Receiver'],
// //         OnTap : ();
// //       }
// //      }
// //   }
// //   List<ChatItem> allChatItems = [
// //     const ChatItem(
// //       name: 'Aadit Viji',
// //       lastMsg: 'Hey there! Is the vehicle still available?',
// //       lastMsgTime: null,
// //       unreadCount: '12',
// //       dp: MImages.sampleUser1,
// //     ),
// //     const ChatItem(
// //       name: 'Aaron peter',
// //       lastMsg: 'Hey there! Is the vehicle still available?',
// //       lastMsgTime: '12:00pm',
// //       unreadCount: '12',
// //       dp: MImages.sampleUser1,
// //     ),
// //     const ChatItem(
// //       name: 'Adithi Viji',
// //       lastMsg: 'Hey there! Is the vehicle still available?',
// //       lastMsgTime: '12:00pm',
// //       unreadCount: '12',
// //       dp: MImages.sampleUser1,
// //     ),
// //     const ChatItem(
// //       name: 'Aaron peter',
// //       lastMsg: 'Hey there! Is the vehicle still available?',
// //       lastMsgTime: '12:00pm',
// //       unreadCount: '12',
// //       dp: MImages.sampleUser1,
// //     ),
// //     const ChatItem(
// //       name: 'Adithi Viji',
// //       lastMsg: 'Hey there! Is the vehicle still available?',
// //       lastMsgTime: '12:00pm',
// //       unreadCount: '12',
// //       dp: MImages.sampleUser1,
// //     ),
// //   ];

// //   List<ChatItem> buyingChatItems = [
// //     const ChatItem(
// //       name: 'Adithi Viji',
// //       lastMsg: 'Hey there! Is the vehicle still available?',
// //       lastMsgTime: '12:00pm',
// //       unreadCount: '12',
// //       dp: MImages.sampleUser1,
// //     ),
// //     const ChatItem(
// //       name: 'Adithi Viji',
// //       lastMsg: 'Hey there! Is the vehicle still available?',
// //       lastMsgTime: '12:00pm',
// //       unreadCount: '12',
// //       dp: MImages.sampleUser1,
// //     ),
// //     const ChatItem(
// //       name: 'Adithi Viji',
// //       lastMsg: 'Hey there! Is the vehicle still available?',
// //       lastMsgTime: '12:00pm',
// //       unreadCount: '12',
// //       dp: MImages.sampleUser1,
// //     ),
// //   ];

// //   List<ChatItem> sellingChatItems = [
// //     const ChatItem(
// //       name: 'Aaron peter',
// //       lastMsg: 'Hey there! Is the vehicle still available?',
// //       lastMsgTime: '12:00pm',
// //       unreadCount: '12',
// //       dp: MImages.sampleUser1,
// //     ),
// //     const ChatItem(
// //       name: 'Aaron peter',
// //       lastMsg: 'Hey there! Is the vehicle still available?',
// //       lastMsgTime: '12:00pm',
// //       unreadCount: '12',
// //       dp: MImages.sampleUser1,
// //     ),
// //   ];

// //   @override
// //   bool get wantKeepAlive => true;
// //   @override
// //   Widget build(BuildContext context) {
// //     super.build(context);
// //     final bool darkMode = MHelperFunctions.isDarkMode(context);
// //     // List<ChatItem> selectedChatItems = _getSelectedChatItems();

// //     return SafeArea(
// //       child: Container(
// //         decoration: BoxDecoration(
// //             color: darkMode ? MColors.primaryBackground : MColors.primary),
// //         child: Column(
// //           children: [
// //             Container(
// //               padding: const EdgeInsets.symmetric(
// //                   horizontal: MSizes.defaultSpace, vertical: MSizes.md),
// //               decoration: BoxDecoration(
// //                   color:
// //                       darkMode ? MColors.primaryBackground : MColors.primary),
// //               child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
// //                 Text(
// //                   "texts",
// //                   style: MFonts.fontAH1.copyWith(
// //                       color: darkMode ? MColors.primary : MColors.white),
// //                 ),
// //                 const Spacer(),
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     shape: BoxShape.circle,
// //                     border: Border.all(
// //                       color: darkMode
// //                           ? MColors.primary
// //                           : MColors.white, // specify the color here
// //                       width: 3.0, // specify the width here
// //                     ),
// //                   ),
// //                   child: const CircleAvatar(
// //                     radius: 32,
// //                     backgroundImage: AssetImage(MImages.sampleUser1),
// //                   ),
// //                 )
// //               ]),
// //             ),
// //             Container(
// //               decoration: BoxDecoration(
// //                 border:  Border(
// //                   bottom: BorderSide(
// //                     color: darkMode ? MColors.black : MColors.primary2Light, // specify the color here
// //                     width: 1.0, // specify the width here
// //                   ),
// //                 ),
// //                 color:
// //                     darkMode ? MColors.darkerGrey : MColors.primaryBackground,
// //                 borderRadius: const BorderRadius.only(
// //                   topLeft: Radius.circular(25),
// //                   topRight: Radius.circular(25),
// //                 ),
// //               ),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                 children: [
// //                   buildTabItem("All", 0, _selectedIndex == 0),
// //                   buildTabItem("Buying", 1, _selectedIndex == 1),
// //                   buildTabItem("Selling", 2, _selectedIndex == 2),
// //                 ],
// //               ),
// //             ),
// //             Expanded(
// //               child: PageView(
// //                 controller: _pageController,
// //                 onPageChanged: (index) {
// //                   setState(() {
// //                     _selectedIndex = index;
// //                   });
// //                 },
// //                 children: [
// //                   Container(
// //                     color: darkMode
// //                         ? MColors.darkerGrey
// //                         : MColors.primaryBackground,
// //                     child: ListView.separated(
// //                       itemBuilder: (context, index) {
// //                         return InboxItem(
// //                             chatItem: _getSelectedChatItems()[index]);
// //                       },
// //                       separatorBuilder: (context, index) {
// //                         return const Padding(
// //                           padding: EdgeInsets.only(left: 20, right: 20),
// //                           child: Divider(),
// //                         );
// //                       },
// //                       itemCount: _getSelectedChatItems().length,
// //                     ),
// //                   ),
// //                   Container(
// //                     color: darkMode
// //                         ? MColors.darkerGrey
// //                         : MColors.primaryBackground,
// //                     child: ListView.separated(
// //                       itemBuilder: (context, index) {
// //                         return InboxItem(
// //                             chatItem: _getSelectedChatItems()[index]);
// //                       },
// //                       separatorBuilder: (context, index) {
// //                         return const Padding(
// //                           padding: EdgeInsets.only(left: 20, right: 20),
// //                           child: Divider(),
// //                         );
// //                       },
// //                       itemCount: _getSelectedChatItems().length,
// //                     ),
// //                   ),
// //                   Container(
// //                     color: darkMode
// //                         ? MColors.darkerGrey
// //                         : MColors.primaryBackground,
// //                     child: ListView.separated(
// //                       itemBuilder: (context, index) {
// //                         return InboxItem(
// //                             chatItem: _getSelectedChatItems()[index]);
// //                       },
// //                       separatorBuilder: (context, index) {
// //                         return const Padding(
// //                           padding: EdgeInsets.only(left: 20, right: 20),
// //                           child: Divider(),
// //                         );
// //                       },
// //                       itemCount: _getSelectedChatItems().length,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget buildTabItem(String title, int index, bool isSelected) {
// //     final bool darkMode = MHelperFunctions.isDarkMode(context);
// //     return GestureDetector(
// //       onTap: () {
// //         _pageController.animateToPage(
// //           index,
// //           duration: const Duration(milliseconds: 300),
// //           curve: Curves.ease,
// //         );
// //       },
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(vertical: MSizes.md),
// //         decoration: BoxDecoration(
// //           border: isSelected
// //               ? Border(
// //                   bottom: BorderSide(
// //                     color: darkMode ? MColors.secondary : MColors.primary,
// //                     width: 2,
// //                   ),
// //                 )
// //               : null,
// //         ),
// //         child: Text(
// //           title,
// //           style: MTextStyles.tabHead(isSelected, darkMode),
// //         ),
// //       ),
// //     );
// //   }

// //   List<ChatItem> _getSelectedChatItems() {
// //     switch (_selectedIndex) {
// //       case 0:
// //         return allChatItems;
// //       case 1:
// //         return buyingChatItems;
// //       case 2:
// //         return sellingChatItems;
// //       default:
// //         return allChatItems;
// //     }
// //   }
// // }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:motodealz/common/styles/text_style.dart';
// import 'package:motodealz/features/chat/model/chat_item.dart';
// import 'package:motodealz/features/chat/screens/inbox_item.dart';
// import 'package:motodealz/utils/constants/colors.dart';
// import 'package:motodealz/utils/constants/image_strings.dart';
// import 'package:motodealz/utils/constants/sizes.dart';
// import 'package:motodealz/utils/helpers/helper_functions.dart';

// class InboxScreen extends StatefulWidget {
//   InboxScreen({Key? key}) : super(key: key);

//   @override
//   InboxScreenState createState() => InboxScreenState();
// }

// class InboxScreenState extends State<InboxScreen>
//     with AutomaticKeepAliveClientMixin<InboxScreen> {
//   int _selectedIndex = 0;
//   final PageController _pageController = PageController(initialPage: 0);
//   final _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     final bool darkMode = MHelperFunctions.isDarkMode(context);

//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Messages"),
//           actions: [
//             CircleAvatar(
//               radius: 20,
//               backgroundImage: AssetImage(MImages.sampleUser1),
//             ),
//             SizedBox(width: 16),
//           ],
//         ),
//         body: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                     color: darkMode ? MColors.black : MColors.primary2Light,
//                     width: 1.0,
//                   ),
//                 ),
//                 color:
//                     darkMode ? MColors.darkerGrey : MColors.primaryBackground,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(25),
//                   topRight: Radius.circular(25),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   buildTabItem("All", 0, _selectedIndex == 0),
//                   buildTabItem("Buying", 1, _selectedIndex == 1),
//                   buildTabItem("Selling", 2, _selectedIndex == 2),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: PageView(
//                 controller: _pageController,
//                 onPageChanged: (index) {
//                   setState(() {
//                     _selectedIndex = index;
//                   });
//                 },
//                 children: [
//                   buildChatList(allChatItems),
//                   buildChatList(buyingChatItems),
//                   buildChatList(sellingChatItems),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildChatList(List<ChatItem> chatItems) {
//     final bool darkMode = MHelperFunctions.isDarkMode(context);

//     return Container(
//       color: darkMode ? MColors.darkerGrey : MColors.primaryBackground,
//       child: ListView.separated(
//         itemBuilder: (context, index) {
//           return InboxItem(chatItem: chatItems[index]);
//         },
//         separatorBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.only(left: 20, right: 20),
//             child: Divider(),
//           );
//         },
//         itemCount: chatItems.length,
//       ),
//     );
//   }

//   Widget buildTabItem(String title, int index, bool isSelected) {
//     final bool darkMode = MHelperFunctions.isDarkMode(context);

//     return GestureDetector(
//       onTap: () {
//         _pageController.animateToPage(
//           index,
//           duration: Duration(milliseconds: 300),
//           curve: Curves.ease,
//         );
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: MSizes.md),
//         decoration: BoxDecoration(
//           border: isSelected
//               ? Border(
//                   bottom: BorderSide(
//                     color: darkMode ? MColors.secondary : MColors.primary,
//                     width: 2,
//                   ),
//                 )
//               : null,
//         ),
//         child: Text(
//           title,
//           style: MTextStyles.tabHead(isSelected, darkMode),
//         ),
//       ),
//     );
//   }

//   List<ChatItem> allChatItems = [
//     ChatItem(
//       sender: 'Aadit Viji',
//       text: 'Hey there! Is the vehicle still available?',
//       timestamp: Timestamp.now(),
//       lastMsgTime: Timestamp.now(),
//       unreadCount: '2',
//       profilePicture: MImages.sampleUser1,
//     ),
//     ChatItem(
//       sender: 'Aaron peter',
//       text: 'Hey there! Is the vehicle still available?',
//       timestamp: Timestamp.now(),
//       lastMsgTime: Timestamp.now(),
//       unreadCount: '2',
//       profilePicture: MImages.sampleUser1,
//     ),
//     ChatItem(
//       sender: 'Adithi Viji',
//       text: 'Hey there! Is the vehicle still available?',
//       timestamp: Timestamp.now(),
//       lastMsgTime: Timestamp.now(),
//       unreadCount: '2',
//       profilePicture: MImages.sampleUser1,
//     ),
//     ChatItem(
//       sender: 'Aaron peter',
//       text: 'Hey there! Is the vehicle still available?',
//       timestamp: Timestamp.now(),
//       lastMsgTime: Timestamp.now(),
//       unreadCount: '2',
//       profilePicture: MImages.sampleUser1,
//     ),
//     ChatItem(
//       sender: 'Adithi Viji',
//       text: 'Hey there! Is the vehicle still available?',
//       timestamp: Timestamp.now(),
//       lastMsgTime: Timestamp.now(),
//       unreadCount: '2',
//       profilePicture: MImages.sampleUser1,
//     ),
//   ];

//   List<ChatItem> buyingChatItems = [
//     ChatItem(
//       sender: 'Adithi Viji',
//       text: 'Hey there! Is the vehicle still available?',
//       timestamp: Timestamp.now(),
//       lastMsgTime: Timestamp.now(),
//       unreadCount: '2',
//       profilePicture: MImages.sampleUser1,
//     ),
//     ChatItem(
//       sender: 'Adithi Viji',
//       text: 'Hey there! Is the vehicle still available?',
//       timestamp: Timestamp.now(),
//       lastMsgTime: Timestamp.now(),
//       unreadCount: '2',
//       profilePicture: MImages.sampleUser1,
//     ),
//     ChatItem(
//       sender: 'Adithi Viji',
//       text: 'Hey there! Is the vehicle still available?',
//       timestamp: Timestamp.now(),
//       lastMsgTime: Timestamp.now(),
//       unreadCount: '2',
//       profilePicture: MImages.sampleUser1,
//     ),
//   ];

//   List<ChatItem> sellingChatItems = [
//     ChatItem(
//       sender: 'Aaron peter',
//       text: 'Hey there! Is the vehicle still available?',
//       timestamp: Timestamp.now(),
//       lastMsgTime: Timestamp.now(),
//       unreadCount: '2',
//       profilePicture: MImages.sampleUser1,
//     ),
//     ChatItem(
//       sender: 'Aaron peter',
//       text: 'Hey there! Is the vehicle still available?',
//       timestamp: Timestamp.now(),
//       lastMsgTime: Timestamp.now(),
//       unreadCount: '2',
//       profilePicture: MImages.sampleUser1,
//     ),
//   ];

//   @override
//   bool get wantKeepAlive => true;
//      @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     final bool darkMode = MHelperFunctions.isDarkMode(context);
//     // List<ChatItem> selectedChatItems = _getSelectedChatItems();

//     return SafeArea(
//       child: Container(
//         decoration: BoxDecoration(
//             color: darkMode ? MColors.primaryBackground : MColors.primary),
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: MSizes.defaultSpace, vertical: MSizes.md),
//               decoration: BoxDecoration(
//                   color:
//                       darkMode ? MColors.primaryBackground : MColors.primary),
//               child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
//                 Text(
//                   "texts",
//                   style: MFonts.fontAH1.copyWith(
//                       color: darkMode ? MColors.primary : MColors.white),
//                 ),
//                 const Spacer(),
//                 Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: darkMode
//                           ? MColors.primary
//                           : MColors.white, // specify the color here
//                       width: 3.0, // specify the width here
//                     ),
//                   ),
//                   child: const CircleAvatar(
//                     radius: 32,
//                     backgroundImage: AssetImage(MImages.sampleUser1),
//                   ),
//                 )
//               ]),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border:  Border(
//                   bottom: BorderSide(
//                     color: darkMode ? MColors.black : MColors.primary2Light, // specify the color here
//                     width: 1.0, // specify the width here
//                   ),
//                 ),
//                 color:
//                     darkMode ? MColors.darkerGrey : MColors.primaryBackground,
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(25),
//                   topRight: Radius.circular(25),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   buildTabItem("All", 0, _selectedIndex == 0),
//                   buildTabItem("Buying", 1, _selectedIndex == 1),
//                   buildTabItem("Selling", 2, _selectedIndex == 2),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: PageView(
//                 controller: _pageController,
//                 onPageChanged: (index) {
//                   setState(() {
//                     _selectedIndex = index;
//                   });
//                 },
//                 children: [
//                   Container(
//                     color: darkMode
//                         ? MColors.darkerGrey
//                         : MColors.primaryBackground,
//                     child: ListView.separated(
//                       itemBuilder: (context, index) {
//                         return InboxItem(
//                             chatItem: _getSelectedChatItems()[index]);
//                       },
//                       separatorBuilder: (context, index) {
//                         return const Padding(
//                           padding: EdgeInsets.only(left: 20, right: 20),
//                           child: Divider(),
//                         );
//                       },
//                       itemCount: _getSelectedChatItems().length,
//                     ),
//                   ),
//                   Container(
//                     color: darkMode
//                         ? MColors.darkerGrey
//                         : MColors.primaryBackground,
//                     child: ListView.separated(
//                       itemBuilder: (context, index) {
//                         return InboxItem(
//                             chatItem: _getSelectedChatItems()[index]);
//                       },
//                       separatorBuilder: (context, index) {
//                         return const Padding(
//                           padding: EdgeInsets.only(left: 20, right: 20),
//                           child: Divider(),
//                         );
//                       },
//                       itemCount: _getSelectedChatItems().length,
//                     ),
//                   ),
//                   Container(
//                     color: darkMode
//                         ? MColors.darkerGrey
//                         : MColors.primaryBackground,
//                     child: ListView.separated(
//                       itemBuilder: (context, index) {
//                         return InboxItem(
//                             chatItem: _getSelectedChatItems()[index]);
//                       },
//                       separatorBuilder: (context, index) {
//                         return const Padding(
//                           padding: EdgeInsets.only(left: 20, right: 20),
//                           child: Divider(),
//                         );
//                       },
//                       itemCount: _getSelectedChatItems().length,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildTabItem(String title, int index, bool isSelected) {
//     final bool darkMode = MHelperFunctions.isDarkMode(context);
//     return GestureDetector(
//       onTap: () {
//         _pageController.animateToPage(
//           index,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.ease,
//         );
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: MSizes.md),
//         decoration: BoxDecoration(
//           border: isSelected
//               ? Border(
//                   bottom: BorderSide(
//                     color: darkMode ? MColors.secondary : MColors.primary,
//                     width: 2,
//                   ),
//                 )
//               : null,
//         ),
//         child: Text(
//           title,
//           style: MTextStyles.tabHead(isSelected, darkMode),
//         ),
//       ),
//     );
//   }

//   List<ChatItem> _getSelectedChatItems() {
//     switch (_selectedIndex) {
//       case 0:
//         return allChatItems;
//       case 1:
//         return buyingChatItems;
//       case 2:
//         return sellingChatItems;
//       default:
//         return allChatItems;
//     }
//   }
// }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motodealz/common/styles/text_style.dart';
import 'package:motodealz/features/chat/model/chat_item.dart';
import 'package:motodealz/features/chat/screens/inbox_item.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  InboxScreenState createState() => InboxScreenState();
}

class InboxScreenState extends State<InboxScreen>
    with AutomaticKeepAliveClientMixin<InboxScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  // final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Remove this line
    final bool darkMode = MHelperFunctions.isDarkMode(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Messages"),
          actions: const [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(MImages.sampleUser1),
            ),
            SizedBox(width: 16),
          ],
        ),
        body: Column(
          children: [
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

  Widget buildChatList(List<ChatItem> chatItems) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);

    return Container(
      color: darkMode ? MColors.darkerGrey : MColors.primaryBackground,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InboxItem(chatItem: chatItems[index]);
        },
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Divider(),
          );
        },
        itemCount: chatItems.length,
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

  List<ChatItem> allChatItems = [
    ChatItem(
      sender: 'Aadit Viji',
      text: 'Hey there! Is the vehicle still available?',
      timestamp: Timestamp.now(),
      lastMsgTime: Timestamp.now(),
      unreadCount: '2',
      profilePicture: MImages.sampleUser1,
    ),
    ChatItem(
      sender: 'Aaron peter',
      text: 'Hey there! Is the vehicle still available?',
      timestamp: Timestamp.now(),
      lastMsgTime: Timestamp.now(),
      unreadCount: '2',
      profilePicture: MImages.sampleUser1,
    ),
    ChatItem(
      sender: 'Adithi Viji',
      text: 'Hey there! Is the vehicle still available?',
      timestamp: Timestamp.now(),
      lastMsgTime: Timestamp.now(),
      unreadCount: '2',
      profilePicture: MImages.sampleUser1,
    ),
    ChatItem(
      sender: 'Aaron peter',
      text: 'Hey there! Is the vehicle still available?',
      timestamp: Timestamp.now(),
      lastMsgTime: Timestamp.now(),
      unreadCount: '2',
      profilePicture: MImages.sampleUser1,
    ),
    ChatItem(
      sender: 'Adithi Viji',
      text: 'Hey there! Is the vehicle still available?',
      timestamp: Timestamp.now(),
      lastMsgTime: Timestamp.now(),
      unreadCount: '2',
      profilePicture: MImages.sampleUser1,
    ),
  ];

  List<ChatItem> buyingChatItems = [
    ChatItem(
      sender: 'Adithi Viji',
      text: 'Hey there! Is the vehicle still available?',
      timestamp: Timestamp.now(),
      lastMsgTime: Timestamp.now(),
      unreadCount: '2',
      profilePicture: MImages.sampleUser1,
    ),
    ChatItem(
      sender: 'Adithi Viji',
      text: 'Hey there! Is the vehicle still available?',
      timestamp: Timestamp.now(),
      lastMsgTime: Timestamp.now(),
      unreadCount: '2',
      profilePicture: MImages.sampleUser1,
    ),
    ChatItem(
      sender: 'Adithi Viji',
      text: 'Hey there! Is the vehicle still available?',
      timestamp: Timestamp.now(),
      lastMsgTime: Timestamp.now(),
      unreadCount: '2',
      profilePicture: MImages.sampleUser1,
    ),
  ];

  List<ChatItem> sellingChatItems = [
    ChatItem(
      sender: 'Aaron peter',
      text: 'Hey there! Is the vehicle still available?',
      timestamp: Timestamp.now(),
      lastMsgTime: Timestamp.now(),
      unreadCount: '2',
      profilePicture: MImages.sampleUser1,
    ),
    ChatItem(
      sender: 'Aaron peter',
      text: 'Hey there! Is the vehicle still available?',
      timestamp: Timestamp.now(),
      lastMsgTime: Timestamp.now(),
      unreadCount: '2',
      profilePicture: MImages.sampleUser1,
    ),
  ];

  @override
  bool get wantKeepAlive => true;

  List<ChatItem> _getSelectedChatItems() {
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
