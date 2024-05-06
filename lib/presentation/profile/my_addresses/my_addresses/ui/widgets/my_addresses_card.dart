import 'package:flutter/material.dart';

import '../../../../../../common/icons/circular_icon.dart';
import '../../../../../../common/products_card/rounded_container.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/helpers/helper_functions.dart';


class MyAddressesCard extends StatelessWidget {
  const MyAddressesCard({
    super.key,  this.selected =  false, required this.name, required this.phoneNumber, required this.address,

  });
  final bool selected;
  final String name;
  final String phoneNumber;
  final String address;



  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.md),
      child: RoundedContainer(
        padding:  const EdgeInsets.all(AppSizes.cardRadiusMd),
        backgroundColor: selected ? AppColors.primary.withOpacity(0.5): Colors.transparent,
        borderColor: selected ? Colors.transparent: dark ? AppColors.darkGrey: AppColors.dark,
        margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
        showBorder: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: Theme.of(context).textTheme.titleLarge),
                selected ?  CircularIcon(height: 30, width: 30,icon: Icons.done, size: AppSizes.md, backgroundColor: dark ? AppColors.white : AppColors.black, color: dark ? AppColors.black: AppColors.white,): const SizedBox(),
              ],
            ),

            Text(phoneNumber, style: Theme.of(context).textTheme.bodyMedium),
            Text(address, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis,maxLines: 2,softWrap: true,),



          ],
        ),
      ),
    );
  }
}