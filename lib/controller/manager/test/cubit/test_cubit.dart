// import 'package:bloc/bloc.dart';
// import 'package:e_commerce_app/core/constant/link.dart';
// import 'package:e_commerce_app/core/errors/fialures.dart';
// import 'package:e_commerce_app/core/functions/api.dart';
// import 'package:e_commerce_app/data/model/auth/usermodel/user.dart';
// import 'package:equatable/equatable.dart';

// part 'test_state.dart';

// class TestCubit extends Cubit<TestState> {
//   TestCubit() : super(TestInitial());

//   Api api=Api();  // Make sure to initialize this or inject it through the constructor


//   Future<void> getData() async {
//     emit(Testloading());
//     dynamic response = await api.postRequest();
// print(response);
//    return response?.fold(
//       (failure) => emit(Testfailuer(message: failure)),
//       (userList) => emit(Testsuccess(userList)),

//     );
   
//   }

  
// }
