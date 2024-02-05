import 'package:boutiqueapp/Providers/login_provider.dart';
import 'package:boutiqueapp/Providers/profile_provider.dart';
import 'package:boutiqueapp/Routes/app_navigation.dart';
import 'package:boutiqueapp/Routes/app_navigation_routes.dart';
import 'package:boutiqueapp/Routes/route_generator.dart';
import 'package:boutiqueapp/Utils/theme_provider.dart';
import 'package:boutiqueapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
  ChangeNotifierProvider(
    create: (context)=> ThemeProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiProvider(
          providers: [ChangeNotifierProvider<SignUpProvider>(create: (BuildContext context) => SignUpProvider()),
          ChangeNotifierProvider<LoginProvider>(create: (BuildContext context) => LoginProvider())],
          child: MaterialApp(
          
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            navigatorKey: AppNavigation.navigationKey,
            initialRoute: AppNavRoutes.initialRoute,
            onGenerateRoute: RouteGenerator.generateRoute,   
            theme: Provider.of<ThemeProvider>(context).themeData,
          ),
        );
      }
    );
  }
}