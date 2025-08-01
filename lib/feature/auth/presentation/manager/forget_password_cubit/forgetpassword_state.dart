part of 'forgetpassword_cubit.dart';

@immutable
sealed class ForgetpasswordState {}
class ForgetPasswordInitial extends ForgetpasswordState {}

class ForgetPasswordLoading extends ForgetpasswordState {}

class ForgetPasswordSuccess extends ForgetpasswordState {}

class ForgetPasswordFailure extends ForgetpasswordState {
  final String errorMessage;
  ForgetPasswordFailure({required this.errorMessage});
}
