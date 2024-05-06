import 'package:flutter/material.dart';
import 'package:mystore/common/icons/circular_icon.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

class BottomAddToCard extends StatelessWidget {
  const BottomAddToCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppSizes.defaultSpace / 2,
          horizontal: AppSizes.defaultSpace),
      decoration: BoxDecoration(
        color: dark ? AppColors.darkGrey : AppColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSizes.cardRadiusLg),
          topRight: Radius.circular(AppSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircularIcon(
                backgroundColor: AppColors.darkGrey,
                icon: Icons.remove,
                color: AppColors.white,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              const CircularIcon(
                backgroundColor: AppColors.black,
                icon: Icons.add,
                color: AppColors.white,
                width: 40,
                height: 40,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(AppSizes.md),
              backgroundColor: AppColors.black,
              side: const BorderSide(color: AppColors.black)
            ),
            child: const Text('Add to cart'),
          )
        ],
      ),
    );
  }
}
