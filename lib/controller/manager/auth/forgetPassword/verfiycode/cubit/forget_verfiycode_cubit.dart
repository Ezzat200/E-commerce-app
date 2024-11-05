import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/constant/link.dart';
import 'package:e_commerce_app/core/errors/fialures.dart';
import 'package:e_commerce_app/core/functions/api.dart';
import 'package:e_commerce_app/data/model/auth/usermodel/user/datum.dart';
import 'package:equatable/equatable.dart';

part 'forget_verfiycode_state.dart';

class ForgetVerfiycodeCubit extends Cubit<ForgetVerfiycodeState> {
  ForgetVerfiycodeCubit() : super(ForgetVerfiycodeInitial());

Api api = Api();

  Future<Either<Failure, List<Datum>>> getVerfiyCode(String verfiyCode,String email) async {
  try {
    List<Datum> users=[];
  var response = await api.postRequest(linkForgetVerfiycode, {
    "user_verfiycode": verfiyCode,
    "user_email": email
  });
  
  

  if (response['Status'] == "Success") {
   
    

    emit(ForgetVerfiycodeSuccess(users: users));
    return right(users);
  } else {
    
    print(response['status'] + "===========");
 
   emit(ForgetVerfiycodeFailuer(mesrrror: response['status']));
    return left(ServerFailure(response['status']));
  }

} catch (e) {
  return left(ServerFailure("Failed to parse response: ${e.toString()}"));
}

  }

}
