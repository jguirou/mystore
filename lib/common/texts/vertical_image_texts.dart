import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key, required this.image, required this.title, this.textColor = AppColors.white, this.backgroundColor, this.onTap,
  });

  final String image;
  final String title;
  final Color textColor ;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(AppSizes.sm),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: backgroundColor ?? (dark ? AppColors.black: AppColors.white),
              ),
              child:  Center(
                child: Image(
                    image: AssetImage(image), fit: BoxFit.cover, color: dark ? AppColors.light: AppColors.dark),
              ),
            ),
            const SizedBox(height: AppSizes.sm,),
            SizedBox(
                width: 55,
                child: Text(title, style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis,)),
          ],
        ),
      ),
    );
  }
}