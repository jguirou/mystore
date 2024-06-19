
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/images/rounded_image.dart';
import 'package:mystore/common/products_card/rounded_container.dart';
import 'package:mystore/domain/controller/product_controller.dart';
import 'package:mystore/presentation/shop/product_detail/product_detail/ui/screen/product_detail_screen.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/enums.dart';
import 'package:mystore/utils/constants/image_strings.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../domain/entities/products/product_model.dart';
import '../icons/circular_icon.dart';
import '../product_title_text.dart';
import '../styles/shadow_style.dart';
import '../texts/brand_title_with_verified_icon.dart';
import '../texts/product_price_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=> Get.to(()=>  ProductDetailScreen(product: product,)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
            boxShadow: [ShadowStyle.verticalProductShadow],
            color: dark ? AppColors.darkGrey : AppColors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail, wishList button, discount tag
            RoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(AppSizes.sm),
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  /// Thumbnail
                   Center(
                     child: RoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                       isNetworkImage: true,
                                       ),
                   ),

                  /// sale tag
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.xs, vertical: AppSizes.xs),
                      radius: AppSizes.sm,
                      backgroundColor: AppColors.secondary.withOpacity(0.8),
                      child: Text('$salePercentage%',
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

            /// Details
             Padding(
              padding: const EdgeInsets.only(left: AppSizes.sm),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Product tilte
                  ProductTitleText(
                    title: product.title,
                    smallSize: true,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),

                  BrandTitleWithVerifiedIcon(
                    title: product.brand?.name ?? '',
                    brandTextSizes: TextSizes.medium,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Prices
                   Flexible(
                     child: Column(
                       children: [
                          if(product.productType == ProductType.single.toString() && product.salePrice > 0.0)
                            Text(
                              product.price.toString(),
                              style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                            ),
                         /// price show sale price as main price if sale exist
                         ProductPriceText(
                          price: controller.getProductPrice(product),
                                           ),
                       ],
                     ),
                   ),
                  Container(
                    decoration: const BoxDecoration(
                        color: AppColors.dark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSizes.cardRadiusMd),
                          bottomRight:
                              Radius.circular(AppSizes.productImageRadius),
                        )),
                    child: const SizedBox(
                        width: AppSizes.iconLg * 1.2,
                        height: AppSizes.iconLg * 1.2,
                        child: Center(
                            child: Icon(Icons.add, color: AppColors.white))),
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




