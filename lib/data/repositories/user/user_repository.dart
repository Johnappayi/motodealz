import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motodealz/common/cache_data/data_cache.dart';
import 'package:motodealz/common/model/user_details.dart';
import 'package:motodealz/data/repositories/authentication/authentication_repository.dart';
import 'package:motodealz/utils/exceptions/firebase_exceptions.dart';
import 'package:motodealz/utils/exceptions/format_exceptions.dart';
import 'package:motodealz/utils/exceptions/platform_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Repository class for user-related operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final DataCache dataCache = Get.put(DataCache());

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

  /// Function to fetch and cache user details
  Future<void> fetchAndCacheCurrentUserDetails() async {
    try {
      // Get current user ID from FirebaseAuth
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        print('User is not authenticated.');
        return;
      }

      // Check if user data is already cached
      Map<String, dynamic>? cachedUserData =
          await dataCache.getCachedUserData();
      print(cachedUserData);
      if (cachedUserData != null) {
        // User data is already cached, use it as needed
        print('Using cached user data: $cachedUserData');
        return;
      }

      // Fetch current user's data from Firestore
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get();

      // Convert data to a format suitable for caching (e.g., JSON)
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>;

      // Cache the current user's data
      await DataCache.cacheData(userData);

      // Print message indicating successful caching
      print('User data cached successfully!');
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

  Future<Map<String, dynamic>?> getCachedUserData() async {
    return await dataCache.getCachedUserData();
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

  Future<void> updateUserRC(String userId, String rcPath) async {
    try {
      await _db.collection("Users").doc(userId).update({
        'RcId': rcPath,
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

  Future<void> updateUserKYCDoc(String userId, List<String> kycPath) async {
    try {
      await _db.collection("Users").doc(userId).update({
        'KycDocPath': kycPath,
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

  Future<void> cacheData(Map<String, dynamic> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonData = jsonEncode(userData);
    await prefs.setString('cachedUserData', jsonData);
  }

  Future<void> updateUserKYCSelfi(String userId, String kycPath) async {
    try {
      await _db.collection("Users").doc(userId).update({
        'KycSelfiePath': kycPath,
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

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
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

  /// Function to remove the Vehicles field and update nooflistedads and hasListedAd
  Future<void> removeVehicleFromUser(String vehicleId) async {
    try {
      final currentUserId = AuthenticationRepository.instance.authUser?.uid;
      final userRef = _db.collection("Users").doc(currentUserId);

      // Transaction to ensure data consistency
      await _db.runTransaction((transaction) async {
        final documentSnapshot = await transaction.get(userRef);
        final userData = documentSnapshot.data();

        if (userData != null) {
          List<String> vehicles = userData['Vehicles']?.cast<String>() ?? [];
          vehicles.remove(vehicleId);

          int noOfListedAds = userData['NoOfListedAd'] ?? 0;

          if (vehicles.isEmpty) {
            noOfListedAds = 0;
          } else if (noOfListedAds > 0) {
            noOfListedAds--;
          }

          transaction.update(userRef, {
            'Vehicles': FieldValue.delete(), // Remove the Vehicles field
            'HasListedAd': vehicles.isNotEmpty, // Update HasListedAd
            'NoOfListedAd': noOfListedAds, // Update NoOfListedAd
          });
        }
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

  Future<void> uploadUserImage(File imageFile, String imagePath) async {
    try {
      await _storage.ref().child(imagePath).putFile(imageFile);
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

      // Update cached user data
      Map<String, dynamic>? cachedUserData = await getCachedUserData();
      if (cachedUserData != null) {
        cachedUserData['profilePicture'] = newProfilePictureUrl;
        await cacheData(cachedUserData);
        print('Profile picture updated in cache.');
      }
    } catch (e) {
      throw 'Failed to update profile picture: $e';
    }
  }

  Future<void> uploadImageAndUpdateProfile() async {
    try {
      final picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);

        final String userId = _auth.currentUser!.uid;
        final String imagePath = 'Profilepictures/$userId.jpg';
        await uploadUserImage(imageFile, imagePath);
        await updateUserProfilePicture(userId, imagePath);
      } else {
        throw 'No image selected';
      }
    } catch (e) {
      throw 'Image upload failed: $e';
    }
  }

  Future<String?> fetchProfilePicture(String userId) async {
    try {
      final DocumentSnapshot snapshot =
          await _db.collection("Users").doc(userId).get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        String? imagePath = data['ProfilePicture'] as String?;
        if (imagePath != null && imagePath.isNotEmpty) {
          // Get the download URL using Storage reference
          final ref = _storage.ref(imagePath);
          final downloadUrl = await ref.getDownloadURL();
          return downloadUrl;
        } else {
          return null; // No profile picture available
        }
      } else {
        return null; // User not found
      }
    } catch (e) {
      throw 'Failed to fetch profile picture: $e';
    }
  }
}
