part of 'forget_verfiycode_cubit.dart';

sealed class ForgetVerfiycodeState extends Equatable {
  const ForgetVerfiycodeState();

  @override
  List<Object> get props => [];
}

final class ForgetVerfiycodeInitial extends ForgetVerfiycodeState {}
final class ForgetVerfiycodeLoading extends ForgetVerfiycodeState {}
final class ForgetVerfiycodeSuccess extends ForgetVerfiycodeState {
  final List<Datum>users;
  const ForgetVerfiycodeSuccess({required this.users});
}
final class ForgetVerfiycodeFailuer extends ForgetVerfiycodeState {
  final String mesrrror;
  const ForgetVerfiycodeFailuer({required this.mesrrror});
}

