import 'package:flutter/cupertino.dart';

import '../layouts/grid_layout.dart';
import 'custom_shimmer.dart';

class BrandsShimmer extends StatelessWidget {
  const BrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
        mainAxisExtent: 80,
        itemCount: itemCount,
        itemBuilder: (_, __) => const CustomShimmerEffects(
              width: 300,
              height: 80,
            ));
  }
}
