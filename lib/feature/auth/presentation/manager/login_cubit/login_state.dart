part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {}
final class LoginSuccessGoogleState extends LoginState {}


final class LoginFaluireState extends LoginState {
  final String errMessage;

  LoginFaluireState({required this.errMessage} );
}
