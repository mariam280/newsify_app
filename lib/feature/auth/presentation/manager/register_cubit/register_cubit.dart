import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsify/feature/auth/data/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;
  Future<void> signUpWithEmail(
      {required String email, required String password}) async {
    emit(RegisterLoadingState());
    final result = await authRepo.signUpWithEmailAndPassword(
        email: email, password: password);
    result.fold(
      (failure) => emit(RegisterFaluireState(errMessage: failure.message)),
      (_) {
        emit(RegisterSuccessState());
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(RegisterLoadingState());

    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(RegisterFaluireState(errMessage: failure.message)),
      (_) {
        emit(RegisterSuccessGoogleState());              ///////////////////////////google
      },
    );
  }


  /* Future<UserCredential> signInWithTwitter() async {
  // Create a TwitterLogin instance
  final twitterLogin =  TwitterLogin(
    apiKey: '5FtGKX9NetlqTrYks8RFKEkNU',
    apiSecretKey:'Q8a3I9pxpiB29fJfLs0MJD4ppclJdjdboaBZ5sOetTU9WqZeUx',
    redirectURI: 'https://newsfiy-app.firebaseapp.com/__/auth/handler'
  );

  // Trigger the sign-in flow
  final authResult = await twitterLogin.login();

  // Check if the login was successful
  if (authResult.status == TwitterLoginStatus.loggedIn) {
    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
  } else {
    // Handle login failure
    throw Exception('Twitter login failed: ${authResult.errorMessage}');
  }
}*/
}
