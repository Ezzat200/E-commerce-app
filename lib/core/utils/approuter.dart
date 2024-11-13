import 'package:e_commerce_app/view/screens/auth/view/forgetScreens/check_email.dart';
import 'package:e_commerce_app/view/screens/auth/view/forgetScreens/forgetPasswrod.dart';
import 'package:e_commerce_app/view/screens/auth/view/home/home_screen.dart';
import 'package:e_commerce_app/view/screens/auth/view/loginscreen.dart';
import 'package:e_commerce_app/view/screens/auth/view/forgetScreens/resetPassword.dart';
import 'package:e_commerce_app/view/screens/auth/view/signupScreen.dart';
import 'package:e_commerce_app/view/screens/auth/view/verfiycode.dart';
import 'package:e_commerce_app/view/screens/auth/view/sucsess_signup.dart';
import 'package:e_commerce_app/view/screens/onbording_screen.dart';
import 'package:e_commerce_app/view/screens/test.dart';
import 'package:go_router/go_router.dart';

abstract class Approuter{
  static const KLoginScreen='/loginScreen';
  static const KSignUpScreen='/signUpScreen';
  static const KFrogetPassword='/frogetPassword';
  static const KResetPassword='/resetPassword';
  static const KVerfiyCode='/verfiyCode';
  static const KSuccessSignup='/successSignup';
  static const KCheckEmail='/checkEmail';
  


  static const KHomeScreen='/homeScreen';






  static final router = GoRouter(
    routes: [
 GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
     GoRoute(
      path: KLoginScreen,
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
     GoRoute(
      path: KSignUpScreen,
      builder: (context, state) {
        return const SignUpScreen();
      },
    ),
      GoRoute(
      path: KFrogetPassword,
      builder: (context, state) {
        return const ForgetpasswordScreen();
      },
    ),
    // GoRoute(
    //   path: KResetPassword,
    //   builder: (context, state) {
    //     return const ResetPasswordScreen(email: ,);
    //   },
    // ),
   
    GoRoute(
  path: KSuccessSignup,
  builder: (context, state) {
    return const SuccessSignup();
  },
),

  GoRoute(
  path: KCheckEmail,
  builder: (context, state) {
    return const CheckEmailScreen();
  },
),
   

    GoRoute(
  path: KHomeScreen,
  builder: (context, state) {
    return const HomeScreen();
  },
),
    

    
    ]);
}