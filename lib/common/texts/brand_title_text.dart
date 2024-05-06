import 'package:flutter/material.dart';

import '../../utils/constants/enums.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    required this.title,
    required this.maxLines,
    required this.textAlign,
    required this.brandTextSizes,
    this.color,
  });

  final String title;
  final int maxLines;
  final TextAlign textAlign;
  final TextSizes brandTextSizes;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: brandTextSizes == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSizes == TextSizes.medium
          ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
          : brandTextSizes == TextSizes.large
          ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
          : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}