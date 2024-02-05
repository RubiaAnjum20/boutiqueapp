import 'package:boutiqueapp/Routes/app_navigation_routes.dart';
import 'package:boutiqueapp/Screens/HomeScreen/home_screen.dart';
import 'package:boutiqueapp/Screens/Profile/my_profile.dart';
import 'package:boutiqueapp/Screens/ReviewCart/review_cart_screen.dart';
import 'package:boutiqueapp/Screens/Search/search.dart';
import 'package:boutiqueapp/Screens/UseraAuth/LoginScreen/login_screen.dart';
import 'package:boutiqueapp/Screens/UseraAuth/SignUp/sign_up_screen.dart';
import 'package:boutiqueapp/Screens/UseraAuth/SplashScreen/splash_screen.dart';
import 'package:boutiqueapp/Widgets/MainScreen/main_screen.dart';
import 'package:flutter/material.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppNavRoutes.initialRoute:
        return routeScreen(child: const SplashScreen());
      case AppNavRoutes.loginScreen:
        return routeScreen(child: const LoginScreen());
      case AppNavRoutes.signUpScreen:
        return routeScreen(child: const SignUpScreen());
      case AppNavRoutes.homeScreen:
        return routeScreen(child: const HomeScreen());
      case AppNavRoutes.mainScreen:
        return routeScreen(child: const MainScreen());
      case AppNavRoutes.myProfile:
        return routeScreen(child: const MyProfileScreen());
      case AppNavRoutes.search:
        return routeScreen(child:  Search());
      case AppNavRoutes.search:
        return routeScreen(child:  ReviewCartScreen());


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
