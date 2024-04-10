import 'package:get/get.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleController extends GetxController {
  static VehicleController get instance => Get.find();
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
            id: doc.id,
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
            datePosted:
                (data['DatePosted'] as Timestamp?)?.toDate() ?? DateTime.now(),
            location: data['Location'] ?? '',
            description: data['Description'] ?? '',
            images: List<String>.from(data['Images'] ?? []),
            title: data['Title'] ?? '',
            rcNumber: data['RcNumber'] ?? '',
            vinNumber: data['VinNumber'] ?? '',
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

  Future<List<Vehicle>> fetchVehiclesByOwner(String ownerId) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Vehicles')
          .where('OwnerId', isEqualTo: ownerId)
          .get();

      List<Vehicle> vehicles = snapshot.docs.map((doc) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
        if (data != null) {
          return Vehicle(
            id: doc.id,
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
            datePosted:
                (data['DatePosted'] as Timestamp?)?.toDate() ?? DateTime.now(),
            location: data['Location'] ?? '',
            description: data['Description'] ?? '',
            images: List<String>.from(data['Images'] ?? []),
            title: data['Title'] ?? '',
            rcNumber: data['RcNumber'] ?? '',
            vinNumber: data['VinNumber'] ?? '',
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

  Future<Vehicle> fetchVehicleDetails(String vehicleId) async {
    try {
      // Query Firestore to fetch the vehicle with the specified ID
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Vehicles')
          .where('__name__', isEqualTo: vehicleId)
          .get();

      // Extract vehicle data from the snapshot
      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot vehicleDoc = snapshot.docs.first;
        Map<String, dynamic>? data = vehicleDoc.data() as Map<String, dynamic>?;
        if (data != null) {
          return Vehicle(
            id: vehicleDoc.id,
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
            datePosted:
                (data['DatePosted'] as Timestamp?)?.toDate() ?? DateTime.now(),
            location: data['Location'] ?? '',
            description: data['Description'] ?? '',
            images: List<String>.from(data['Images'] ?? []),
            title: data['Title'] ?? '',
            rcNumber: data['RcNumber'] ?? '',
            vinNumber: data['VinNumber'] ?? '',
          );
        } else {
          throw Exception("Vehicle data is null or does not exist.");
        }
      } else {
        throw Exception("Vehicle with ID $vehicleId not found.");
      }
    } catch (e) {
      throw Exception("Error fetching vehicle details: $e");
    }
  }

  // Method to get all vehicles
  Future<List<Vehicle>> getAllVehicles() async {
    if (_vehicles.isEmpty) {
      _vehicles = await _fetchVehicles();
    }
    _vehicles.sort((a, b) {
      if (a.isPremium && !b.isPremium) {
        return -1; // a should come before b
      } else if (!a.isPremium && b.isPremium) {
        return 1; // b should come before a
      } else {
        return 0; // order doesn't matter
      }
    });
    return _vehicles;
  }

  // Method to search vehicles by brand
  List<Vehicle> searchVehiclesByBrand(String query) {
    var lowercaseQuery = query.toLowerCase();
    return _vehicles
        .where((vehicle) => vehicle.brand.toLowerCase() == lowercaseQuery)
        .toList();
  }

  // Method to filter vehicles by category
  List<Vehicle> getVehiclesByCategory(String category) {
    return _vehicles.where((vehicle) => vehicle.category == category).toList();
  }

  List<Vehicle> getVehiclesByBrand(String brand) {
    return _vehicles
        .where((vehicle) => vehicle.brand.toLowerCase() == brand.toLowerCase())
        .toList();
  }

  List<Vehicle> getVehiclesByOwnerId(String ownerId) {
    return _vehicles.where((vehicle) => vehicle.ownerId == ownerId).toList();
  }

  // Method to search vehicles by criteria
  List<Vehicle> searchVehicles(String query) {
    // Convert the query to lowercase for case-insensitive matching
    var lowercaseQuery = query.toLowerCase();

    // Filter vehicles based on partial matches for brand, model, and category
    return _vehicles.where((vehicle) {
      var matchesBrand = vehicle.brand.toLowerCase().contains(lowercaseQuery);
      var matchesModel = vehicle.model.toLowerCase().contains(lowercaseQuery);
      var matchesCategory =
          vehicle.category.toLowerCase().contains(lowercaseQuery);

      // Return true if any of the criteria matches
      return matchesBrand || matchesModel || matchesCategory;
    }).toList();
  }

  Future<String> uploadVehicleToFirestore(Vehicle vehicle) async {
    try {
      // Reference to the Firestore collection 'vehicles'
      CollectionReference vehicles =
          FirebaseFirestore.instance.collection('Vehicles');

      // Convert the Ad object to a Map using the toJson method
      Map<String, dynamic> adData = vehicle.toJson();

      // Add the Ad data to Firestore
      DocumentReference docRef = await vehicles.add(adData);

      return docRef.id;
    } catch (error) {
      throw Exception("Error uploading vehicle details: $error");
      // print('Error uploading Ad to Firestore: $error');
    }
  }

  // Method to update vehicle details
  Future<void> updateVehicleDetails(Vehicle updatedVehicle) async {
    try {
      // Reference to the Firestore collection 'Vehicles'
      CollectionReference vehicles =
          FirebaseFirestore.instance.collection('Vehicles');

      // Convert the updated vehicle object to a Map using the toJson method
      Map<String, dynamic> updatedVehicleData = updatedVehicle.toJson();

      // Update the vehicle data in Firestore
      await vehicles.doc(updatedVehicle.id).update(updatedVehicleData);

      // // Once the vehicle is updated in Firestore, update it in the local list of vehicles
      // int index = _vehicles.indexWhere((vehicle) => vehicle.id == updatedVehicle.id);
      // if (index != -1) {
      //   _vehicles[index] = updatedVehicle;
      // }
    } catch (error) {
      throw Exception("Error updating vehicle details: $error");
    }
  }
  Future<void> deleteVehicle(Vehicle vehicle) async {
    try {
      // Reference the Firestore collection
      CollectionReference vehicles = FirebaseFirestore.instance.collection('Vehicles');

      // Delete the vehicle document
      await vehicles.doc(vehicle.id).delete();
      // Remove the vehicle from the local list (optional)
      _vehicles.removeWhere((v) => v.id == vehicle.id);
    } catch (e) {
      throw Exception("Error deleting vehicle: $e");
    }
  }
}
