import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../images/rounded_image.dart';
import '../product_title_text.dart';
import '../texts/brand_title_with_verified_icon.dart';


class CartItem extends StatelessWidget {
  const CartItem({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Image
        RoundedImage(
          imageUrl: AppImages.cosmeticsIcon,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(AppSizes.sm),
          backGroundColor:
          dark ? AppColors.darkGrey : AppColors.light,
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const BrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child: ProductTitleText(
                    title: 'Grey Nike shoe', maxLines: 1),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Green ',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'EU 34',
                    style: Theme.of(context).textTheme.bodyLarge),
              ])),
            ],
          ),
        ),
      ],
    );
  }
}