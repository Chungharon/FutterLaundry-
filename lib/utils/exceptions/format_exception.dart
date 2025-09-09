/// Custom exception class to handle format-related errors.
class TFormatException implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const TFormatException({this.message = 'Invalid format encountered.   please check your input.'});

  /// Create a format exception from a specific message.
  factory TFormatException.fromMessage(String msg) {
    return TFormatException(message: msg);
  }

  /// Get the corresponding error message.
  String get formattedMessage => message;

  /// Create a format exception from a code (if needed).
  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return TFormatException(message: 'The email address is badly formatted.');
      case 'invalid-password':
        return TFormatException(message: 'The password is invalid or the user does not have a password.');
      case 'invalid-phone-number':
        return TFormatException(message: 'The phone number is not a valid phone number.');
      case 'invalid-verification-code':
        return TFormatException(message: 'The verification code is invalid.');
      case 'invalid-verification-id':
        return TFormatException(message: 'The verification ID is invalid.');
      case 'invalid-argument':
        return TFormatException(message: 'One or more arguments are invalid.');
      case 'malformed-credential':
        return TFormatException(message: 'The credential is malformed or has expired.');
      case 'invalid-credential':
        return TFormatException(message: 'The credential is invalid.');
      case 'invalid-user-token':
        return TFormatException(message: 'The user\'s credential is no longer valid. The user must sign in again.');
      case 'invalid-url-format':
        return TFormatException(message: 'The URL format is invalid.');
      case 'invalid-date-time':
        return TFormatException(message: 'The date/time format is invalid.');
      default:
        return TFormatException();
    }
  }
}