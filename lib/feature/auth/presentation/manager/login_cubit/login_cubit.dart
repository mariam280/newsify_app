import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsify/feature/auth/data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> signinWithEmail(
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    final result = await authRepo.signInWithEmailAndPassword(
        email: email, password: password);
    result.fold(
      (failuer) => emit(LoginFaluireState(errMessage: failuer.message)),
      (_) => emit(LoginSuccessState()),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoadingState());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(LoginFaluireState(errMessage: failure.message)),
      (_) => emit(LoginSuccessGoogleState()),        /////////////////////////// google
    );
  }
}
