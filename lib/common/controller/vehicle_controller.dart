import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleController {
  late List<Vehicle> _vehicles;

  // Constructor to initialize the lists and fetch vehicles from Firestore
  VehicleController() {
    _vehicles = [];
    _fetchVehicles();
  }

  // Method to fetch vehicles from Firestore
  Future<void> _fetchVehicles() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('Vehicles').get();

      _vehicles = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Vehicle(
          brand: data['brand'],
          model: data['model'],
          category: data['category'],
          transmission: data['transmission'],
          fuelType: data['fuelType'],
          ownershipCount: data['ownershipCount'],
          year: data['year'],
          mileage: data['mileage'],
          price: data['price'].toDouble(),
          isPremium: data['isPremium'],
          ownerId: data['ownerId'],
          datePosted: data['datePosted'].toDate(),
          location: data['location'],
          description: data['description'],
          images: List<String>.from(data['images']),
          id: doc.id,
        );
      }).toList();
    } catch (e) {
      print("Error fetching vehicles: $e");
    }
  }

  // Method to get all vehicles
  List<Vehicle> getAllVehicles() {
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
