import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motodealz/common/model/user_details.dart';
import 'package:motodealz/data/repositories/authentication/authentication_repository.dart';
import 'package:motodealz/utils/exceptions/firebase_exceptions.dart';
import 'package:motodealz/utils/exceptions/format_exceptions.dart';
import 'package:motodealz/utils/exceptions/platform_exceptions.dart';

/// Repository class for user-related operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Function to save user data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Function to update user data in Firestore
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Function to update the user's vehicles list in Firestore
  Future<void> updateUserVehiclesList(String userId, String vehicleId) async {
    try {
      await _db.collection("Users").doc(userId).update({
        'Vehicles': FieldValue.arrayUnion([vehicleId]),
        'HasListedAd': true, // Update HasListed to true
        'NoOfListedAd': FieldValue.increment(1), // Increment NoOfListedAd
      });
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Remove user data from Users Collection
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<String> uploadImageAndReturnUrl(
      File imageFile, String imagePath) async {
    try {
      final TaskSnapshot uploadTask =
          await _storage.ref().child(imagePath).putFile(imageFile);

      final String imageUrl = await uploadTask.ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      throw 'Failed to upload image: $e';
    }
  }

  Future<void> updateUserProfilePicture(
      String userId, String newProfilePictureUrl) async {
    try {
      await _db.collection('Users').doc(userId).update({
        'ProfilePicture': newProfilePictureUrl,
      });
    } catch (e) {
      throw 'Failed to update profile picture: $e';
    }
  }

  Future<String> uploadImageAndUpdateProfile() async {
    try {
      final picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);

        final String userId = _auth.currentUser!.uid;
        final String imagePath = 'profile_pictures/$userId.jpg';

        final String imageUrl =
            await uploadImageAndReturnUrl(imageFile, imagePath);

        await updateUserProfilePicture(userId, imageUrl);

        return imageUrl;
      } else {
        throw 'No image selected';
      }
    } catch (e) {
      throw 'Image upload failed: $e';
    }
  }
}
