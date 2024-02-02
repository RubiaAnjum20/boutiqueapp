import 'package:boutiqueapp/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/app_colors.dart';

class CustomImageButton extends StatelessWidget {
 final  VoidCallback onPress;
 final String title;
 final Color btnclr ;
 final double fontSize;
 final double buttonHeight;
 final double buttonwidth;
 final double buttonRadius;
 final Color fontColor;
 final String? imageName;


   CustomImageButton({
    required this.onPress,
    required this.title,
    this.btnclr = Colors.transparent,
    this.buttonHeight = 7,
    this.buttonwidth = 100,
    this.buttonRadius = 12,
    this.fontSize = 12,
    this.fontColor = Colors.white,
    this.imageName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        width: buttonwidth.w, //75
        height: buttonHeight.h, //7
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttonRadius),
          color: btnclr,
          border: Border.all(width: 2, color: AppColors.redBtnclr)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('${AppConstants.assetImages}$imageName.png'),
            Gap(2.h),
            Text(title, 
            style: TextStyle(
              fontSize: fontSize.sp, 
              color: fontColor,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold
              ),
              ),
          ],
        )
      ),
    );
  }
}