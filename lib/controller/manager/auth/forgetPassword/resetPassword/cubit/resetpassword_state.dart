part of 'resetpassword_cubit.dart';

sealed class ResetpasswordState extends Equatable {
  const ResetpasswordState();

  @override
  List<Object> get props => [];
}

final class ResetpasswordInitial extends ResetpasswordState {}
final class ResetpasswordLoading extends ResetpasswordState {}
final class ResetpasswordSuccess extends ResetpasswordState {
  final List<Datum>users;
  const ResetpasswordSuccess({required this.users});
}
final class ResetpasswordFailuer extends ResetpasswordState {
  final String message;
  const ResetpasswordFailuer({required this.message});
}

