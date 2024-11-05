import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/constant/link.dart';
import 'package:e_commerce_app/core/errors/fialures.dart';
import 'package:e_commerce_app/core/functions/api.dart';
import 'package:e_commerce_app/data/model/auth/usermodel/user/datum.dart';
import 'package:equatable/equatable.dart';

part 'resetpassword_state.dart';

class ResetpasswordCubit extends Cubit<ResetpasswordState> {
  ResetpasswordCubit() : super(ResetpasswordInitial());

  Api api = Api();
   Future<Either<Failure, List<Datum>>> resetPassword(String email, String password) async {
  emit(ResetpasswordLoading());
  try {
    List <Datum>users=[];
    final response = await api.postRequest(linkResetPassword, {
      "user_email": email,
      "user_password": password,
    });

    print(response);
      if (response['status'] == "success") {
       
       
          emit(ResetpasswordSuccess( users: users));
          return right(users);
        
       
    } else {
      emit(ResetpasswordFailuer(message:  response['message']));
      return left(ServerFailure('Unexpected response format'));
    }
  }  on Exception catch (e) {
    emit(ResetpasswordFailuer(message: 'An error occurred: ${e.toString()}'));
    return left(ServerFailure(e.toString()));
  }
}
}
