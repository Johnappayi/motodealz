import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';

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
    return Scaffold(
      backgroundColor: MColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: MColors.primary,
        title: Text(
          "Messages",
          style: MFonts.fontAH1.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: MColors.primaryBackground,
                borderRadius: BorderRadius.only(
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
                decoration: const BoxDecoration(
                  color: MColors.primaryBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        'aadhit viji',
                        style: MFonts.fontCH2.copyWith(color: MColors.black),
                      ),
                      subtitle: Text(
                        'Hey there! Is the vehicle still available?',
                        style: MFonts.fontCB1.copyWith(color: MColors.lightGrey),
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
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: isSelected
              ? const Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                )
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
