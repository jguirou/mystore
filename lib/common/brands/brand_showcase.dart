import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../products_card/rounded_container.dart';
import 'brand_card.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
    required this.brandTitle,
    required this.brandSubtitle,
  });

  final List<String> images;
  final String brandTitle;
  final String brandSubtitle;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      padding: const EdgeInsets.all(AppSizes.md),
      showBorder: true,
      backgroundColor: Colors.transparent,
      borderColor: AppColors.darkGrey,
      child: Column(
        children: [
          /// Brand with products count
          BrandCard(
            showBorder: false,
            brandTitle: brandTitle,
            brandSubtitle: brandSubtitle,
          ),

          /// Brand top3 product images
          Row(
            children: images.map((e) {
              return brandTopProductImageWidget(e, context);

            }).toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: dark ? AppColors.darkGrey : AppColors.light,
        margin: const EdgeInsets.only(right: AppSizes.sm),
        padding: const EdgeInsets.all(AppSizes.md),
        child: Image(image: AssetImage(image)),
      ),
    );
  }
}