import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/constant/link.dart';
import 'package:e_commerce_app/core/errors/fialures.dart';
import 'package:e_commerce_app/core/functions/api.dart';
import 'package:e_commerce_app/data/model/auth/usermodel/user/datum.dart';
import 'package:equatable/equatable.dart';

part 'checkemail_state.dart';

class CheckemailCubit extends Cubit<CheckemailState> {
  CheckemailCubit() : super(CheckemailInitial());
 Api api = Api();
   Future<Either<Failure, List<Datum>>> checkEmail(String email, ) async {
  emit(CheckemailLoading());
  try {
    List <Datum>users=[];
    final response = await api.postRequest(linkCheckEmail, {
      "user_email": email,
      
    });

    
      if (response['status'] == "success") {
       
       
          emit(CheckemailSuccess( users: users));
          return right(users);
        
       
    } else {
      emit(CheckemailFailuer(message: response['message']));
      return left(ServerFailure('Unexpected response format'));
    }
  }  on Exception catch (e) {
    emit(CheckemailFailuer(message: 'An error occurred: ${e.toString()}'));
    return left(ServerFailure(e.toString()));
  }
}

}
