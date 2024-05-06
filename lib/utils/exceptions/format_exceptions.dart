class CustomFormatException implements Exception {
  final String message;
  CustomFormatException([this.message = 'An unexpected format error occurred. Please check your input.']);

  factory CustomFormatException.fromMessage(String message){
    return CustomFormatException(message);
  }

  String get formattedMessage => message;


  factory CustomFormatException.fromCode(String code){
    switch(code){
      case 'invalid-email-format':
        return  CustomFormatException('The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return  CustomFormatException('The provide phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return  CustomFormatException('The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return  CustomFormatException('The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return  CustomFormatException('The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return  CustomFormatException('The input should be a valid numeric format.');
      default:
        return CustomFormatException('An unexpected format error occurred. Please check your input.');
    }
  }

}