import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:motodealz/app.dart';
import 'package:motodealz/common/widgets/navigation_menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  /// Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  // Register NavigationController with GetX
  Get.put(NavigationController());

  /// Init Local Storage
  await GetStorage.init();

  /// Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize Firebase and Authentication

  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  String result = appendAndSortStrings(
      "CWDM5Lt0jNbHUQRHT8apEh8DRxT2", "TWe73xWB95eW3C56jNPtbnXGGbG2");
  print("unique id:\n");
  print(result); // Output: dehllloorw

  runApp(const MyApp());
}

String appendAndSortStrings(String str1, String str2) {
  String appendedString = str1 + str2;
  List<String> characters = appendedString.split('');
  characters.sort();
  return characters.join();
}
