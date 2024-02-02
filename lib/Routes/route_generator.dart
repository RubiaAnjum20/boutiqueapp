import 'package:boutiqueapp/Routes/app_navigation_routes.dart';
import 'package:boutiqueapp/Screens/HomePage/home_page_screen.dart';
import 'package:boutiqueapp/Screens/HomeScreen/home_screen.dart';
import 'package:boutiqueapp/Screens/UseraAuth/LoginScreen/login_screen.dart';
import 'package:boutiqueapp/Screens/UseraAuth/SignUp/sign_up_screen.dart';
import 'package:boutiqueapp/Screens/UseraAuth/SplashScreen/splash_screen.dart';
import 'package:flutter/material.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppNavRoutes.initialRoute:
        return routeScreen(child: const LoginScreen());
      case AppNavRoutes.loginScreen:
        return routeScreen(child: const LoginScreen());
      case AppNavRoutes.signUpScreen:
        return routeScreen(child: const SignUpScreen());
      case AppNavRoutes.homeScreen:
        return routeScreen(child: const HomeScreen());
      case AppNavRoutes.homePageScreen:
        return routeScreen(child: const HomePageScreen());


      // case AppNavRoutes.userScreen:
      //   UserProfileModel kuchbhi = args as UserProfileModel;
      //   return routeScreen(
      //       child: UserScreen(
      //     myProfile: kuchbhi,
      //   ));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Text('Error Page');
    });
  }

  static Route<dynamic> routeScreen({
    Widget? child,
  }) {
    return MaterialPageRoute(
      // builder: (context) => child!,
      builder: (context) => SafeArea(
        child: child!,
      ),
    );
  }
}
