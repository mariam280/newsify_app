import 'package:dartz/dartz.dart';
import 'package:newsify/core/errors/change_password_failure.dart';

abstract class ChangePasswordRepo {
  Future<Either<AuthFailure,String>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}