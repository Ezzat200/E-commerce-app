part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeSuccess extends HomeState {
  final List<CategoriesModel>categories;
  final List<ItemsModel> items;
const  HomeSuccess({required this.categories,required this.items});

}
final class HomeFailuer extends HomeState {
  final ServerFailure message;
  const HomeFailuer({required this.message});
}

