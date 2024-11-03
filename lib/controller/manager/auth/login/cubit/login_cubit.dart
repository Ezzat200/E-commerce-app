import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/constant/link.dart';
import 'package:e_commerce_app/core/errors/fialures.dart';
import 'package:e_commerce_app/core/functions/api.dart';
import 'package:e_commerce_app/data/model/auth/usermodel/user/datum.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

   Api api = Api();
Future<Either<Failure, List<Datum>>> login(String email, String password) async {
  emit(LoginLoading());
  try {
    List <Datum>users=[];
    final response = await api.postRequest(linkLogin, {
      "user_email": email,
      "user_password": password,
    });

    
      if (response['status'] == "Success") {
       
       
          emit(LoginSuccessful(user: users));
          return right(users);
        
       
    } else {
      emit(LoginFailuer(message: response['message']));
      return left(ServerFailure('Unexpected response format'));
    }
  }  on Exception catch (e) {
    emit(LoginFailuer(message: 'An error occurred: ${e.toString()}'));
    return left(ServerFailure(e.toString()));
  }
}

}


