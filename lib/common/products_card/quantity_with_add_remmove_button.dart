import 'package:flutter/material.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../icons/circular_icon.dart';
class QuantityWithAddRemoveButton extends StatelessWidget {
  const QuantityWithAddRemoveButton({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Row(
          children: [
            CircularIcon(
              size: AppSizes.md,
              icon: Icons.remove,
              color: AppColors.white,
              backgroundColor:
              dark ? AppColors.darkGrey : AppColors.grey,
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text('1', style: Theme.of(context).textTheme.titleSmall,),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            const CircularIcon(
              size: AppSizes.md,
              icon: Icons.add,
              color: AppColors.white,
              backgroundColor: AppColors.primary,
            ),
          ],
        ),
      ],
    );
  }
}