import 'package:boutiqueapp/Components/CustomButton/custom_button.dart';
import 'package:boutiqueapp/Components/CustomTextFormField/custom_text_form_field.dart';
import 'package:boutiqueapp/Components/FirebaseAuthServices/user_auth_services.dart';
import 'package:boutiqueapp/Providers/profile_provider.dart';
import 'package:boutiqueapp/Routes/app_navigation.dart';
import 'package:boutiqueapp/Routes/app_navigation_routes.dart';
import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:boutiqueapp/Utils/app_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final UserAuthServices _authServices = UserAuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SignUpProvider>(builder: (context, signUpProvider, child) {
        return SafeArea(
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
                      Image.asset(
                        '${AppConstants.assetImages}logo.png',
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
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                ),
                                Gap(2.h),
                                CustomTextFormField(
                                  controller: signUpProvider.namecontroller,
                                  hintText: 'Username',
                                  validator: (value) {
                                    if (value!.length < 3) {
                                      return 'Please enter minimum 3 characters';
                                    } else
                                      return null;
                                  },
                                ),
                                Gap(2.h),
                                CustomTextFormField(
                                  controller: signUpProvider.emailcontroller,
                                  hintText: 'Email',
                                  inputType: TextInputType.emailAddress,
                                ),
                                Gap(2.h),
                                CustomTextFormField(
                                  controller: signUpProvider.passcontroller,
                                  hintText: 'Password',
                                  obscureText: true,
                                  suffixWidget: Icon(Icons.remove_red_eye),
                                ),
                                Gap(6.h),
                                CustomButton(
                                  onPress: () {
                                    signUpProvider.saveCredentials();
                                    _authServices.signUp(
                                        signUpProvider.emailcontroller.text,
                                        signUpProvider.passcontroller.text,
                                        signUpProvider.namecontroller.text,
                                        context);
                                  },
                                  title: 'Sign Up',
                                  fontSize: 18.sp,
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
