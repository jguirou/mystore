import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';
import 'custom_shimmer.dart';

class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            CustomShimmerEffects(width: 50, height: 50, radius: 50,),
            SizedBox(height: AppSizes.spaceBtwItems,),
            Column(
              children: [
                CustomShimmerEffects(width: 100, height: 15),
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                CustomShimmerEffects(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}