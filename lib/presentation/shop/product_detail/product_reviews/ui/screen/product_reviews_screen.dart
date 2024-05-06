import 'package:flutter/material.dart';
import 'package:mystore/common/appBar/app_bar.dart';
import 'package:mystore/presentation/shop/product_detail/product_reviews/ui/widgets/user_reviews_card.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../../../../../common/products_card/custom_rating_bar_indicator.dart';
import '../widgets/overall_product_ratings.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Reviews & ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "Ratings and reviews are verified and are from people who use the same type of device that you use."),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),

            /// Overall Product ratings
            const OverallProductRating(),
            const CustomRatingBarIndicator( rating: 2.5),
            Text('12,611', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: AppSizes.spaceBtwSections),

            /// User reviews list
            const UserReviewsCard(),
            const SizedBox(height: AppSizes.spaceBtwSections),
            const UserReviewsCard(),
          ],
        ),
      ),
    );
  }
}






