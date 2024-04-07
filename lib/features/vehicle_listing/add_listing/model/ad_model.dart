class Ad {
  final String brand;
  final String model;
  final int year;
  final int mileage;
  final int ownershipCount;
  final String title;
  final String description;
  final String rcNumber;
  final String vinNumber;
  final double price;
  final bool isPremium;
  final String ownerId;
  final DateTime datePosted;
  final String location;
  final List<String> images;

  Ad({
    required this.brand,
    required this.model,
    required this.year,
    required this.mileage,
    required this.ownershipCount,
    required this.title,
    required this.description,
    required this.rcNumber,
    required this.vinNumber,
    required this.price,
    required this.isPremium,
    required this.ownerId,
    required this.datePosted,
    required this.location,
    required this.images,
  });

  // Method to convert Ad object to a Map
  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'model': model,
      'year': year,
      'mileage': mileage,
      'ownershipCount': ownershipCount,
      'title': title,
      'description': description,
      'rcNumber': rcNumber,
      'vinNumber': vinNumber,
      'price': price,
      'isPremium': isPremium,
      'ownerId': ownerId,
      'datePosted': datePosted.toIso8601String(),
      'location': location,
      'images': images,
    };
  }
}
