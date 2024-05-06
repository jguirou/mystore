import 'package:flutter/material.dart';
import 'package:mystore/common/product_title_text.dart';
import 'package:mystore/common/products_card/rounded_container.dart';
import 'package:mystore/common/texts/product_price_text.dart';
import 'package:mystore/common/texts/section_heading.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../../common/chips/custom_choice_chip.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attribute pricing & description
        RoundedContainer(
          padding: const EdgeInsets.all(AppSizes.md),
          backgroundColor: dark ? AppColors.darkGrey : AppColors.grey,
          child: Column(
            children: [
              /// Title, price and stock status
              Row(
                children: [
                  const SectionHeading(
                    title: 'Variation:',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: AppSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Price
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Price:',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: AppSizes.spaceBtwItems,
                          ),

                          /// Actual price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: AppSizes.spaceBtwItems),

                          /// Sale Price
                          const ProductPriceText(price: '25'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Stock:',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: AppSizes.spaceBtwItems,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium!,
                          ),
                          const SizedBox(width: AppSizes.spaceBtwItems),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: AppSizes.spaceBtwItems,
                  ),
                ],
              ),

              /// Variation description
              ///
              const ProductTitleText(
                title:
                    'This is the description of the product and it can go up to max 4 lines.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),

        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),

        /// Attributes
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            Wrap(
              children: [
                CustomChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value){},
                ),
                CustomChoiceChip(
                  text: 'Red',
                  selected: false,
                  onSelected: (value){},
                ),
                CustomChoiceChip(
                  text: 'Grey',
                  selected: false,
                  onSelected: (value){},
                ),
              ],
            ),
          ],
        ),

         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              title: 'Size',
              showActionButton: false,
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  text: 'EU 34',
                  selected: true,
                  onSelected: (value){},
                ),
                CustomChoiceChip(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (value){},
                ),
                CustomChoiceChip(
                  text: 'EU 38',
                  selected: false,
                  onSelected: (value){},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
