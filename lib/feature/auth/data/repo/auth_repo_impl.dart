import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsify/core/errors/auth_failuer.dart';
import 'package:newsify/feature/auth/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<AuthFailure, void>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
           if (!user.user!.emailVerified) {
      await user.user!.sendEmailVerification();
      return left(FirebaseAuthFailure(
        message: 'Please verify your email address',
      ));
    }
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
    }
  }

  @override
  Future<Either<AuthFailure, void>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return right(null);
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
    }
  }

  @override
  Future<Either<AuthFailure, void>> sendEmailVerification(User? user) async {
    try {
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
    }
  }

  @override
  Future<Either<AuthFailure, void>> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await sendEmailVerification(user.user);
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
    }
  }
  
  @override
  Future<Either<AuthFailure, void>> forgetPassword({required String email}) async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(null);
    }on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
    }
  }
}
