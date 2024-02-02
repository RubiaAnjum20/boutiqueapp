import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/app_colors.dart';

class CustomButton extends StatelessWidget {
 final  VoidCallback onPress;
 final String title;
 final Color btnclr ;
 final double fontSize;
 final double buttonHeight;
 final double buttonwidth;
 final double buttonRadius;
 final Color fontColor;


   CustomButton({
    required this.onPress,
    required this.title,
    this.btnclr = Colors.transparent,
    this.buttonHeight = 7,
    this.buttonwidth = 100,
    this.buttonRadius = 12,
    this.fontSize = 12,
    this.fontColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        width: buttonwidth, //75
        height: buttonHeight, //7
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttonRadius),
          color: btnclr,
        ),
        child: Text(title, 
        style: TextStyle(
          fontSize: fontSize.sp, 
          color: fontColor,
          fontWeight: FontWeight.bold
          ),
          )
      ),
    );
  }
}