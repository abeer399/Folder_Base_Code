class AppValidator {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required.';
    }

    // Check for minimum name length
    if (value.length < 3) {
      return 'Name must be at least 3 characters long.';
    }

    // Check for numbers
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'Name must not contain any number.';
    }

    // Check for special characters
    if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_+/-;]'))) {
      return 'Name must not contain any special character.';
    }

    return null;
  }

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

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
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

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    // final phoneRegExp = RegExp(r'^\d{10}$');

    // if (!phoneRegExp.hasMatch(value)) {
    //   return 'Invalid phone number format (10 digits required).';
    // }

    RegExp usPhoneNumberRegExp = RegExp(
      r'^(\+\d{1,2}\s?)?(\()?(\d{3})(\))?[-.\s]?(\d{3})[-.\s]?(\d{4})$',
    );

    if (!usPhoneNumberRegExp.hasMatch(value)) {
      return 'Invalid US phone number.';
    }

    return null;
  }

  static String? validateCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Code Required.';
    }
    if (value.length < 6) {
      return "Your Otp is short";
    }
    return null;
  }

// Add more custom validators as needed for your specific requirements.

  static String? isValidATMCard(String? value) {
    // Remove non-digit characters
    if (value!.isNotEmpty) {
      value.replaceAll(RegExp(r'\D'), '');
    }

    // Check if the cleaned card number is of the expected length (e.g., 16 digits for most cards)
    if (value.length != 19) {
      return "Please enter valid card number";
    }
    if (value.length > 19) {
      return "You can enter only 16 numbers";
    }
    return null;
  }

  static String? cvcValidation(String? value) {
    if (value!.isEmpty) {
      return "Please input CVC";
    }
    if (value.length > 3) {
      return "Cvc can't be longer than 3 numbers";
    }
    return null;
  }

  static String? monthValidation(String value) {
    // var count = 0;
    if (value.isEmpty) {
      return "Enter month";
    }
    if (value.length > 2) {
      return "Month can't be longer than 2 numbers";
    }
    // if (value.contains(count as Pattern)) {
    //   return "Please input"
    // }
    return null;
  }

  static String? yearValidation(String? value) {
    // var count = 0;
    if (value!.isEmpty) {
      return "Enter year";
    }
    if (value.length > 4) {
      return "Year can't be longer than 2 numbers";
    }
    // if (value.contains(count as Pattern)) {
    //   return "Please input"
    // }
    return null;
  }

  static String? placesValidation(String value) {
    if (value.isEmpty) {
      return "Please insert your location";
    }
    return null;
  }
}
