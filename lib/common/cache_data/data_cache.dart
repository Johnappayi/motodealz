import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
// import 'package:motodealz/common/model/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataCache extends GetxController {
  static const String _keyCachedData = 'cachedData';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> cacheData(Map<String, dynamic> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonData = jsonEncode(userData);
    await prefs.setString(_keyCachedData, jsonData);
  }

  Future<void> fetchDataAndCache() async {
    try {
      String? userId = _auth.currentUser?.uid;
      // Fetch current user's data from Firestore
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get();

      if (userSnapshot.exists) {
        // Convert data to JSON format
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;
        // Cache the current user's data
        await cacheData(userData);
      }
    } catch (e) {
      // print(object);
    }
  }

  Future<Map<String, dynamic>?> getCachedUserData() async {
    try {
      // Get cached user data from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? cachedData = prefs.getString(_keyCachedData);
      if (cachedData != null) {
        // Convert cached data to Map<String, dynamic>
        Map<String, dynamic> userData =
            Map<String, dynamic>.from(jsonDecode(cachedData));
        return userData;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  // Method for debugging to print cached data
  void printCachedData() async {
    try {
      Map<String, dynamic>? cachedData = await getCachedUserData();
      if (cachedData != null) {
      } else {}
    } catch (e) {
      // print(object);
    }
  }
}
