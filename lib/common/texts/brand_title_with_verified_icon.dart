import 'package:flutter/material.dart';
import 'package:mystore/utils/constants/colors.dart';

import '../../utils/constants/enums.dart';
import '../../utils/constants/sizes.dart';
import 'brand_title_text.dart';

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = AppColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,

      children: [
        /// brand text
        Flexible(
          child: BrandTitleText(
            title: title,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSizes: brandTextSizes,
          ),
        ),
        const SizedBox(width: AppSizes.xs),
        Icon(
          Icons.verified,
          color: iconColor,
          size: AppSizes.iconXs,
        ),
      ],
    );
  }
}