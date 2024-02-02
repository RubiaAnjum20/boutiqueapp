import 'package:boutiqueapp/Components/CustomButton/custom_button.dart';
import 'package:boutiqueapp/Components/CustomTextFormField/custom_text_form_field.dart';
import 'package:boutiqueapp/Components/FirebaseAuthServices/user_auth_services.dart';
import 'package:boutiqueapp/Model/UserProfileModel/user_profile_model.dart';
import 'package:boutiqueapp/Routes/app_navigation.dart';
import 'package:boutiqueapp/Routes/app_navigation_routes.dart';
import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:boutiqueapp/Utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final formKey = GlobalKey<FormState>();
  final UserAuthServices _authServices = UserAuthServices();
  final List<UserProfileModel> userList = [];

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Sign Up'),
      // ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: AppColors.kPrimaryGradient,
          ),
          child: Column(
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
                              'Sign Up',
                              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                            ),
                            Gap(2.h),
                            CustomTextFormField(
                              controller: _usernameController,
                              hintText: 'Username',
                              validator: (value){
                                  if (value!.length < 3) {
                                      return 'Please enter minimum 3 characters';
                                    } else
                                      return null;
                              },
                            ),
                            Gap(2.h),
                            CustomTextFormField(
                              controller: _emailController,
                              hintText: 'Email',
                              inputType: TextInputType.emailAddress,
                            ),
                            Gap(2.h),
                            CustomTextFormField(
                              controller: _passwordController,
                              hintText: 'Password',
                              obscureText: true,
                            ),
                            Gap(6.h),
                            CustomButton(onPress: (){
                              if (formKey.currentState!.validate()) {
                                _signUp();
                              }
                            }, 
                            title: 'Sign Up',
                            buttonHeight: 7.h,
                            buttonwidth: double.infinity,
                            btnclr: AppColors.magentaColor,
                            buttonRadius: 10,
                            ),
                           
                            Gap(2.h),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                const TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackTextColor)),
                                TextSpan(
                                  text: 'Login',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackTextColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigator.pushAndRemoveUntil(context, 
                                      // MaterialPageRoute(builder: (context)=> LoginScreen()), (route)=>false);
                                      AppNavigation.pushAndKillAll(
                                        routeName: AppNavRoutes.loginScreen,
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

  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user =
        await _authServices.signUpWithEmailAndPassword(email, password, username, context);

    if (user != null) {
      print('User is succesfulyy created');
      // Navigator.pushAndRemoveUntil(context, 
      //                   MaterialPageRoute(builder: (context)=> HomeScreen()), (route)=>false);
      AppNavigation.pushAndKillAll(routeName: AppNavRoutes.homeScreen);
    } else {
      print('Some error happened');
    }
  }
}


//  GestureDetector(
//                               onTap: (){
//                                 _signUp();
//                                 // if (formKey.currentState!.validate()) {
//                                 //   print('Gesture Detector Called');
//                                 //   formKey.currentState!.save();
//                                 //   _signUp();
//                                 // }
//                                 // if (formKey.currentState!.validate()) {
//                                 //       print('Form is valid');
//                                 //       setState(() {
//                                 //         error = '';
//                                 //       });
//                               },
//                               child: Container(
//                                 width: double.infinity,
//                                 height: 7.h,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: AppColors.magentaColor),
//                                 child: const Center(
//                                     child: Text(
//                                   'Sign Up',
//                                   style: TextStyle(
//                                       color: Colors.white, fontWeight: FontWeight.bold),
//                                 )),
//                               ),
//                             ),