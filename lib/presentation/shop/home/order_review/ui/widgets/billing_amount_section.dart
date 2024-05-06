import 'package:flutter/material.dart';
import 'package:mystore/utils/constants/sizes.dart';
class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2,),
        /// Shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2,),
        /// Tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2,),
        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$318', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
