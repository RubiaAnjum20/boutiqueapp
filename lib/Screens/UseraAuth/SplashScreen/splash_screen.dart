import 'package:boutiqueapp/Routes/app_navigation.dart';
import 'package:boutiqueapp/Routes/app_navigation_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 5), () {
      AppNavigation.pushAndKillAll(routeName: AppNavRoutes.loginScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Anjum\'s Boutique',
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/1_21_36.jpg'))),
        // child: Column(
        //   children: [
        //     // Image.asset('assets/images/1_21_36.jpg'),
        //     // ElevatedButton(
        //     //   onPressed: (){
        //     //     AppNavigation.navigateTo(routeName: AppNavRoutes.loginScreen);
        //     //   }, child: Text('Login'))
        //   ],
        // )
      ),
    );
  }
}
