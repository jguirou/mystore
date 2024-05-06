import 'package:flutter/material.dart';
import 'package:mystore/common/images/circular_image.dart';
import 'package:mystore/common/product_title_text.dart';
import 'package:mystore/common/texts/brand_title_with_verified_icon.dart';
import 'package:mystore/common/texts/product_price_text.dart';
import 'package:mystore/utils/constants/enums.dart';
import 'package:mystore/utils/constants/image_strings.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../../common/products_card/rounded_container.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale tag
            RoundedContainer(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.xs, vertical: AppSizes.xs),
              radius: AppSizes.sm,
              backgroundColor: AppColors.secondary.withOpacity(0.8),
              child: Text('25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: AppColors.black)),
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),

            /// Price
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            const ProductPriceText(
              price: '175',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        /// Title
        const ProductTitleText(title: 'Grey Nike Sport shoe'),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const ProductTitleText(title: 'Status:'),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            CircularImage(
              image: AppImages.shoeIcon,
              height: 32,
              width: 32,
              overlayColor: dark ? AppColors.white : AppColors.black,
            ),
            const BrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSizes: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
