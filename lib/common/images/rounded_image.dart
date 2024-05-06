import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width = 200,
    this.height= 200,
    required this.imageUrl,
    this.border,
    this.applyImageRadius = true,
    this.backGroundColor = AppColors.light,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = AppSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final BoxBorder? border;
  final bool applyImageRadius;
  final Color backGroundColor;
  final double borderRadius;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration:
        BoxDecoration(color: backGroundColor, border: border, borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
            borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
            child: Image(
              image: isNetworkImage ? NetworkImage(imageUrl) : (AssetImage(imageUrl)  as ImageProvider),
              fit: fit,
            )),
      ),
    );
  }
}