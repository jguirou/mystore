import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mystore/common/images/circular_image.dart';
import 'package:mystore/common/product_title_text.dart';
import 'package:mystore/common/texts/brand_title_with_verified_icon.dart';
import 'package:mystore/common/texts/product_price_text.dart';
import 'package:mystore/domain/controller/product_controller.dart';
import 'package:mystore/utils/constants/enums.dart';
import 'package:mystore/utils/constants/image_strings.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../../common/products_card/rounded_container.dart';
import '../../../../../../domain/entities/products/product_model.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
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
              child: Text('$salePercentage%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: AppColors.black)),
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),

            /// Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),

            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(
                width: AppSizes.spaceBtwItems,
              ),
            ProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        /// Title
        ProductTitleText(title: product.title),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const ProductTitleText(title: 'Status:'),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            CircularImage(
              isNetworkImage: true,
              image: product.brand != null ?  product.brand!.image : '',
              height: 32,
              width: 32,
              overlayColor: dark ? AppColors.white : AppColors.black,
            ),
             BrandTitleWithVerifiedIcon(
              title: product.brand != null ?  product.brand!.name : '',
              brandTextSizes: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
