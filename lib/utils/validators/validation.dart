class MValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }

    return null;
  }

  /// Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  /// Password Validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  /// Confirm Password Validation
  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (password == null || confirmPassword == null) {
      return 'Passwords must match.';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match.';
    }

    return null;
  }

  /// Phone number validation
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }

    return null;
  }

  /// Date Validation
  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your date of birth';
    }
    // Check date format (DD/MM/YYYY)
    final RegExp dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (!dateRegex.hasMatch(value)) {
      return 'Please enter a valid date format (DD/MM/YYYY)';
    }
    // Parse the entered date
    final List<String> parts = value.split('/');
    final int? day = int.tryParse(parts[0]);
    final int? month = int.tryParse(parts[1]);
    final int? year = int.tryParse(parts[2]);
    final DateTime enteredDate = DateTime(year!, month!, day!);

    // Check if the entered date is in the future
    if (enteredDate.isAfter(DateTime.now())) {
      return 'Please enter a date before today';
    }

    // Calculate age based on the entered date
    final Duration ageDifference = DateTime.now().difference(enteredDate);
    final int age = (ageDifference.inDays / 365).floor();

    // Check minimum age requirement (e.g., 18 years old)
    const int minimumAge = 18;
    if (age < minimumAge) {
      return 'You must be at least $minimumAge years old';
    }

    return null; // Return null if validation passes
  }

  /// Vehicle Registration Number Validation
  static String? validateIndianRegistrationNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Registration number is required.';
    }

    // Regular expression for Indian vehicle registration number validation
    final regNumberRegExp = RegExp(r'^[A-Z]{2}[0-9]{2}[A-Z]{1,3}[0-9]{1,4}$');

    if (!regNumberRegExp.hasMatch(value)) {
      return 'Invalid Indian registration number.';
    }

    return null;
  }
}

// Add more custom validators as needed for your specific requirements.