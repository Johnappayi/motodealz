import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class kycVerification{
  kycVerification({

    required this.idnumber,
    required this.firstname,
    required this.lastname,
    required this.dob,
    required this.address,
    required this.image,
    required this.frontidImg,
    required this.backidImg,
    

  });

  final String idnumber;
  final String firstname;
  final String lastname;
  final String dob;
  final String address;
  final String frontidImg;
  final String backidImg;

  String image;
