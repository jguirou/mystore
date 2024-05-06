import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key, this.width = 400, this.height= 400,  this.radius= 400, this.padding = 0, this.child, this.backgroundColor = AppColors.textWhite, this.margin,
  });
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsets? margin;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}