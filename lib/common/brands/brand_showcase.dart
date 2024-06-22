import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mystore/common/shimmers/custom_shimmer.dart';
import 'package:mystore/domain/entities/brands/brand_model.dart';
import 'package:mystore/presentation/shop/store/brand/ui/screens/brand_products.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../products_card/rounded_container.dart';
import 'brand_card.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
    required this.brand,
  });
  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Get.to(()=> BrandProducts(brand: brand)),
      child: RoundedContainer(
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
                brand: brand,
            ),

            /// Brand top3 product images
            Row(
              children: images.map((e) {
                return brandTopProductImageWidget(e, context);

              }).toList(),
            )
          ],
        ),
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
        child: CachedNetworkImage(
          fit: BoxFit.contain,
            imageUrl: image,
          progressIndicatorBuilder: (context,url,downloadProgress)=> const CustomShimmerEffects(width: 100, height: 100),
          errorWidget: (context, url, error)=> const Icon(Icons.error),

        ),
      ),
    );
  }
}