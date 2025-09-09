/// custom exception class to handle various Firebase-related errors.
class TFirebaseException {
  /// the error code associated with the exception.
  final String code;

  /// constructor that takes on error code.
  TFirebaseException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'invalid-argument':
        return 'Invalid argument provided.';
      case 'deadline-exceeded':
        return 'The operation took too long to complete.';
      case 'not-found':
        return 'Requested resource not found.';
      case 'already-exists':
        return 'The resource already exists.';
      case 'permission-denied':
        return 'Permission denied for this operation.';
      case 'unauthenticated':
        return 'User is not authenticated.';
      case 'resource-exhausted':
        return 'Resource has been exhausted.';
      case 'failed-precondition':
        return 'Operation was rejected due to failed precondition.';
      case 'aborted':
        return 'Operation was aborted.';
      case 'out-of-range':
        return 'Operation was attempted past the valid range.';
      case 'unimplemented':
        return 'Operation is not implemented or not supported.';
      case 'internal':
        return 'Internal error occurred in the Firebase service.';
      case 'unavailable':
        return 'Firebase service is currently unavailable.';
      case 'data-loss':
        return 'Unrecoverable data loss or corruption occurred.';
      default:
        return 'An unknown error occurred. Please try again later.';
    }
  }
}
