import 'package:flutter/material.dart';
import 'package:mystore/utils/constants/colors.dart';

import '../../../../../../common/texts/section_heading.dart';
import '../../../../../../utils/constants/sizes.dart';
class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: 'Shipping address',
          buttonTitle: 'Change',
          onPressed: (){},
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2,),
        Text('My Store', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: AppSizes.spaceBtwItems / 2,),
        Row(

          children: [
            const Icon(Icons.phone, color: AppColors.grey, size: 16),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text('+337580000', style: Theme.of(context).textTheme.bodyMedium),

          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2,),
        Row(

          children: [
            const Icon(Icons.location_history, color: AppColors.grey, size: 16),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(child: Text('54 bis Rue Raoul Follereau, 78120 Rambouillet', style: Theme.of(context).textTheme.bodyMedium,softWrap: true),),

          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2,),
      ],
    );
  }
}
