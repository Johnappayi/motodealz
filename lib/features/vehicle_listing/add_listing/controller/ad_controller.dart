import 'package:motodealz/features/vehicle_listing/add_listing/model/ad_model.dart';

class AdController {
 List<AdListed> adListings = [
  AdListed(
    vehicleId: "1",
    ownerId: "123456",
    title: "Toyota corolla for sale",
    description: "March 2018 Corola Auto, Single Owner, MH 01 Reg, 48k kms, Red, Flawless, 4 New Tires, Unused Spare, 2 Keys, 5Yr Finance Available."
  ),
  AdListed(
    vehicleId: "2",
    ownerId: "789012",
    title: "Honda Civic for Sale",
    description: "March 2016 Civic Auto, Second Owner, LA Registered, 60k kms, Red, Good Condition, 4 New Tires, 2 Keys, Finance Available."
  ),
  AdListed(
    vehicleId: "3",
    ownerId: "345678",
    title: "BMW X5 for Sale",
    description: "2019 BMW X5, Diesel, Low Mileage, Chicago Registered, Premium Model, Excellent Condition."
  ),
  AdListed(
    vehicleId: "4",
    ownerId: "456789",
    title: "Ford Fiesta for Sale",
    description: "Used Ford Fiesta, Manual Transmission, 2015 Model, 80k Mileage, Petrol, Good Condition."
  ),
  AdListed(
    vehicleId: "5",
    ownerId: "567890",
    title: "Chevrolet Malibu for Sale",
    description: "Used Chevrolet Malibu, 2017 Model, Low Mileage, Petrol, Good Condition."
  ),
  AdListed(
    vehicleId: "6",
    ownerId: "678901",
    title: "Mercedes-Benz GLC for Sale",
    description: "Luxurious Mercedes-Benz GLC, 2020 Model, Diesel, Excellent Condition, Seattle Registered."
  ),
  AdListed(
    vehicleId: "7",
    ownerId: "789012",
    title: "Audi A4 for Sale",
    description: "Well-maintained Audi A4, Automatic Transmission, Petrol, 2019 Model, Low Mileage."
  ),
  AdListed(
    vehicleId: "8",
    ownerId: "890123",
    title: "Volkswagen Golf for Sale",
    description: "Used Volkswagen Golf, Automatic Transmission, 2018 Model, 50k Mileage, Petrol."
  ),
  AdListed(
    vehicleId: "9",
    ownerId: "234567",
    title: "Ford Mustang for Sale",
    description: "Sleek Ford Mustang Coupe, 2019 Model, Low Mileage, Petrol, Los Angeles Registered."
  ),
  AdListed(
    vehicleId: "10",
    ownerId: "345678",
    title: "Chevrolet Camaro for Sale",
    description: "Used Chevrolet Camaro Coupe, Manual Transmission, 2017 Model, Good Condition, Miami Registered."
  ),
  AdListed(
    vehicleId: "11",
    ownerId: "456789",
    title: "Audi A5 for Sale",
    description: "Luxurious Audi A5 Coupe, Automatic Transmission, Petrol, 2020 Model, Low Mileage."
  ),
  AdListed(
    vehicleId: "12",
    ownerId: "567890",
    title: "Toyota Tacoma for Sale",
    description: "Toyota Tacoma Pickup Truck, Automatic Transmission, 2018 Model, Moderate Mileage."
  ),
  AdListed(
    vehicleId: "13",
    ownerId: "123456",
    title: "Ford F-150 for Sale",
    description: "Ford F-150 Pickup Truck, Automatic Transmission, 2017 Model, 60k Mileage, Petrol."
  ),
];


  AdListed getAdDetailsByVehicleId(String vehicleId) {
    // Find the ad with the given vehicle ID
    return adListings.firstWhere((ad) => ad.vehicleId == vehicleId);
  }

}
