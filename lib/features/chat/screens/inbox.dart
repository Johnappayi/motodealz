
import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

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
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: MColors.primaryBackground,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('aadhit viji', style: MFonts.fontCH2.copyWith(color: MColors.black)),
                  subtitle: Text(
                    'Hey there! Is the vehicle still available?',
                    style: MFonts.fontCB1.copyWith(color: MColors.lightGrey),
                  ),
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: MColors.accent,
                  ),
                  trailing: const Column(children: [Text("12:00pm"), Text("12")]),
                );
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(left:20,right: 20),
                  child: Divider(),
                );
              },
              itemCount: 50),
        ),
      ),
    );
  }
}
