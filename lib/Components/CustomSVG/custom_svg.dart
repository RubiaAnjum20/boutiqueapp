import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:boutiqueapp/Utils/app_constants.dart';

class CustomSvg extends StatelessWidget {
  final double? width;
  final double? height;
  final String iconName;
  final Color? color;
  final TextDirection textDirection;

  const CustomSvg({
    super.key,
    this.width,
    this.height,
    required this.iconName,
    this.color,
    this.textDirection = TextDirection.ltr,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      '${AppConstants.assetSvgIcons}$iconName.svg',
      width: width,
      height: height,
      fit: BoxFit.contain,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      matchTextDirection: true,
    );
  }
}
