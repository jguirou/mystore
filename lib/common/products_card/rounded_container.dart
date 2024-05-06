import 'package:flutter/material.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/sizes.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.child,
      this.radius = AppSizes.cardRadiusLg,
      this.showBorder = false,
      this.borderColor = AppColors.borderPrimary,
      this.backgroundColor = AppColors.white,
      this.padding,
      this.margin});

  final double? width;
  final double? height;
  final Widget? child;
  final double radius;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
