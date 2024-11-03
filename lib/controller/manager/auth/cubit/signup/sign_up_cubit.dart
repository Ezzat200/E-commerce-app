import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/constant/link.dart';
import 'package:e_commerce_app/core/errors/fialures.dart';
import 'package:e_commerce_app/core/functions/api.dart';
import 'package:e_commerce_app/data/model/auth/usermodel/user/datum.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  Api api = Api();

  Future<Either<Failure, List<Datum>>> signUp(String name, String email, String phone, String password) async {
    try {
      List<Datum> users = [];
      var response = await api.postRequest(linksignUp, {
        "user_name": name,
        "user_email": email,
        "user_phone": phone,
        "user_password": password,
      });

      if (response['state'] == "error") {
        
        String errorMessage = response['message'];
        emit(SignUpFailuer(mesrrror: errorMessage));
        return left(ServerFailure(errorMessage));
      } else {
        
        emit(SignUpSuccessful(users));
        return right(users);
      }
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

}
