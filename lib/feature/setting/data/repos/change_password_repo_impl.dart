import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsify/core/errors/change_password_failure.dart';
import 'package:newsify/feature/setting/data/repos/change_password_repo.dart';

class ChangePasswordRepoImpl implements ChangePasswordRepo {
  @override
  Future<Either<AuthFailure, String>> changePassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null || user.email == null) {
        return left(const UnknownAuthFailure('User not found'));
      }
      if ( user.email != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: oldPassword,
        );

        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(newPassword);
        return right('Password changed successfully');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return left(const WrongPasswordFailure());
      }
      return left(PasswordChangeFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(PasswordChangeFailure( e.toString()));
    }
    return left(UnknownAuthFailure('Unknown error'));
  }
  }


