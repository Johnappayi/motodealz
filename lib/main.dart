import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motodealz/app.dart';
import 'package:motodealz/common/widgets/navigation_menu.dart';

void main() {
  
  //Todo: Add Widget Binding
  WidgetsFlutterBinding.ensureInitialized();
  // Register NavigationController with GetX
  Get.put(NavigationController());

  
  //Todo: Init Local Storage
  //Todo: Await Native Splash
  //Todo: Initialize Firebase
  //Todo: Initialize Authentication
 
  runApp(const MyApp());
}

