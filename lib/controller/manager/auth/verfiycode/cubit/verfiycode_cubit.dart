import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/constant/link.dart';
import 'package:e_commerce_app/core/errors/fialures.dart';
import 'package:e_commerce_app/core/functions/api.dart';
import 'package:e_commerce_app/data/model/auth/usermodel/user/datum.dart';
import 'package:e_commerce_app/data/model/auth/usermodel/user/user.dart';
import 'package:equatable/equatable.dart';

part 'verfiycode_state.dart';

class VerfiycodeCubit extends Cubit<VerfiycodeState> {
  VerfiycodeCubit() : super(VerfiycodeInitial());
  Api api = Api();

  Future<Either<Failure, List<Datum>>> getVerfiyCode(String verfiyCode,String email) async {
  try {
    List<Datum> users=[];
  var response = await api.postRequest(linkVerfiycode, {
    "user_verfiycode": verfiyCode,
    "user_email": email
  });
  
  

  if (response['status'] == "success") {
   
    

    emit(VerfiycodeSuccessful(users));
    return right(users);
  } else {
    
    print(response['status'] + "===========");
 
   emit(VerfiycodeFailuer(message: response['status']));
    return left(ServerFailure(response['status']));
  }

} catch (e) {
  return left(ServerFailure("Failed to parse response: ${e.toString()}"));
}

  }


}
