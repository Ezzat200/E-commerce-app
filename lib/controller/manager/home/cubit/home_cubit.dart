import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constant/link.dart';
import 'package:e_commerce_app/core/errors/fialures.dart';
import 'package:e_commerce_app/core/functions/api.dart';
import 'package:e_commerce_app/data/model/categories_model/categories_model.dart';
import 'package:e_commerce_app/data/model/items_model/items_model.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  Api api = Api();
  Future<Either<Failure,List<CategoriesModel>>> getallData() async {
  try {
  emit(HomeLoading());
  List<CategoriesModel> categories = [];
  List<ItemsModel> items = [];

  var response = await api.getRequiest(linkHome);
 
  for (var cat in response['categories']) {
    categories.add(CategoriesModel.fromJson(cat));
  }

    for (var item in response['items']) {
    items.add(ItemsModel.fromJson(item));
  }
  emit(HomeSuccess(categories: categories,items:items ));
  
  print(categories); // This should now print the actual user data
  print(response['categories']);
  
  return right(categories);
} on Exception catch (e) {
  if(e is DioError){
emit(HomeFailuer(message: ServerFailure.fromDioError(e) ));
  return left(ServerFailure.fromDioError(e));
  }
  return left(ServerFailure(e.toString()));
}

  
}

}
