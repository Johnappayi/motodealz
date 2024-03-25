import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:motodealz/features/profile/model/userDetails.dart';
import 'package:motodealz/utils/exceptions/firebase_exceptions.dart';
import 'package:motodealz/utils/exceptions/format_exceptions.dart';
import 'package:motodealz/utils/exceptions/platform_exceptions.dart';

/// Repository class for user-related operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch(e) {
      throw MPlatformException(e.code).message;
    } catch(e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  ///
  ///
}
