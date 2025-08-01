import 'package:firebase_auth/firebase_auth.dart';

/// **كلاس عام يمثل أي فشل يحدث أثناء عمليات المصادقة**
abstract class AuthFailure {
  final String message;
  AuthFailure({required this.message});
}

/// **كلاس خاص بفشل المصادقة من Firebase**
class FirebaseAuthFailure extends AuthFailure {
  FirebaseAuthFailure({required super.message});

  /// **Factory لتحليل الأخطاء القادمة من FirebaseAuthException**
  factory FirebaseAuthFailure.fromFirebaseAuthException(
    FirebaseAuthException e,
  ) {
    switch (e.code) {
      case 'user-not-found':
        return FirebaseAuthFailure(message: "No user found for that email.");
      case 'wrong-password':
        return FirebaseAuthFailure(message: "Incorrect password.");
      case 'email-already-in-use':
        return FirebaseAuthFailure(message: "The email is already in use.");
      case 'weak-password':
        return FirebaseAuthFailure(message: "The password is too weak.");
      case 'invalid-email':
        return FirebaseAuthFailure(message: "The email format is invalid.");
         case 'user-disabled':
        return  FirebaseAuthFailure(message: 'User account has been disabled');
      case 'operation-not-allowed':
        return  FirebaseAuthFailure(message: 'Password change is not allowed for this account');
      default:
        return FirebaseAuthFailure(
          message: "Authentication error: ${e.message}",
        );
    }
  }
}
