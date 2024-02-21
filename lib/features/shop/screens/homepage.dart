import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.primaryBackground,
      appBar: AppBar(
        title:const Text("hi"),
      )
    );
  }
}
