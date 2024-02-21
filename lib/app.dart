import 'package:flutter/material.dart';
import 'package:motodealz/features/instantchat/screens/inbox.dart';
import 'package:motodealz/utils/theme/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode:ThemeMode.system,
      theme: MAppTheme.lightTheme,
      darkTheme: MAppTheme.darkTheme,
      home: const InboxScreen(),
    );
  }
}
