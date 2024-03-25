import 'package:motodealz/features/shop/model/vehicle_model.dart';
import 'package:motodealz/utils/constants/image_strings.dart';

class VehicleController {
  List<Vehicle> vehicles = [
    Vehicle(
        brand: "Toyota",
        model: "Corolla",
        category: "Sedan",
        transmission: "Automatic",
        fuelType: "Petrol",
        ownershipCount: 1,
        year: 2018,
        mileage: 50000,
        price: 15000.0,
        isPremium: false,
        ownerId: "123456",
        datePosted: DateTime.now().subtract(const Duration(days: 10)),
        location: "New York",
        description: "Well-maintained Toyota Corolla.",
        images: [
          MImages.sampleCar1a,
          MImages.sampleCar1b,
          MImages.sampleCar1c,
          MImages.sampleCar1d,
        ]),
    Vehicle(
      brand: "Honda",
      model: "Civic",
      category: "Sedan",
      transmission: "Automatic",
      fuelType: "Petrol",
      ownershipCount: 2,
      year: 2016,
      mileage: 60000,
      price: 12000.0,
      isPremium: false,
      ownerId: "789012",
      datePosted: DateTime.now().subtract(const Duration(days: 5)),
      location: "Los Angeles",
      description: "Used Honda Civic in good condition.",
      images: [
        MImages.sampleCar2a,
        MImages.sampleCar2b,
        MImages.sampleCar2c,
        MImages.sampleCar2d,
        MImages.sampleCar2e,
      ],
    ),
    Vehicle(
      brand: "BMW",
      model: "X5",
      category: "SUV",
      transmission: "Automatic",
      fuelType: "Diesel",
      ownershipCount: 1,
      year: 2019,
      mileage: 30000,
      price: 40000.0,
      isPremium: true,
      ownerId: "345678",
      datePosted: DateTime.now().subtract(const Duration(days: 3)),
      location: "Chicago",
      description: "Luxurious BMW X5 with low mileage.",
      images: [
        MImages.sampleCar3a,
        MImages.sampleCar3b,
        MImages.sampleCar3c,
        MImages.sampleCar3d,
        MImages.sampleCar3e,
      ],
    ),
    Vehicle(
      brand: "Ford",
      model: "Fiesta",
      category: "Hatchback",
      transmission: "Manual",
      fuelType: "Petrol",
      ownershipCount: 1,
      year: 2015,
      mileage: 80000,
      price: 8000.0,
      isPremium: false,
      ownerId: "456789",
      datePosted: DateTime.now().subtract(const Duration(days: 7)),
      location: "Miami",
      description: "Ford Fiesta in good condition.",
      images: [
        MImages.sampleCar4a,
        MImages.sampleCar4b,
        MImages.sampleCar4c,
        MImages.sampleCar4d,
      ],
    ),
    Vehicle(
      brand: "Chevrolet",
      model: "Malibu",
      category: "SUV",
      transmission: "Automatic",
      fuelType: "Petrol",
      ownershipCount: 2,
      year: 2017,
      mileage: 70000,
      price: 10000.0,
      isPremium: false,
      ownerId: "567890",
      datePosted: DateTime.now().subtract(const Duration(days: 2)),
      location: "Houston",
      description: "Used Chevrolet Malibu with low mileage.",
      images: [
        MImages.sampleCar5a,
        MImages.sampleCar5b,
        MImages.sampleCar5c,
        MImages.sampleCar5d,
      ],
    ),
    Vehicle(
      brand: "Mercedes-Benz",
      model: "GLC",
      category: "SUV",
      transmission: "Automatic",
      fuelType: "Diesel",
      ownershipCount: 1,
      year: 2020,
      mileage: 40000,
      price: 45000.0,
      isPremium: true,
      ownerId: "678901",
      datePosted: DateTime.now().subtract(const Duration(days: 9)),
      location: "Seattle",
      description: "Luxurious Mercedes-Benz GLC in excellent condition.",
      images: [
        MImages.sampleCar6a,
        MImages.sampleCar6b,
        MImages.sampleCar6c,
        MImages.sampleCar6d,
      ],
    ),
    Vehicle(
      brand: "Audi",
      model: "A4",
      category: "MUV",
      transmission: "Automatic",
      fuelType: "Petrol",
      ownershipCount: 1,
      year: 2019,
      mileage: 35000,
      price: 30000.0,
      isPremium: true,
      ownerId: "789012",
      datePosted: DateTime.now().subtract(const Duration(days: 4)),
      location: "San Francisco",
      description: "Well-maintained Audi A4.",
      images: [
        MImages.sampleCar7a,
        MImages.sampleCar7b,
        MImages.sampleCar7c,
        MImages.sampleCar7d,
        MImages.sampleCar7e,
      ],
    ),
    Vehicle(
      brand: "Volkswagen",
      model: "Golf",
      category: "Hatchback",
      transmission: "Automatic",
      fuelType: "Petrol",
      ownershipCount: 2,
      year: 2018,
      mileage: 50000,
      price: 15000.0,
      isPremium: false,
      ownerId: "890123",
      datePosted: DateTime.now().subtract(const Duration(days: 6)),
      location: "Orlando",
      description: "Used Volkswagen Golf in good condition.",
      images: [
        MImages.sampleCar8a,
        MImages.sampleCar8b,
        MImages.sampleCar8c,
        MImages.sampleCar8d,
      ],
    ),
    Vehicle(
      brand: "Ford",
      model: "Mustang",
      category: "Coupe",
      transmission: "Automatic",
      fuelType: "Petrol",
      ownershipCount: 1,
      year: 2019,
      mileage: 30000,
      price: 35000.0,
      isPremium: true,
      ownerId: "234567",
      datePosted: DateTime.now().subtract(const Duration(days: 4)),
      location: "Los Angeles",
      description: "Sleek Ford Mustang coupe with low mileage.",
      images: [
        MImages.sampleCar9a,
        MImages.sampleCar9b,
        MImages.sampleCar9c,
        MImages.sampleCar9d,
      ],
    ),
    Vehicle(
      brand: "Chevrolet",
      model: "Camaro",
      category: "Coupe",
      transmission: "Manual",
      fuelType: "Petrol",
      ownershipCount: 2,
      year: 2017,
      mileage: 40000,
      price: 30000.0,
      isPremium: false,
      ownerId: "345678",
      datePosted: DateTime.now().subtract(const Duration(days: 6)),
      location: "Miami",
      description: "Used Chevrolet Camaro coupe in good condition.",
      images: [
        MImages.sampleCar10a,
        MImages.sampleCar10b,
        MImages.sampleCar10c,
        MImages.sampleCar10d,
      ],
    ),
    Vehicle(
      brand: "Audi",
      model: "A5",
      category: "Coupe",
      transmission: "Automatic",
      fuelType: "Petrol",
      ownershipCount: 1,
      year: 2020,
      mileage: 20000,
      price: 40000.0,
      isPremium: true,
      ownerId: "456789",
      datePosted: DateTime.now().subtract(const Duration(days: 3)),
      location: "New York",
      description: "Luxurious Audi A5 coupe with low mileage.",
      images: [
        MImages.sampleCar11a,
        MImages.sampleCar11b,
        MImages.sampleCar11c,
        MImages.sampleCar11d,
      ],
    ),
    Vehicle(
      brand: "Toyota",
      model: "Tacoma",
      category: "Pickup",
      transmission: "Automatic",
      fuelType: "Petrol",
      ownershipCount: 1,
      year: 2018,
      mileage: 50000,
      price: 25000.0,
      isPremium: false,
      ownerId: "567890",
      datePosted: DateTime.now().subtract(const Duration(days: 2)),
      location: "Houston",
      description: "Toyota Tacoma pickup truck with moderate mileage.",
      images: [
        MImages.sampleCar12a,
        MImages.sampleCar12b,
        MImages.sampleCar12c,
        MImages.sampleCar12d,
      ],
    ),
    Vehicle(
      brand: "Ford",
      model: "F-150",
      category: "Pickup",
      transmission: "Automatic",
      fuelType: "Petrol",
      ownershipCount: 3,
      year: 2017,
      mileage: 60000,
      price: 30000.0,
      isPremium: false,
      ownerId: "678901",
      datePosted: DateTime.now().subtract(const Duration(days: 5)),
      location: "Chicago",
      description: "Ford F-150 pickup truck with reasonable mileage.",
      images: [
        MImages.sampleCar13a,
        MImages.sampleCar13b,
        MImages.sampleCar13c,
        MImages.sampleCar13d,
      ],
    ),
  ];

  late Map<String, List<Vehicle>> _vehiclesByBrand;

  // Define lists of known models, brands, and categories
  List<String> vehicleModels = [];
  List<String> vehicleBrands = [];
  List<String> vehicleCategories = [];

  // Constructor to initialize the lists and index vehicles by brand
  VehicleController() {
    // Extract unique models, brands, and categories
    vehicleModels = vehicles.map((vehicle) => vehicle.model).toSet().toList();
    vehicleBrands = vehicles.map((vehicle) => vehicle.brand).toSet().toList();
    vehicleCategories =
        vehicles.map((vehicle) => vehicle.category).toSet().toList();
    // Index vehicles by brand
    _indexVehiclesByBrand(vehicles);
  }

  // Index vehicles by brand
  void _indexVehiclesByBrand(List<Vehicle> vehicles) {
    _vehiclesByBrand = {};
    for (var vehicle in vehicles) {
      var brand = vehicle.brand.toLowerCase();
      _vehiclesByBrand.putIfAbsent(brand, () => []).add(vehicle);
    }
  }

  // Method to search vehicles by brand
  List<Vehicle> searchVehiclesByBrand(String query) {
    var lowercaseQuery = query.toLowerCase();
    return _vehiclesByBrand[lowercaseQuery] ?? [];
  }

  // Method to get all vehicles
  List<Vehicle> getAllVehicles() {
    vehicles.sort((a, b) {
      // Sort by isPremium property in descending order
      if (a.isPremium && !b.isPremium) {
        return -1; // a should come before b
      } else if (!a.isPremium && b.isPremium) {
        return 1; // b should come before a
      } else {
        return 0; // No change in order
      }
    });
    return vehicles;
  }

  // Method to filter vehicles by category
  List<Vehicle> getVehiclesByCategory(String category) {
    return vehicles.where((vehicle) => vehicle.category == category).toList();
  }

   List<Vehicle> getVehiclesByBrand(String brand) {
    return vehicles.where((vehicle) => vehicle.brand.toLowerCase() == brand.toLowerCase()).toList();
  }

  // Method to search vehicles by criteria
  List<Vehicle> searchVehicles(String query) {
    // Convert the query to lowercase for case-insensitive matching
    var lowercaseQuery = query.toLowerCase();

    // Filter vehicles based on partial matches for brand, model, and category
    return vehicles.where((vehicle) {
      var matchesBrand = vehicle.brand.toLowerCase().contains(lowercaseQuery);
      var matchesModel = vehicle.model.toLowerCase().contains(lowercaseQuery);
      var matchesCategory =
          vehicle.category.toLowerCase().contains(lowercaseQuery);

      // Return true if any of the criteria matches
      return matchesBrand || matchesModel || matchesCategory;
    }).toList();
  }
}
