import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleController {
  late List<Vehicle> _vehicles;

  // Constructor to initialize the lists and fetch vehicles from Firestore
  VehicleController() {
    _vehicles = [];
  }

  // Method to fetch vehicles from Firestore
  Future<List<Vehicle>> _fetchVehicles() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('Vehicles').get();

      List<Vehicle> vehicles = snapshot.docs.map((doc) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
        if (data != null) {
          return Vehicle(
            brand: data['Brand'] ?? '',
            model: data['Model'] ?? '',
            category: data['Category'] ?? '',
            transmission: data['Transmission'] ?? '',
            fuelType: data['FuelType'] ?? '',
            ownershipCount: data['OwnershipCount'] ?? 0,
            year: data['Year'] ?? 0,
            mileage: data['Mileage'] ?? 0,
            price: (data['Price'] ?? 0).toDouble(),
            isPremium: data['IsPremium'] ?? false,
            ownerId: data['OwnerId'] ?? '',
            datePosted: (data['DatePosted'] as Timestamp?)?.toDate() ?? DateTime.now(),
            location: data['Location'] ?? '',
            description: data['Description'] ?? '',
            images: List<String>.from(data['Images'] ?? []),
            id: doc.id,
          );
        } else {
          throw Exception("Data is null or does not exist.");
        }
      }).toList();

      return vehicles;
    } catch (e) {
      throw Exception("Error fetching vehicles: $e");
    }
  }

  // Method to get all vehicles
  Future<List<Vehicle>> getAllVehicles() async {
    if (_vehicles.isEmpty) {
      _vehicles = await _fetchVehicles();
    }
    return _vehicles;
  }

  // Method to search vehicles by brand
  List<Vehicle> searchVehiclesByBrand(String query) {
    var lowercaseQuery = query.toLowerCase();
    return _vehicles.where((vehicle) => vehicle.brand.toLowerCase() == lowercaseQuery).toList();
  }

  // Method to filter vehicles by category
  List<Vehicle> getVehiclesByCategory(String category) {
    return _vehicles.where((vehicle) => vehicle.category == category).toList();
  }

  List<Vehicle> getVehiclesByBrand(String brand) {
    return _vehicles.where((vehicle) => vehicle.brand.toLowerCase() == brand.toLowerCase()).toList();
  }

  List<Vehicle> getVehiclesByOwnerId(String ownerId) {
    return _vehicles.where((vehicle) => vehicle.ownerId == ownerId).toList();
  }

  // Method to get a single vehicle by its ID
  Vehicle getVehicleById(String id) {
    // Search for the vehicle with the given ID in the list of vehicles
    return _vehicles.firstWhere((vehicle) => vehicle.id == id);
  }

  // Method to search vehicles by criteria
  List<Vehicle> searchVehicles(String query) {
    // Convert the query to lowercase for case-insensitive matching
    var lowercaseQuery = query.toLowerCase();

    // Filter vehicles based on partial matches for brand, model, and category
    return _vehicles.where((vehicle) {
      var matchesBrand = vehicle.brand.toLowerCase().contains(lowercaseQuery);
      var matchesModel = vehicle.model.toLowerCase().contains(lowercaseQuery);
      var matchesCategory = vehicle.category.toLowerCase().contains(lowercaseQuery);

      // Return true if any of the criteria matches
      return matchesBrand || matchesModel || matchesCategory;
    }).toList();
  }
}
