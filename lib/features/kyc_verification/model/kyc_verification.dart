import 'package:cloud_firestore/cloud_firestore.dart';

class KYCVerification {
  KYCVerification({
    required this.uid,
    required this.idnumber,
    required this.firstname,
    required this.lastname,
    required this.dob,
    required this.address,
    required this.image,
    required this.frontidImg,
    required this.backidImg,
  });

  final String uid;
  final int idnumber;
  final String firstname;
  final String lastname;
  final DateTime dob;
  final String address;
  final String frontidImg;
  final String backidImg;

  String image;

  static KYCVerification empty() => KYCVerification(
      uid: '',
      idnumber: 0,
      firstname: '',
      lastname: '',
      dob: DateTime.now(),
      address: '',
      image: '',
      frontidImg: '',
      backidImg: '');

  Map<String, dynamic> toJson() {
    return {
      'Idnumber' : idnumber,
      'FirstName': firstname,
      'LastName': lastname,
      'DOB': dob,
      'Address': address,
      'Image': image,
      'FrontidImg': frontidImg,
      'BackidImg': backidImg
    };
  }

  // Factory method to create a KYCVerification from a Firebase document snapshot.
  factory KYCVerification.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.exists) {
      final data = document.data()!;
      return KYCVerification(
        uid: document.id,
        idnumber: data['Idnumber'] ?? 0,
        firstname: data['FirstName'] ?? '',
        lastname: data['LastName'] ?? '',
        dob: (data['DOB'] as Timestamp).toDate(),
        address: data['Address'] ?? '',
        image: data['Image'] ?? '',
        frontidImg: data['FrontidImg'] ?? '',
        backidImg: data['BackidImg'] ?? '',
      );
    } else {
      return KYCVerification.empty();
    }
  }
}
