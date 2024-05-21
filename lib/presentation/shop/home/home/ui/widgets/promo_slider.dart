import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/domain/controller/banner_controller.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/shimmer/custom_shimmer.dart';

import '../../../../../../common/custom_shapes/circular_container.dart';
import '../../../../../../common/images/rounded_image.dart';
import '../../../../../../utils/constants/sizes.dart';



class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      (){
        // Loader
        if(controller.isLoading.value) return const CustomShimmerEffects(width: double.infinity, height: 190);

        // No data found
        if(controller.banners.isEmpty){
          return const Center(child: Text('No data found'),);
        } else {
          return Column(

            children: [
              CarouselSlider(
                items: controller.banners.map((banner) => RoundedImage(
                  imageUrl: banner.imageUrl,
                  isNetworkImage: true,
                  onPressed: ()=> Get.toNamed(banner.targetScreen),
                ),).toList(),

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
                      for (int i = 0; i < controller.banners.length; i++)
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
    );
  }
}
