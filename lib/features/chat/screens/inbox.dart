import 'package:flutter/material.dart';
import 'package:motodealz/common/styles/text_style.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: MColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: darkMode ? MColors.primaryBackground : MColors.primary,
        title: Text(
          "Messages",
          style: MFonts.fontAH1
              .copyWith(color: darkMode ? MColors.primary : MColors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration:  BoxDecoration(
                color: darkMode ? MColors.darkerGrey : MColors.primaryBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildTabItem("All", 0),
                  buildTabItem("Buying", 1),
                  buildTabItem("Selling", 2),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: darkMode ? MColors.darkerGrey : MColors.primaryBackground,
                ),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: const Text(
                        'aadhit viji',
                        style: MFonts.fontCH2,
                      ),
                      subtitle: Text(
                        'Hey there! Is the vehicle still available?',
                        style:
                            MFonts.fontCB1.copyWith(color: darkMode ? MColors.darkGrey : MColors.lightGrey),
                      ),
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundColor: MColors.accent,
                      ),
                      trailing: const Column(
                        children: [Text("12:00pm"), Text("12")],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(),
                    );
                  },
                  itemCount: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabItem(String title, int index) {
    final bool isSelected = index == _selectedIndex;
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
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
