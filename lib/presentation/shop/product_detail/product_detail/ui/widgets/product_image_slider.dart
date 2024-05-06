import 'package:flutter/material.dart';

import '../../../../../../common/appBar/app_bar.dart';
import '../../../../../../common/curved_edges/curved_edges_widget.dart';
import '../../../../../../common/icons/circular_icon.dart';
import '../../../../../../common/images/rounded_image.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return CurvedEdgesWidget(
      child: Container(
        color: dark ? AppColors.darkGrey : AppColors.light,
        child: Stack(
          children: [
            /// Main large image
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.productImageRadius * 2),
                  child: Center(
                      child: Image(
                    image: AssetImage(AppImages.productImage1),
                  )),
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
                  itemCount: 6,
                  itemBuilder: (_, index) {
                    return RoundedImage(
                        width: 80,
                        backGroundColor:
                            dark ? AppColors.dark : AppColors.white,
                        border: Border.all(color: AppColors.primary),
                        padding: const EdgeInsets.all(AppSizes.sm),
                        imageUrl: AppImages.productImage1);
                  },
                ),
              ),
            ),

            /// Appbar icons
            const CustomAppBar(
              showBackArrow: true,
              actions: [
                CircularIcon(
                  icon: Icons.heart_broken,
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
