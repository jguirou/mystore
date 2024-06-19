import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mystore/domain/controller/images_controller.dart';

import '../../../../../../common/appBar/app_bar.dart';
import '../../../../../../common/curved_edges/curved_edges_widget.dart';
import '../../../../../../common/icons/circular_icon.dart';
import '../../../../../../common/images/rounded_image.dart';
import '../../../../../../domain/entities/products/product_model.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductsImages(product);

    return CurvedEdgesWidget(
      child: Container(
        color: dark ? AppColors.darkGrey : AppColors.light,
        child: Stack(
          children: [
            /// Main large image
            SizedBox(
                height: 400,
                child: Padding(
                  padding:
                      const EdgeInsets.all(AppSizes.productImageRadius * 2),
                  child: Center(child: Obx(() {
                    final image = controller.selectProductImage.value;
                    return GestureDetector(
                      onTap: ()=>controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  })),
                )),

            /// Image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: AppSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (__, ___) => const SizedBox(
                    width: AppSizes.spaceBtwItems,
                  ),
                  itemCount: images.length,
                  itemBuilder: (_, index) {
                    return Obx(
                        (){
                          final imageSelected = controller.selectProductImage.value == images[index];
                          return RoundedImage(
                              width: 80,
                              isNetworkImage: true,
                              backGroundColor:
                              dark ? AppColors.dark : AppColors.white,
                              border: Border.all(color: imageSelected ? AppColors.primary: Colors.transparent),
                              padding: const EdgeInsets.all(AppSizes.sm),
                              onPressed: ()=>controller.selectProductImage.value = images[index],
                              imageUrl: images[index]);
                        }
                    );
                  },
                ),
              ),
            ),

            /// Appbar icons
            const CustomAppBar(
              showBackArrow: true,
              actions: [
                CircularIcon(
                  icon: Icons.favorite,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
