part of 'checkemail_cubit.dart';

sealed class CheckemailState extends Equatable {
  const CheckemailState();

  @override
  List<Object> get props => [];
}

final class CheckemailInitial extends CheckemailState {}
final class CheckemailLoading extends CheckemailState {}
final class CheckemailSuccess extends CheckemailState {
  final List<Datum>users;
  const CheckemailSuccess({required this.users});
}
final class CheckemailFailuer extends CheckemailState {
  final String message;
  const CheckemailFailuer({required this.message});
}

