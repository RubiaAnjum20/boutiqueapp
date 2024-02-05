import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class Divider extends StatelessWidget{
  Divider({
    super.key,
  });

  @override
   Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.2,
            color: AppColors.greenColor
          )
        )
      ),

    );

   }
}