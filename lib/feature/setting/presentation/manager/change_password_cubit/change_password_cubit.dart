import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsify/feature/setting/data/repos/change_password_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.changePasswordRepo) : super(ChangePasswordInitial());
  final ChangePasswordRepo changePasswordRepo;
  Future<void> changePassword({required String oldPassword, required String newPassword}) async {
    emit(ChangePasswordLoading());
    final result = await changePasswordRepo.changePassword(oldPassword: oldPassword, newPassword: newPassword);
    result.fold(
      (failure) => emit(ChangePasswordError(failure.message)),
      (message) => emit(ChangePasswordSuccess()),
    );
  }
}
