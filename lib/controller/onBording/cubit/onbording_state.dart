part of 'onbording_cubit.dart';


sealed class OnbordingState {}

 class OnbordingInitial extends OnbordingState {}

 class OnbordingChangePageState extends OnbordingState {
  int index;
  OnbordingChangePageState({required this.index});
}
 class OnbordingNext extends OnbordingState 
 {
  int index;
  OnbordingNext({required this.index});
 }


