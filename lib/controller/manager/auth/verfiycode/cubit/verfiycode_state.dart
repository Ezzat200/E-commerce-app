part of 'verfiycode_cubit.dart';

sealed class VerfiycodeState extends Equatable {
  const VerfiycodeState();

  @override
  List<Object> get props => [];
}

final class VerfiycodeInitial extends VerfiycodeState {}
final class VerfiycodeLoading extends VerfiycodeState {}
final class VerfiycodeSuccessful extends VerfiycodeState {
  final List <Datum> code;

  VerfiycodeSuccessful( this.code);

}
final class VerfiycodeFailuer extends VerfiycodeState {
  final String message;
  VerfiycodeFailuer({required this.message});
}

