import 'package:flutter/material.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/common/shimmers/custom_shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key,  this.itemCount = 6});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_,__)=> const SizedBox(width: AppSizes.spaceBtwItems,),
          itemBuilder: (_,__){
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              CustomShimmerEffects(width: 55, height: 55, radius: 55),
              SizedBox(height: AppSizes.spaceBtwItems / 2),

              /// Text
              CustomShimmerEffects(width: 55, height: 8),
            ],
          );
          }


      ),
    );
  }
}
