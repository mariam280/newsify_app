import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFailure {
  final String message;
  const AuthFailure(this.message);
}

class WrongPasswordFailure extends AuthFailure {
  const WrongPasswordFailure() : super('Old password is incorrect!');
}

class UnknownAuthFailure extends AuthFailure {
  const UnknownAuthFailure(super.message);
}

/// **كلاس شامل لمعالجة أخطاء تغيير كلمة المرور من Firebase**
class PasswordChangeFailure extends AuthFailure {
  const PasswordChangeFailure(super.message);

  /// **تحويل FirebaseAuthException إلى Failure مناسب**
  factory PasswordChangeFailure.fromFirebaseAuthException(
      FirebaseAuthException e) {
    switch (e.code) {
      case 'wrong-password':
        return const PasswordChangeFailure('Current password is incorrect');
      case 'weak-password':
        return const PasswordChangeFailure(
            'New password is too weak. Use at least 8 characters');
      case 'requires-recent-login':
        return const PasswordChangeFailure(
            'This operation is sensitive and requires recent authentication. Please log in again');
      case 'too-many-requests':
        return const PasswordChangeFailure(
            'Too many attempts. Please try again later');
      case 'user-not-found':
        return const PasswordChangeFailure('User account not found');
      case 'user-disabled':
        return const PasswordChangeFailure('User account has been disabled');
      case 'operation-not-allowed':
        return const PasswordChangeFailure(
            'Password change is not allowed for this account');
      default:
        return PasswordChangeFailure(
            'Failed to change password: ${e.message ?? 'Unknown error'}');
    }
  }
}
