import 'package:flutter/material.dart';
import 'package:mystore/common/products_card/custom_rating_bar_indicator.dart';
import 'package:mystore/common/products_card/rounded_container.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/image_strings.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../utils/constants/sizes.dart';

class UserReviewsCard extends StatelessWidget {
  const UserReviewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(AppImages.cosmeticsIcon),

                ),
                const SizedBox(width: AppSizes.spaceBtwItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        ///  Review
        const SizedBox(height: AppSizes.spaceBtwItems),
        Row(
          children: [
            const CustomRatingBarIndicator(rating: 3.5),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text('01-Nov-2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. Iwas able to navigate and make purchase seamlessly. Great Job!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read more',
          trimExpandedText: 'Less',
          moreStyle:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),

        const SizedBox(height: AppSizes.spaceBtwItems),
        /// Company reviews
        RoundedContainer(
          backgroundColor: dark ? AppColors.darkGrey :  AppColors.grey,
          child: Padding(
              padding: const EdgeInsets.all(AppSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("My Store", style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(width: AppSizes.spaceBtwItems),
                    Text('01-Nov-2023', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                const ReadMoreText(
                  'Thank you for your kind words, John! we are delighted to hear about your smooth experience with our app',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'read more',
                  trimExpandedText: 'Less',
                  moreStyle:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.primary),
                  lessStyle:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.primary),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
