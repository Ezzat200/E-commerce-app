part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
final class SignUpLoading extends SignUpState {}
final class SignUpSuccessful extends SignUpState {
final List<User> user;

  SignUpSuccessful( this.user);


}
final class SignUpFailuer extends SignUpState {
   final ServerFailure mesrrror;
SignUpFailuer( {required this.mesrrror});
}

