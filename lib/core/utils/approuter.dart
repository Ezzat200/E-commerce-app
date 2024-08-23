import 'package:e_commerce_app/view/screens/auth/loginscreen.dart';
import 'package:e_commerce_app/view/screens/onbording_screen.dart';
import 'package:go_router/go_router.dart';

abstract class Approuter{
  static const KLoginScreen='/loginScreen';
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
    ]);
}