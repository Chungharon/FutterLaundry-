/// A custom exception class to handle platform-specific errors.
class TPlatformException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  TPlatformException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'network_error':
        return 'A network error occurred. Please check your internet connection.';
      case 'timeout':
        return 'The operation timed out. Please try again later.';
      case 'not_available':
        return 'The requested service is not available on this platform.';
      case 'permission_denied':
        return 'Permission denied. Please grant the necessary permissions and try again.';
      case 'unimplemented':
        return 'This feature is not implemented on the current platform.';
      case 'unknown':
        return 'An unknown error occurred. Please try again.';
      case 'canceled':
        return 'The operation was canceled by the user.';
      case 'invalid_argument':
        return 'An invalid argument was provided. Please check the input and try again.';
      case 'internal':
        return 'An internal error occurred. Please try again later.';
      case 'failed_precondition':
        return 'The operation was attempted in an invalid state. Please ensure all preconditions are met and try again.';
      case 'aborted':
        return 'The operation was aborted. Please try again.';
      case 'out_of_range':
        return 'The operation was attempted with an out-of-range value. Please check the input and try again.';
      case 'data_loss':
        return 'Unrecoverable data loss or corruption occurred.';
      case 'already_exists':
        return 'The item you are trying to create already exists.';
      case 'not_found':
        return 'The requested item was not found.';
      case 'resource_exhausted':
        return 'Resource exhausted. Please try again later.';
      case 'unauthenticated':
        return 'The request does not have valid authentication credentials.';
      case 'unavailable':
        return 'The service is currently unavailable. Please try again later.';
      case 'deadline_exceeded':
        return 'The operation took too long to complete. Please try again later.';
      case 'session_expired':
        return 'The session has expired. Please log in again.';
      case 'invalid_session':
        return 'The session is invalid. Please log in again.';
      case 'service_unavailable':
        return 'The service is temporarily unavailable. Please try again later.';
      case 'operation_in_progress':
        return 'Another operation is already in progress. Please wait for it to complete.';
      case 'operation_not_permitted':
        return 'This operation is not permitted. Please check your permissions and try again.';
      case 'insufficient_storage':
        return 'Insufficient storage available to complete the operation.';
      case 'quota_exceeded':
        return 'You have exceeded your storage quota. Please free up some space and try again.';
      case 'sign_in_required':
        return 'You need to be signed in to perform this operation.';
      case 'invalid_token':
        return 'The provided token is invalid. Please try again.';
      case 'token_expired':
        return 'The provided token has expired. Please sign in again.';
      case 'user_canceled':
        return 'The user canceled the operation.';
      case 'sign_in_failed':
        return 'Sign-in failed. Please check your credentials and try again.'; 
      case 'account_exists_with_different_credential':
        return 'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.';
      case 'invalid_credential':
        return 'The supplied auth credential is malformed or has expired.';
      case 'web-storage-unsupported':
        return 'The browser does not support web storage.';
      case 'cancelled-popup-request':
        return 'This operation has been cancelled due to another conflicting popup being opened.';
      case 'invalid_email':
        return 'The email address is badly formatted.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'user-not-found':
        return 'No user found for the provided email.';
      case 'wrong-password':
        return 'The password is invalid for the given email.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}