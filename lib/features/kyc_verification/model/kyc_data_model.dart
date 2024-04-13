class KYCData {
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String residentialAddress;
  final String postalCode;

  KYCData({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.residentialAddress,
    required this.postalCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'residentialAddress': residentialAddress,
      'postalCode': postalCode,
    };
  }
}
