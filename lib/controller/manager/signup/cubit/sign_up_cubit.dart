import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/constant/link.dart';
import 'package:e_commerce_app/core/errors/fialures.dart';
import 'package:e_commerce_app/core/functions/api.dart';
import 'package:e_commerce_app/data/model/auth/usermodel/user.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
Api api=Api(); 
 Future<void>  signUp(String name , String email,String phone, String password) async {
    emit(SignUpLoading());
    dynamic response =await api.postRequest(linklogin, {
"user_name":name,
"user_email":email,
"user_phone":phone,
"user_password":password,

}); 

   if(! isClosed){
    return response?.fold(
      (failure) => emit(SignUpFailuer(mesrrror: failure)),
      (user) => emit(SignUpSuccessful(user)),

    );
   }
   
  }
}
