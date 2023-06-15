import 'package:catering_service/view/home_page.dart';
import 'package:catering_service/view/screen/auth/login_screen_ui.dart';
import 'package:catering_service/view/screen/auth/sign_up_screen_ui.dart';
import 'package:catering_service/view/screen/splash_screen/splash_screen.dart';

final routeScreen = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomePage(),
  'login': (context) => const LoginPage(),
  'signup': (context) => const SignUpPage(),
};
