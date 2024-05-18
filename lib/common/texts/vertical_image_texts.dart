import 'package:flutter/material.dart';
import 'package:mystore/common/images/circular_image.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AppColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image;
  final String title;
  final Color textColor;

  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
        child: Column(
          children: [
            /// circular icon
            CircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: AppSizes.sm * 4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: HelperFunctions.isDarkMode(context)
                  ? AppColors.light
                  : AppColors.dark,
            ),
            const SizedBox(
              height: AppSizes.sm,
            ),
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
