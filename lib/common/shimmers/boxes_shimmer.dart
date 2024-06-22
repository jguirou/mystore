import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';
import 'custom_shimmer.dart';

class BoxesShimmer extends StatelessWidget {
  const BoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: CustomShimmerEffects(width: 150, height: 110)),
            SizedBox(height: AppSizes.spaceBtwItems),
            Expanded(child: CustomShimmerEffects(width: 150, height: 110)),
            SizedBox(height: AppSizes.spaceBtwItems),
            Expanded(child: CustomShimmerEffects(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}