import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motodealz/common/model/vehicle_model.dart';

/// Model class representing user data.
class UserModel {
  final String id;
  final String? firstname;
  final String? lastname;
  final String email;
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
    required this.email,
    required this.profilePicture,
  });

  /// Helper function to get the full name
  String get fullName => '$firstname $lastname';

  /// Static function to split the full name
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static function to generate username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0];
    String lastName = nameParts.length > 1 ? nameParts[1] : "";

    String newUsername = "$firstName $lastName";
    return newUsername;
  }

  /// Static function to create an empty user model.
  static UserModel empty() => UserModel(
        id: '',
        firstname: 'Anonymous',
        lastname: 'User',
        email: '',
        profilePicture: 'Profilepictures/userHolder.png',
        isPremium: true,
        isVerified: false,
        hasListedAd: true,
        noOfListedAd: 0,
        vehicles: [],
      );

  /// Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstname,
      'LastName': lastname,
      'Email': email,
      'ProfilePicture': profilePicture,
      'IsPremium': isPremium,
      'IsVerified': isVerified,
      'HasListedAd': hasListedAd,
      'NoOfListedAd': noOfListedAd,
      'Vehicles': vehicles?.map((vehicle) => vehicle.toJson()).toList(),
    };
  }

  // Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.exists) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstname: data['FirstName'] ?? '',
        lastname: data['LastName'] ?? '',
        email: data['Email'] ?? '',
        profilePicture: data['ProfilePicture'] ?? 'Profilepictures/userHolder.png',
        isPremium: data['IsPremium'] ?? false,
        isVerified: data['IsVerified'] ?? false,
        hasListedAd: data['HasListedAd'] ?? false,
        noOfListedAd: data['NoOfListedAd'] ?? 0,
        vehicles: (data['Vehicles'] as List<dynamic>?)
            ?.map((vehicle) => Vehicle.fromJson(vehicle))
            .toList(),
      );
    } else {
      return UserModel.empty();
    }
  }
}
