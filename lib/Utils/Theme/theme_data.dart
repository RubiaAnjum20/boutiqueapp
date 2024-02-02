import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: AppColors.lightPinkColor,
    primary: AppColors.lightGreenColor,
    secondary: AppColors.kTextLightColor
  )

);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: AppColors.greyColor,
    primary: AppColors.tealColor,
    secondary: AppColors.magentaColor
  )
);