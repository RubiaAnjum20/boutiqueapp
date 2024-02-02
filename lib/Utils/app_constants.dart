import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppConstants{
  static const String assetIcons = 'assets/icons/';
  static const String assetImages = 'assets/images/';
  static const String dressImages = 'assets/images/dresses/';
  static const String assetSvgIcons = 'assets/SvgIcons/';
  static const String textFont = 'Montserrat';

  static const int pageSize = 15;
  static const kDefaultPadding = 20.0;
  static EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h);

  static EdgeInsets verticalPadding =  EdgeInsets.symmetric(vertical: 2.h);
  static EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 4.w);

  //Screen Const
  static const String dummyNetworkImageUrl = "https://dummyimage.com/600x400/000/fff&text=Lorem+ipsum";
  static const String noInternetMsg = "NoInternet";
}