import 'package:firebase_auth/firebase_auth.dart';
import 'package:ieeewie/core/helpers/ui_helpers.dart';
class FirebaseExceptions {

  static String handleAuthException(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      UiAlerts.showErrorNotification('No user found for that email.');
      return 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      UiAlerts.showErrorNotification('Wrong password provided for that user.');
      return 'Wrong password provided for that user.';
    } else if (e.code == 'weak-password') {
      UiAlerts.showErrorNotification('The password provided is too weak.');
      return 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      UiAlerts.showErrorNotification('The account already exists for that email.');
      return 'The account already exists for that email.';
    } else if (e.code == 'invalid-email') {
      UiAlerts.showErrorNotification('Invalid email provided for that user.');
      return 'Invalid email provided for that user.';
    } else if (e.code == 'account-exists-with-different-credential') {
      UiAlerts.showErrorNotification(e.code);
      return 'The account already exists with a different credential.';
    } else if (e.code == 'requires-recent-login') {
      UiAlerts.showErrorNotification(e.code);
      return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
    } else if (e.code == 'user-disabled') {
      UiAlerts.showErrorNotification(e.code);
      return 'The user account has been disabled by an administrator.';
    } else if (e.code == 'user-token-expired') {
      UiAlerts.showErrorNotification(e.code);
      return 'The user\'s credential is no longer valid. The user must sign in again.';
    } else if (e.code == 'user-not-found') {
      UiAlerts.showErrorNotification('There is no user record corresponding to this identifier. The user may have been deleted.');
      return 'There is no user record corresponding to this identifier. The user may have been deleted.';
    } else if (e.code == 'invalid-user-token') {
      UiAlerts.showErrorNotification(e.code);
      return 'The user\'s credential is no longer valid. The user must sign in again.';
    } else if (e.code == 'operation-not-allowed') {
      UiAlerts.showErrorNotification(e.code);
      return 'This operation is not allowed. You must enable this service in the console.';
    } else if (e.code == 'wrong-password') {
      UiAlerts.showErrorNotification('The password is invalid or the user does not have a password.');
      return 'The password is invalid or the user does not have a password.';
    } else if (e.code == 'too-many-requests') {
      UiAlerts.showErrorNotification(e.code);
      return 'We have blocked all requests from this device due to unusual activity. Try again later.';
    } else if (e.code == 'user-not-found') {
      UiAlerts.showErrorNotification('There is no user record corresponding to this identifier. The user may have been deleted.');
      return 'There is no user record corresponding to this identifier. The user may have been deleted.';
    } else if (e.code == 'email-already-in-use') {
      UiAlerts.showErrorNotification('The email address is already in use by another account.');
      return 'The email address is already in use by another account.';
    } else if (e.code == 'operation-not-allowed') {
      UiAlerts.showErrorNotification(e.code);
      return 'Password sign-in is disabled for this project.';
    } else {
      UiAlerts.showErrorNotification(e.code);
      return e.code;
    }
  }

  static String handleFirebaseException(FirebaseException e) {
    if (e.code == 'permission-denied') {
      UiAlerts.showErrorNotification(e.code);
      return 'Missing or insufficient permissions.';
    } else if (e.code == 'resource-exhausted') {
      UiAlerts.showErrorNotification(e.code);
      return 'Some resource has been exhausted, perhaps a per-user quota, or perhaps the entire file system is out of space.';
    } else if (e.code == 'failed-precondition') {
      UiAlerts.showErrorNotification(e.code);
      return 'Operation was rejected because the system is not in a state required for the operation\'s execution.';
    } else if (e.code == 'aborted') {
      UiAlerts.showErrorNotification(e.code);
      return 'The operation was aborted, typically due to a concurrency issue like sequencer check failures, transaction aborts, etc.';
    } else if (e.code == 'out-of-range') {
      UiAlerts.showErrorNotification(e.code);
      return 'Operation was attempted past the valid range.';
    } else if (e.code == 'unimplemented') {
      UiAlerts.showErrorNotification(e.code);
      return 'Operation is not implemented or not supported/enabled.';
    } else if (e.code == 'internal') {
      UiAlerts.showErrorNotification(e.code);
      return 'Internal errors. Means some invariants expected by underlying System has been broken. If you see one of these errors, Something is very broken.';
    } else if (e.code == 'unavailable') {
      UiAlerts.showErrorNotification(e.code);
      return 'The service is currently unavailable. This is a most likely a transient condition and may be corrected by retrying with a backoff.';
    } else if (e.code == 'data-loss') {
      UiAlerts.showErrorNotification(e.code);
      return 'Unrecoverable data loss or corruption.';
    } else if (e.code == 'unauthenticated') {
      UiAlerts.showErrorNotification(e.code);
      return 'The request does not have valid authentication credentials for the operation.';
    } else {
      UiAlerts.showErrorNotification(e.code);
      return e.code;
    }
  }
}
