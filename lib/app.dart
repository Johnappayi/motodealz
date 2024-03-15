import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
//import 'package:motodealz/common/widgets/navigation_menu.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/theme/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MAppTheme.lightTheme,
      darkTheme: MAppTheme.darkTheme,
      home: const Scaffold(backgroundColor: MColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
