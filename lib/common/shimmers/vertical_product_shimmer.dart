import 'package:flutter/material.dart';
import 'package:mystore/common/layouts/grid_layout.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/common/shimmers/custom_shimmer.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
        itemCount: itemCount,
        itemBuilder: (context, index)
    =>
    const SizedBox(
      width: 180,
      child: Column(
        children: [
          CustomShimmerEffects(width: 180, height: 180),
          SizedBox(height: AppSizes.spaceBtwItems,),
          CustomShimmerEffects(width: 160, height: 15),
          SizedBox(height: AppSizes.spaceBtwItems/ 2,),
          CustomShimmerEffects(width: 110, height: 15),
        ],
      ),
    ),


  );
}}
