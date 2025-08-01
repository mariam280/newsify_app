import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsify/feature/auth/data/repo/auth_repo.dart';

part 'forgetpassword_state.dart';

class ForgetpassWordCubit extends Cubit<ForgetpasswordState> {
  ForgetpassWordCubit(this.authRepo) : super(ForgetPasswordInitial());
  final AuthRepo authRepo;
  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    final result = await authRepo.forgetPassword(email: email);
    result.fold(
      (failure) {
        emit(ForgetPasswordFailure(errorMessage: failure.message));
      },
      (_) {
        emit(ForgetPasswordSuccess());
      },
    );
  }
}
