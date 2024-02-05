import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:boutiqueapp/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomImageContainer extends StatelessWidget {
  final String imageName;
  final VoidCallback onPress;
  const CustomImageContainer({
    required this.imageName,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 20.h,
        decoration: BoxDecoration(
            color: AppColors.lightGreenColor,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
            fit: BoxFit.cover, 
                image: AssetImage(
                    '${AppConstants.assetImages}${imageName}'))),
      ),
    );
  }
}