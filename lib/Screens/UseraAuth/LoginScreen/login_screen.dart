import 'package:boutiqueapp/Components/CustomTextFormField/custom_text_form_field.dart';
import 'package:boutiqueapp/Components/FirebaseAuthServices/user_auth_services.dart';
import 'package:boutiqueapp/Routes/app_navigation.dart';
import 'package:boutiqueapp/Routes/app_navigation_routes.dart';
import 'package:boutiqueapp/Screens/HomePage/home_page_screen.dart';
import 'package:boutiqueapp/Screens/UseraAuth/SignUp/sign_up_screen.dart';
import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:boutiqueapp/Utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserAuthServices _authServices = UserAuthServices();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
      body: SafeArea(
        child: Container(
           width: double.infinity,
          decoration: const BoxDecoration(
            gradient: AppColors.kPrimaryGradient,
          ),
          child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Gap(25.w),
                    Image.asset('${AppConstants.assetImages}logo.png',
                    height: 139,
                    width: 155,
                    ),
                  ],
                ),
              ),
              Gap(3.h),
              Expanded(
                child: Container(
                  width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.lightPinkColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           const Text(
                              'Login',
                              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                            ),
                            Gap(3  .h),
                            CustomTextFormField(
                              controller: _emailController,
                              hintText: 'Email',
                            ),
                            Gap(2.h),
                            CustomTextFormField(
                              controller: _passwordController,
                              hintText: 'Password',
                              obscureText: true,
                              suffixWidget: Icon(Icons.visibility_off_outlined),
                            ),
                            Gap(5.h),
                            GestureDetector(
                              onTap: () {
                                _signIn();
                              },
                              child: Container(
                                width: double.infinity,
                                height: 7.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.magentaColor),
                                child: const Center(
                                    child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            Gap(2.h),
                            // with custom text
                            SignInButton(
                              Buttons.Google,
                              text: "Login with Google",
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h ),
                              onPressed: () {},
                            ),
                            Gap(2.h),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                const TextSpan(
                                    text: 'Don\'t have an account? ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackTextColor)),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackTextColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigator.pushAndRemoveUntil(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => SignUpScreen()),
                                      //     (route) => false);
                                      AppNavigation.pushAndKillAll(
                                        routeName: AppNavRoutes.signUpScreen,
                                      );
                                    },
                                ),
                                const TextSpan(
                                    text: '.',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackTextColor)),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _authServices.signInWithEmailAndPassword(
        email, password, context);

    if (user != null) {
      print('User is succesfulyy signedIn');
      AppNavigation.pushAndKillAll(routeName: AppNavRoutes.homeScreen);
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => HomeScreen()),
      //     (route) => false);
      //AppNavigation.pushAndKillAll(routeName: AppNavRoutes.homeScreen);
    } else {
      print('Some error happened');
    }
  }
}
