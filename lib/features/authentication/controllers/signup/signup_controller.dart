import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Variables
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
}
