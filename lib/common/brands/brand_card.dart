import 'package:flutter/material.dart';
import 'package:mystore/common/products_card/rounded_container.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../images/circular_image.dart';
import '../texts/brand_title_with_verified_icon.dart';
class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    this.showBorder = true, this.onTap,
     this.brandTitle = 'Nike',  this.brandSubtitle = '256 products',
  });

  final bool showBorder;
  final void Function()? onTap;
  final String brandTitle;
  final String brandSubtitle;

  @override
  Widget build(BuildContext context) {
    final dark =  HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: const EdgeInsets.all(AppSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: CircularImage(
                image: AppImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: dark
                    ? AppColors.white
                    : AppColors.dark,
              ),
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems / 2,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                   BrandTitleWithVerifiedIcon(
                    title: brandTitle,
                    textAlign: TextAlign.start,
                    brandTextSizes: TextSizes.large,
                  ),
                  const SizedBox(
                    width: AppSizes.spaceBtwItems / 1.5,
                  ),
                  Text(
                    brandSubtitle,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}