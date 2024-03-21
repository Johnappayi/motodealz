import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:motodealz/utils/constants/colors.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Variables
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    //   try{
    //     //Start Loading
    //     const Scaffold(backgroundColor: MColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white)));

    //   }
    //   catch(e){

    //   }

    // }
  }
}
