part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccessful extends LoginState {
  final List<Datum>user;
  const LoginSuccessful({required this.user});
}
final class LoginFailuer extends LoginState {
  final String message;
  const LoginFailuer({required this.message});
}

