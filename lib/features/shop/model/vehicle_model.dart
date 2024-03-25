class Vehicle {
  // String id;
  String brand;
  String model;
  String category;
  String transmission;
  String fuelType;
  int ownershipCount;
  int year;
  int mileage;
  double price;
  bool isPremium;
  String ownerId;
  DateTime datePosted;
  String location;
  String description;
  List<String> images;

  Vehicle({
    // required this.id,
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
    required this.images,
  });

  final String brand;
  final String model;
  final String category;
  final String transmission;
  final String fuelType;
  final String ownershipCount;
  final String year;
  final String mileage;
  final String isPremium;
  final String ownerId;
  final String description;

  String location;
  String datePosted;
  String images;
  String price;
}
