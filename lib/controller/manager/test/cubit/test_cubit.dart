import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constant/link.dart';
import 'package:e_commerce_app/core/errors/fialures.dart';
import 'package:e_commerce_app/core/functions/api.dart';
import 'package:e_commerce_app/data/model/auth/usermodel/user/datum.dart';
import 'package:e_commerce_app/data/model/auth/usermodel/user/user.dart';
import 'package:equatable/equatable.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());

  Api api=Api();  // Make sure to initialize this or inject it through the constructor


  Future<Either<Failure,List<Datum>>> getData() async {
  try {
  emit(Testloading());
  List<Datum> users = [];
  var response = await api.getRequiest(linkTets);
  // Assuming response['data'] is a list of user data objects
  for (var user in response['data']) {
    users.add(Datum.fromJson(user));
  }
  emit(Testsuccess(users));
  
  print(users); // This should now print the actual user data
  print(response['data']);
  
  return right(users);
} on Exception catch (e) {
  if(e is DioError){
emit(Testfailuer(message:ServerFailure.fromDioError(e) ));
  // return left(ServerFailure.fromDioError(e));
  }
  return left(ServerFailure(e.toString()));
}
// Emit the loaded state with data
  
}

}
