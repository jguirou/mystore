import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/products_card/rounded_container.dart';
import 'package:mystore/domain/controller/product_controller.dart';
import 'package:mystore/domain/entities/products/product_model.dart';

import '../../presentation/shop/product_detail/product_detail/ui/screen/product_detail_screen.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../icons/circular_icon.dart';
import '../images/rounded_image.dart';
import '../product_title_text.dart';
import '../texts/brand_title_with_verified_icon.dart';
import '../texts/product_price_text.dart';
class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=> Get.to(()=>  ProductDetailScreen(product: ProductModel.empty(),)),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.productImageRadius),

            color: dark ? AppColors.darkGrey : AppColors.softGrey),
        child: Row(
          children: [
            /// Thumbnail, wishList button, discount tag
            Expanded(
              child: RoundedContainer(
                height: 180,
                padding: const EdgeInsets.all(AppSizes.sm),
                backgroundColor: dark ? AppColors.dark : AppColors.light,
                child: Stack(
                  children: [
                    /// Thumbnail
                    const RoundedImage(
                      imageUrl: AppImages.promBanner2,
                      applyImageRadius: true,
                    ),

                    /// sale tag
                    Positioned(
                      top: 12,
                      child: RoundedContainer(
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
                    ),

                    /// Favourite icon button
                    const Positioned(
                        right: 0,
                        top: 0,
                        child: CircularIcon(
                          icon: Icons.favorite,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
            ),

            /// Details
             Expanded(
               child: Padding(
                padding: const EdgeInsets.only(left: AppSizes.sm),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Product tilte
                    const ProductTitleText(
                      title: 'Grey Nike sport shoe gere Grey Nike sport shoe zgrfrgfrtrtrt',
                      smallSize: true,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems / 2),

                    const BrandTitleWithVerifiedIcon(
                      title: 'Nike',
                      brandTextSizes: TextSizes.small,
                      textAlign: TextAlign.left,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: AppSizes.sm),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// prices
                           const ProductPriceText(
                            price: "119.99",
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: AppColors.dark,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(AppSizes.cardRadiusMd),
                                  bottomRight:
                                  Radius.circular(AppSizes.productImageRadius),
                                )),
                            child:  const SizedBox(
                                width: AppSizes.iconLg * 1.2,
                                height: AppSizes.iconLg * 1.2,
                                child: Center(
                                    child: Icon(Icons.add, color: AppColors.white))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                           ),
             ),



          ],
        ),
      ),
    );
  }
}
