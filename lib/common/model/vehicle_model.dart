import 'package:cloud_firestore/cloud_firestore.dart';

class Vehicle {
  String? id;
  String brand;
  String model;
  String category;
  String transmission;
  String fuelType;
  int ownershipCount;
  int year;
  int mileage; //km driven
  double price;
  bool isPremium;
  String ownerId;
  DateTime datePosted;
  String location;
  String description;
  String title;
  List<String> images;
  String rcNumber;
  String vinNumber;

  Vehicle(
      {this.id,
      required this.brand,
      required this.model,
      required this.category,
      required this.transmission,
      required this.fuelType,
      required this.ownershipCount,
      required this.year,
      required this.mileage,
      required this.price,
      required this.isPremium,
      required this.ownerId,
      required this.datePosted,
      required this.location,
      required this.description,
      required this.title,
      required this.images,
      required this.rcNumber,
      required this.vinNumber});

  static Vehicle empty() => Vehicle(
        id: '',
        brand: '',
        model: '',
        category: '',
        transmission: '',
        fuelType: '',
        ownershipCount: 0,
        year: 0,
        mileage: 0,
        price: 0,
        isPremium: false,
        ownerId: '',
        datePosted: DateTime.now(),
        location: '',
        description: '',
        images: [],
        title: '',
        rcNumber: '',
        vinNumber: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'Brand': brand,
      'Model': model,
      'Category': category,
      'Transmission': transmission,
      'FuelType': fuelType,
      'OwnershipCount': ownershipCount,
      'Year': year,
      'Mileage': mileage,
      'Price': price,
      'IsPremium': isPremium,
      'OwnerId': ownerId,
      'DatePosted': datePosted,
      'Location': location,
      'Description': description,
      'Images': images,
      'Title': title,
      'RcNumber': rcNumber,
      'VinNumber': vinNumber,
    };
  }

  // Factory method to create a Vehicle from a JSON map.
  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      category: json['category'],
      transmission: json['transmission'],
      fuelType: json['fuelType'],
      ownershipCount: json['ownershipCount'],
      year: json['year'],
      mileage: json['mileage'],
      price: json['price'],
      isPremium: json['isPremium'],
      ownerId: json['ownerId'],
      datePosted: json['datePosted'],
      location: json['location'],
      description: json['description'],
      images: List<String>.from(json['images']),
      title: json['description'],
      rcNumber: json['rcNumber'],
      vinNumber: json['vinNumber'],
    );
  }

  factory Vehicle.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.exists) {
      final data = document.data()!;
      return Vehicle(
        id: document.id,
        brand: data['Brand'],
        model: data['Model'],
        category: data['Category'],
        transmission: data['Transmission'],
        fuelType: data['FuelType'],
        ownershipCount: data['OwnershipCount'],
        year: data['Year'],
        mileage: data['Mileage'],
        price: data['Price'],
        isPremium: data['IsPremium'],
        ownerId: data['OwnerId'],
        datePosted: data['DatePosted'],
        location: data['Location'],
        description: data['Description'],
        images: List<String>.from(data['images']),
        title: data['description'],
        rcNumber: data['rcNumber'],
        vinNumber: data['vinNumber'],
      );
    } else {
      return Vehicle.empty();
    }
  }
}
