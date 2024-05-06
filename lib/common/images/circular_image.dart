import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
     this.width = 56,
     this.height = 56,
     this.padding = AppSizes.sm ,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.isNetworkImage = false,
    this.fit = BoxFit.cover,
  });

  final double width, height, padding;
  final Color? overlayColor;
  final Color? backgroundColor;
  final String image;
  final bool isNetworkImage;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? AppColors.black : AppColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        fit: fit,
        image: const AssetImage(AppImages.clothIcon),
        color: overlayColor,
      ),
    );
  }
}
