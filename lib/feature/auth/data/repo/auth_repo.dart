import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsify/core/errors/auth_failuer.dart';

abstract class AuthRepo {
  Future<Either<AuthFailure,void>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<AuthFailure,void>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<AuthFailure,void>> signInWithGoogle();
  Future<Either<AuthFailure,void>> sendEmailVerification(User? user);
  Future<Either<AuthFailure,void>> forgetPassword({
    required String email,
  });
}