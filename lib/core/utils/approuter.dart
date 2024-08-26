import 'package:e_commerce_app/view/screens/auth/forgetPasswrod.dart';
import 'package:e_commerce_app/view/screens/auth/loginscreen.dart';
import 'package:e_commerce_app/view/screens/auth/resetPassword.dart';
import 'package:e_commerce_app/view/screens/auth/signupScreen.dart';
import 'package:e_commerce_app/view/screens/auth/verfiycode.dart';
import 'package:e_commerce_app/view/screens/onbording_screen.dart';
import 'package:go_router/go_router.dart';

abstract class Approuter{
  static const KLoginScreen='/loginScreen';
  static const KSignUpScreen='/signUpScreen';
  static const KFrogetPassword='/frogetPassword';
  static const KResetPassword='/resetPassword';
  static const KVerfiyCode='/verfiyCode';




  static final router = GoRouter(
    routes: [
 GoRoute(
      path: '/',
      builder: (context, state) {
        return const OnbordingScreen();
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
    GoRoute(
      path: KResetPassword,
      builder: (context, state) {
        return const ResetpasswordScreen();
      },
    ),
    GoRoute(
      path: KVerfiyCode,
      builder: (context, state) {
        return const VerfiycodeScreen();
      },
    ),
    ]);
}