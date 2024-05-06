import 'package:flutter/material.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utility.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Icons.search,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace)
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final void Function()? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: DeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? AppColors.dark
                      : AppColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
              border: showBorder ? Border.all(color: AppColors.grey) : null),
          child: Row(
            children: [
              Icon(icon, color: AppColors.darkGrey),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
