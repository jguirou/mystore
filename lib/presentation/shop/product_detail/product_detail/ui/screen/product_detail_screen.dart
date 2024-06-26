import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/texts/section_heading.dart';
import 'package:mystore/domain/entities/products/product_model.dart';
import 'package:mystore/utils/constants/enums.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

import '../../../product_reviews/ui/screen/product_reviews_screen.dart';
import '../widgets/bottom_add_to_card.dart';
import '../widgets/product_attribute.dart';
import '../widgets/product_image_slider.dart';
import '../widgets/product_meta_data.dart';
import '../widgets/rating_and_share.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const BottomAddToCard(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            ProductImageSlider(product: product,),

            /// Product details
            Padding(
              padding: const EdgeInsets.only(
                  left: AppSizes.defaultSpace,
                  right: AppSizes.defaultSpace,
                  bottom: AppSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share Button
                  const RatingAndShare(),

                  /// Price Title Stock & brand
                  ///
                   ProductMetaData(product: product),

                  /// Attributes
                  if(product.productType == ProductType.variable.toString())  ProductAttribute(product: product),
                  if(product.productType == ProductType.variable.toString()) const SizedBox(height: AppSizes.spaceBtwSections),

                  /// Checkout button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  /// Description
                  const SectionHeading(
                      title: 'Description', showActionButton: false),
                   ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  const Divider(),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionHeading(
                        title: 'Reviews(199)',
                        showActionButton: false,
                        onPressed: () {},
                      ),
                      IconButton(
                        onPressed: () {
                          print('jfbejfbfbvgfv');
                          Get.to(const ProductReviewsScreen());
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      )
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
