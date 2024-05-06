import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/presentation/shop/home/home/domain/home_controller/home_controller.dart';
import 'package:mystore/utils/constants/colors.dart';

import '../../../../../../common/custom_shapes/circular_container.dart';
import '../../../../../../common/images/rounded_image.dart';
import '../../../../../../utils/constants/sizes.dart';



class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.promoBanners,
  });

  final List<String> promoBanners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider.builder(

          itemCount: promoBanners.length,
          itemBuilder: (context, _, __) {

            return Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: RoundedImage(
                imageUrl: promoBanners[_],
              ),
            );
          },
          options: CarouselOptions(
              viewportFraction: 1, height: AppSizes.imageCarouseHeight,
            onPageChanged: (index, _)=> controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Center(
          child: Obx(
            ()=> Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < promoBanners.length; i++)
                   CircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: AppSizes.md),
                    backgroundColor: controller.carousalCurrentIndex.value == i ? AppColors.primary : AppColors.grey,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
