// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'package:motodealz/features/shop/model/vehicle_model.dart';

/// Model class representing user data.
class UserModel {
  final String id;
  final String username;
  final String email;
  final String? firstname;
  final String? lastname;
  String profilePicture;
  bool hasListedAd;
  bool isPremium;
  int noOfListedAd;
  bool isVerified;
  List<Vehicle>? vehicles;

  UserModel({
    this.noOfListedAd = 0,
    this.hasListedAd = false,
    this.firstname,
    this.lastname,
    this.isPremium = false,
    this.isVerified = false,
    this.vehicles,
    required this.id,
    required this.username,
    required this.email,
    required this.profilePicture,
  });

  ///Static function to create an empty user model.
  static UserModel empty() => UserModel(
        id: "",
        username: "",
        email: "",
        profilePicture: "",
        firstname: '',
        lastname: '',
      );

  ///Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'Username': username,
      'Email': email,
      'ProfilePicture': profilePicture,
    };
  }

  ///Factory method to create a UserModel from a Firebase document snapshot.
// factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
//     if (document.data() != null) {
//       final data = document.data();
//       return UserModel(
//           id: document.id,
//           username: data['Username'] ?? '',
//           email: data['Email'] ?? '',
//           profilePicture: data['ProfilePicture'] ?? '',
//       );
//     }
// }
}
